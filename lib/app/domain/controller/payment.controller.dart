import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:insurance_app/app/domain/controller/controllers.dart';
import 'package:insurance_app/app/domain/interface/interfaces.dart';
import 'package:insurance_app/app/domain/model/models.dart';
import 'package:insurance_app/app/domain/service/services.dart';

class PaymentController extends GetxController {
  final IPayment _paymentService = PaymentService();

  final paymentProviders = <PaymentProvider>[].obs;

  RxBool isLoading = true.obs;

  RxBool isGetWalletLoading = true.obs;

  final selectedProvider = PaymentProvider().obs;

  RxBool showDetails = false.obs;

  final computedRates = ComputedRates().obs;

  final userWallet = UserWallet().obs;

  setPaymentProviders(value) {
    paymentProviders.value = value;
    update();
  }

  setIsLoading(value) {
    isLoading.value = value;
    update();
  }

  setShowDetails(value) {
    showDetails.value = value;
    update();
  }

  setSelectedPaymentProvider(PaymentProvider value) async {
    selectedProvider.value = value;
    update();

    inspect(value);

    if (value.productGuid != null) {
      await computeCpfRates();
    }

    if (value.productCode == 'W2WALT') {
      await getEWalletDetails();
    }
  }

  setComputedRates(ComputedRates value) {
    computedRates.value = value;
    update();
  }

  setUserWallet(UserWallet value) {
    userWallet.value = value;
    update();
  }

  setIsGetWalletLoading(value) {
    isGetWalletLoading.value = value;
    update();
  }

  getPaymentProviders() {
    setIsLoading(true);

    _paymentService.getListOfPaymentProvider().then((result) async {
      var filtered = result.where((pp) => pp.productCode != 'UBBILLS').toList();

      setPaymentProviders(filtered);
      setIsLoading(false);
    }).catchError((e) {
      setIsLoading(false);
    });
  }

  computeCpfRates() {
    setShowDetails(false);

    var payload = {
      "limitMinimum": selectedProvider.value.limitMinimum.toInt(),
      "limitMaximum": selectedProvider.value.limitMaximum.toInt(),
      "localValue": selectedProvider.value.localValue.toInt(),
      "foreignValue": selectedProvider.value.foreignValue.toInt(),
      "isPercentage": selectedProvider.value.isPercentage,
      "paymentType": 2,
      "payorId": Get.find<ProfileController>().company.value.companyId,
      "payeeId":
          Get.find<InsuranceController>().selectedInsuranceProvider.value.guid,
      "totalAmount": Get.find<InsuranceController>()
          .selectedInsuranceProvider
          .value
          .containerRateList!
          .totalPublishedAmount,
    };

    _paymentService
        .computeCpfRates(
      payload: payload,
    )
        .then((result) {
      setComputedRates(result);
      setShowDetails(true);
    }).catchError((e) {
      setShowDetails(true);
    });
  }

  void submitPayment() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white12,
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(
                    strokeWidth: 7.0,
                    backgroundColor: const Color.fromRGBO(
                      2,
                      39,
                      108,
                      1,
                    ),
                    color: const Color.fromRGBO(
                      237,
                      108,
                      77,
                      1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please wait...",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    var reservationDetails =
        Get.find<ReservationDetailsController>().reservationDetails.value;
    var selectedInsurance =
        Get.find<InsuranceController>().selectedInsuranceProvider.value;
    var selectedPaymentProvider = selectedProvider.value;
    var computedRate = computedRates.value;

    int invoiceStatusId = 9;

    switch (selectedPaymentProvider.productCode) {
      case "W2WALT":
        invoiceStatusId = 8;
        break;
    }

    var notifyPartyNames = reservationDetails.seaFreightTicket?.notifyParties!
        .map((e) => e.companyName)
        .toList();

    var tempContainers = reservationDetails.containers!.map((e) => e).toList();

    var insuredContainers = selectedInsurance.containerRateList?.containerRates
        ?.map((e) => e)
        .toList();

    var containerPayload = [];

    for (var tContainers in tempContainers) {
      for (var iContainers in insuredContainers!) {
        if (tContainers.typeId == iContainers.containerTypeGuid &&
            tContainers.sizeId == iContainers.containerSizeGuid) {
          var hasFound = containerPayload
              .indexWhere((cp) => cp["containerId"] == tContainers.containerId);

          if (hasFound == -1) {
            containerPayload.add(
              {
                "containerId": tContainers.containerId,
                "containerTypeGuid": tContainers.typeId,
                "containerTypeName": tContainers.type,
                "containerSizeGuid": tContainers.sizeId,
                "containerSizeName": tContainers.size,
                "qty": tContainers.quantity,
                "ownership": tContainers.ownership,
                "packagingQuantity": tContainers.packagingQuantity,
                "weight": tContainers.weight,
                "weightUnitOfMeasurementId":
                    tContainers.weightUnitOfMeasurementId,
                "volumeUnitOfMeasurementId":
                    tContainers.volumeUnitOfMeasurementId,
                "volume": tContainers.volume,
                "dimensionsUnitOfMeasurementId":
                    tContainers.dimensionsUnitOfMeasurementId,
                "dimensionLength": tContainers.dimensionLength,
                "dimensionWidth": tContainers.dimensionWidth,
                "dimensionHeight": tContainers.dimensionHeight,
                "reeferTemperature": tContainers.reeferTemperature,
                "reeferTemperatureUnitOfMeasurementId":
                    tContainers.reeferTemperatureUnitOfMeasurementId,
                "packagingTypeId": tContainers.packagingTypeId,
                "packagingType": tContainers.packagingType,
                "containerNumber": tContainers.containerNumber,
                "sealNumber": tContainers.sealNumber,
                "loadType": tContainers.loadType,
                "declaredValue": 0,
                "gpsUnitNumber": null,
              },
            );
          }
        }
      }
    }

    var format = DateFormat('MMMM d, yyyy hh:mm:ss a');

    var dateFormatted = format.format(reservationDetails.eta);

    var payload = {
      'reservationId': reservationDetails.reservationId, //insurance provider
      'productTypeGuid': selectedInsurance.productTypeGuid,
      'productTypeName': selectedInsurance.productTypeName,
      'productGuid': selectedInsurance.productGuid,
      'providerGuid': selectedInsurance.guid,
      'providerCode': selectedInsurance.code,
      'providerName': selectedInsurance.name,
      'providerImage': selectedInsurance.imgUrl,
      'providerAddressLine': selectedInsurance.address,
      'providerLandline':
          '${selectedInsurance.landLinePrefix}${selectedInsurance.landLine}',
      'providerFax':
          '${selectedInsurance.faxNumberPrefix}${selectedInsurance.faxNumber}',
      'providerCountryCode': selectedInsurance.countryCode,
      'providerCountryName': selectedInsurance.country,
      'bookingPartyId': reservationDetails.bookingPartyId, //booking party
      'bookingPartyName': reservationDetails.bookingParty,
      'bookingPartyImage': reservationDetails.bookingPartyImage,
      'bookingPartyAddressLine':
          reservationDetails.seaFreightTicket?.bookingParty!.companyName,
      'bookingPartyLandline': reservationDetails
          .seaFreightTicket?.bookingParty?.contactDetails?.phone,
      'bookingPartyFax': reservationDetails
          .seaFreightTicket?.bookingParty?.contactDetails?.fax,
      'bookingPartyCountryId': reservationDetails
          .seaFreightTicket?.bookingParty?.addressDetails?.countryId,
      'bookingPartyCountryCode': '',
      'bookingPartyCountryName': reservationDetails
          .seaFreightTicket?.bookingParty?.addressDetails?.countryName,
      'serviceTicketId':
          reservationDetails.seaFreightTicket?.serviceTicketId, // sr details
      'seaFreightServiceTicketId': reservationDetails.seaFreightTicket
          ?.serviceTicketId, //if sea freight, seaFreightServiceTicketId === service ticket id
      'truckingServiceTicketId':
          null, //set to null/static value if not available
      'serviceTypeId': null,
      'serviceType': null,
      'shipmentTypeId': reservationDetails.shipmentTypeId,
      'shipmentType': reservationDetails.shipmentType,
      'commodityId': reservationDetails.commodityId,
      'commodityDescription':
          reservationDetails.commodityDescription, //editable hs desc
      'shipperId': reservationDetails.shipperId, // shipper details
      'shipperName': reservationDetails.shipper,
      'shipperImage': reservationDetails.shipperImage,
      'shipperAddressLine':
          reservationDetails.seaFreightTicket!.shipper?.companyName,
      'shipperLandline':
          '${reservationDetails.seaFreightTicket!.shipper?.contactDetails?.phonePrefix} ${reservationDetails.seaFreightTicket!.shipper?.contactDetails?.phone}',
      'shipperFax':
          '${reservationDetails.seaFreightTicket!.shipper?.contactDetails?.faxPrefix} ${reservationDetails.seaFreightTicket!.shipper?.contactDetails?.fax}',
      'shipperCountryId': 0,
      'shipperCountryCode': null,
      'shipperCountryName': null,
      'shippingLineId':
          reservationDetails.seaFreightTicket?.shippingLine?.guid, // sl details
      'shippingLineName':
          reservationDetails.seaFreightTicket?.shippingLine?.companyName,
      'shippingLineImage':
          reservationDetails.seaFreightTicket?.shippingLine?.imageUrl,
      'shippingLineAddressLine':
          reservationDetails.seaFreightTicket?.shippingLine?.addresses,
      'shippingLineLandline':
          '${reservationDetails.seaFreightTicket?.shippingLine?.contactDetails?.phonePrefix} ${reservationDetails.seaFreightTicket?.shippingLine?.contactDetails?.phone}',
      'shippingLineFax':
          '${reservationDetails.seaFreightTicket?.shippingLine?.contactDetails?.faxPrefix} ${reservationDetails.seaFreightTicket?.shippingLine?.contactDetails?.fax}',
      'shippingLineCountryId': reservationDetails
          .seaFreightTicket?.shippingLine!.addressDetails!.countryId,
      'shippingLineCountryCode': null,
      'shippingLineCountryName': null,
      'destinationShippingAgencyId':
          reservationDetails.destinationShippingAgencyId,
      'destinationShippingAgencyName':
          reservationDetails.destinationShippingAgencyName,
      'destinationShippingAgencyImage':
          reservationDetails.destinationShippingAgencyImage,
      'destinationShippingAgencyAddressLine':
          reservationDetails.destinationShippingAgencyAddressLine,
      'destinationShippingAgencyLandline':
          reservationDetails.destinationShippingAgencyLandline,
      'destinationShippingAgencyFax':
          reservationDetails.destinationShippingAgencyFax,
      'destinationShippingAgencyCountryId':
          reservationDetails.destinationShippingAgencyCountryId,
      'destinationShippingAgencyCountryCode':
          reservationDetails.destinationShippingAgencyCountryCode,
      'destinationShippingAgencyCountryName':
          reservationDetails.destinationShippingAgencyCountryName,
      'consigneeId': reservationDetails
          .seaFreightTicket?.consignee!.guid, // consignee details
      'consigneeName':
          reservationDetails.seaFreightTicket?.consignee!.companyName,
      'consigneeImage':
          reservationDetails.seaFreightTicket?.consignee!.imageUrl,
      'consigneeAddressLine':
          reservationDetails.seaFreightTicket?.consignee!.addresses,
      'consigneeLandline':
          reservationDetails.seaFreightTicket?.consignee!.contactDetails?.phone,
      'consigneeFax':
          reservationDetails.seaFreightTicket?.consignee!.contactDetails?.fax,
      'consigneeCountryId': reservationDetails
          .seaFreightTicket?.consignee!.addressDetails?.countryId,
      'consigneeCountryCode': null,
      'consigneeCountryName': null,
      'notifyPartyIds': reservationDetails.notifyPartyIds, //np details
      'notifyPartyNames': notifyPartyNames!.join(','),
      'shipmentDate':
          null, // shipment details // not available on inbound booking so set this to null
      'eta': dateFormatted,
      'etd': null, // not available on inbound booking so set this to null
      'origin': reservationDetails.loadingAddress,
      'originAddress': reservationDetails.loadingAddress,
      'originShippingAgencyId': reservationDetails.originShippingAgencyId,
      'originShippingAgencyName': reservationDetails
          .originShippingAgencyName, //set to null/static value if not available
      'destination': reservationDetails.deliveryAddress,
      'destinationAddress': reservationDetails.deliveryAddress,
      'portOfLoadingId': reservationDetails.portOfLoadingId,
      'portOfLoadingName': reservationDetails.portOfLoadingName,
      'portOfLoadingLoCode': reservationDetails.portOfLoadingLoCode,
      'portOfDischargeId': reservationDetails.portOfDischargeId,
      'portOfDischargeName': reservationDetails.portOfDischargeName,
      'portOfDischargeLoCode': reservationDetails.portOfDischargeLoCode,
      'containerOwnership': reservationDetails.containerOwnership,
      'blNumber': reservationDetails.blNumber,
      'hsCode': reservationDetails.hsCode,
      'hsDescription':
          reservationDetails.commodityDescription, //non editable hs desc
      'containerList': containerPayload,
      'payerId': reservationDetails.bookingPartyId, //booking party id
      'receiverId': selectedInsurance.guid, //selected insurance provider
      'paymentOptionId': 1, //set to default 1 (prepaid) as per sir Jaycee
      'paymentStatusId': 4, // regardless if manual or online
      'invoiceStatusId':
          invoiceStatusId, // 8 for w2w, 9 for fpx/bills/upay, 1 for manual
      'paymentReferenceNumber':
          '', // dummy for online, real refNumber for manual
      'countryCode': reservationDetails
          .bookingPartyCountryCode, // should be payor's country code
      'currencyCode': reservationDetails
          .bookingPartyCurrencyCode, // should be payor's currency code
      'documentUrl': null,
      'paidAmount': selectedInsurance.containerRateList?.totalPublishedAmount,
      'paymentDate': DateTime.now().toUtc().toString(),
      'remarks': null,
      'currencyName': null,
      'currencyLeftSymbol': null,
      'paymentOption': 2, // 0 all, 1 manual, 2 online, 3 fsc
      'paymentProviderId': selectedPaymentProvider.providerId,
      'paymentProviderGuid': selectedPaymentProvider.providerId,
      'paymentProviderName': selectedPaymentProvider.providerName,
      'paymentProviderPrefix': selectedPaymentProvider
          .providerPrefix, //should be provider code instead of providerPrefix as per sir Rupert
      'paymentProviderProductId': selectedPaymentProvider.productId,
      'paymentProviderProductGuid': selectedPaymentProvider.productGuid,
      'paymentProviderProductName': selectedPaymentProvider.productName,
      'paymentTypeId': selectedPaymentProvider.paymentTypeId,
      'paymentTypeCode': selectedPaymentProvider.paymentTypeCode,
      'paymentTypeName': selectedPaymentProvider.paymentTypeName,
      'paymentProviderLogo': selectedPaymentProvider.providerLogo,
      'paymentProviderProductImageUrl': selectedPaymentProvider.productImageUrl,
      'paymentInstruction': selectedPaymentProvider.instruction,
      'paymentProviderProductCode': selectedPaymentProvider.productCode,
      'payorEmailAddress':
          reservationDetails.seaFreightTicket?.bookingParty?.emailAddress,
      'payorContactNumber':
          '${reservationDetails.seaFreightTicket?.bookingParty?.contactDetails?.mobilePrefix}${reservationDetails.seaFreightTicket?.bookingParty?.contactDetails?.mobile}',
      'redirectUrl':
          'google.com', // if this value is replaced, kindly inform BE since this is being used in Upay payment
      'chargeFee': computedRate.convenienceFee,
      'platformFee': computedRate.platformFee
    };

    _paymentService
        .submitInsuranceTransaction(
      payload: payload,
      serviceRoleId: Get.find<ProfileController>().company.value.service,
    )
        .then((value) async {
      Get.back();

      switch (selectedPaymentProvider.productCode) {
        case "W2WALT":
          if (value.paymentResponse["statusCode"] == 200) {
            Get.snackbar(
              'Success',
              value.paymentResponse["message"],
              colorText: Colors.white,
              backgroundColor: Colors.green[500],
              duration: const Duration(
                seconds: 2,
              ),
            );
          } else {
            Get.snackbar(
              'Error',
              value.paymentResponse["message"],
              colorText: Colors.white,
              backgroundColor: Colors.red[400],
              duration: const Duration(
                seconds: 2,
              ),
            );
          }

          Get.find<ReservationDetailsController>().getReservationDetails();

          Timer(const Duration(milliseconds: 1000), () async {
            Get.close(4);
          });
          break;

        case "UPay":
          Timer(const Duration(milliseconds: 1000), () async {
            var whiteLabelUrl = value.paymentResponse["data"]["whiteLabelUrl"];

            await launch(whiteLabelUrl);
          });

          break;
      }
    }).catchError((e) {
      inspect(e);
      Get.snackbar(
        'Something Went Wrong!',
        e.message,
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    });
  }

  getEWalletDetails() async {
    setIsGetWalletLoading(true);

    _paymentService
        .getUserWallet(
            payeeId: Get.find<InsuranceController>()
                .selectedInsuranceProvider
                .value
                .guid,
            payorId: Get.find<ProfileController>().company.value.companyId,
            currencyCode: Get.find<InsuranceController>()
                .selectedInsuranceProvider
                .value
                .currencyCode)
        .then((result) {
      setIsGetWalletLoading(false);
      if (result.isNotEmpty) {
        setUserWallet(result[0]);
      }
    }).catchError((e) {
      setIsGetWalletLoading(false);
    });
  }

  Widget actionButton() {
    if (showDetails.value && selectedProvider.value.productCode != 'W2WALT') {
      return paymentButton();
    }

    if (showDetails.value &&
        !isGetWalletLoading.value &&
        selectedProvider.value.productCode == 'W2WALT') {
      return paymentButton(
        isDisabled: userWallet.value.availableBalance <=
            computedRates.value.grandTotalAmount,
      );
    }
    return SizedBox.shrink();
  }

  Widget paymentButton({isDisabled = false}) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isDisabled
              ? Colors.grey
              : const Color.fromRGBO(
                  2,
                  39,
                  108,
                  1,
                ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Row(
        children: const [
          Text(
            'Pay Now',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
          ),
        ],
      ),
      onPressed: () {
        isDisabled
            ? Get.snackbar(
                'Error',
                'Insufficient balance. Please top-up your wallet first to continue. Go to your e-vault account and follow the "Top-up" instructions.',
                backgroundColor: Colors.red[400],
                colorText: Colors.white,
                duration: const Duration(
                  seconds: 2,
                ),
              )
            : submitPayment();
      },
    );
  }
}
