import 'package:insurance_app/app/domain/model/models.dart';

class ReservationDetails {
  String? id;
  int? seaFreightTransactionId;
  String? reservationId;
  String? serviceType;
  String? serviceTypeId;
  bool? supplementaryTrucking;
  String? shipmentType;
  dynamic shipmentTypeId;
  String? shipmentDate;
  String? loadingAddress;
  dynamic loadingAddressLatLng;
  dynamic loadingAddressLoCode;
  dynamic loadingAddressAdditional;
  String? deliveryAddress;
  dynamic deliveryAddressLatlng;
  dynamic deliveryAddressLoCode;
  dynamic deliveryAddressCountryCode;
  dynamic deliveryAddressAdditional;
  String? portOfLoadingId;
  String? portOfLoadingName;
  String? portOfLoadingLoCode;
  String? portOfLoadingCountryCode;
  String? portOfLoadingCountryName;
  String? portOfDischargeId;
  String? portOfDischargeName;
  String? portOfDischargeLoCode;
  String? portOfDischargeCountryCode;
  String? portOfDischargeCountryName;
  dynamic portOfLoadingPortCode;
  dynamic portOfLoadingLongitude;
  dynamic portOfLoadingLatitude;
  dynamic portOfDischargePortCode;
  dynamic portOfDischargeLongitude;
  dynamic portOfDischargeLatitude;
  String? bookingPartyId;
  String? bookingParty;
  String? bookingPartyCurrencyCode;
  String? bookingPartyCountryCode;
  String? notifyPartyIds;
  String? shipperId;
  String? shipper;
  String? shippingLine;
  String? shippingLineId;
  dynamic originShippingAgencyId;
  dynamic originShippingAgencyName;
  dynamic originShippingAgencyImage;
  dynamic originShippingAgencyAddressLine;
  dynamic originShippingAgencyLandline;
  dynamic originShippingAgencyFax;
  int? originShippingAgencyCountryId;
  dynamic originShippingAgencyeCountryCode;
  dynamic originShippingAgencyCountryName;
  String? destinationShippingAgencyId;
  String? destinationShippingAgencyName;
  String? destinationShippingAgencyImage;
  String? destinationShippingAgencyAddressLine;
  String? destinationShippingAgencyLandline;
  String? destinationShippingAgencyFax;
  int? destinationShippingAgencyCountryId;
  dynamic destinationShippingAgencyCountryCode;
  dynamic destinationShippingAgencyCountryName;
  String? blNumber;
  String? consigneeId;
  String? consignee;
  String? commodityId;
  String? commodityDescription;
  String? commodityName;
  bool? isDangerousCargo;
  dynamic hsCode;
  dynamic eta;
  dynamic etd;
  String? lct;
  dynamic specialInstruction;
  dynamic termsOfPayment;
  String? bookingPartyImage;
  String? consigneeImage;
  String? shipperImage;
  String? shippingLineImage;
  SeaFreightTicket? seaFreightTicket;
  String? containerOwnership;
  late List<ContainerSummaryDetails>? containerSummary;
  late List<ContainerDetails>? containers;
  late List<ContainerDetails>? containerInsuranceNotBookedContainer;

  ReservationDetails({
    this.id,
    this.seaFreightTransactionId,
    this.reservationId,
    this.serviceType,
    this.serviceTypeId,
    this.supplementaryTrucking,
    this.shipmentType,
    this.shipmentTypeId,
    this.shipmentDate,
    this.loadingAddress,
    this.loadingAddressLatLng,
    this.loadingAddressLoCode,
    this.loadingAddressAdditional,
    this.deliveryAddress,
    this.deliveryAddressLatlng,
    this.deliveryAddressLoCode,
    this.deliveryAddressCountryCode,
    this.deliveryAddressAdditional,
    this.portOfLoadingId,
    this.portOfLoadingName,
    this.portOfLoadingLoCode,
    this.portOfLoadingCountryCode,
    this.portOfLoadingCountryName,
    this.portOfDischargeId,
    this.portOfDischargeName,
    this.portOfDischargeLoCode,
    this.portOfDischargeCountryCode,
    this.portOfDischargeCountryName,
    this.portOfLoadingPortCode,
    this.portOfLoadingLongitude,
    this.portOfLoadingLatitude,
    this.portOfDischargePortCode,
    this.portOfDischargeLongitude,
    this.portOfDischargeLatitude,
    this.bookingPartyId,
    this.bookingParty,
    this.bookingPartyCurrencyCode,
    this.bookingPartyCountryCode,
    this.notifyPartyIds,
    this.shipperId,
    this.shipper,
    this.shippingLine,
    this.shippingLineId,
    this.originShippingAgencyId,
    this.originShippingAgencyName,
    this.originShippingAgencyImage,
    this.originShippingAgencyAddressLine,
    this.originShippingAgencyLandline,
    this.originShippingAgencyFax,
    this.originShippingAgencyCountryId,
    this.originShippingAgencyeCountryCode,
    this.originShippingAgencyCountryName,
    this.destinationShippingAgencyId,
    this.destinationShippingAgencyName,
    this.destinationShippingAgencyImage,
    this.destinationShippingAgencyAddressLine,
    this.destinationShippingAgencyLandline,
    this.destinationShippingAgencyFax,
    this.destinationShippingAgencyCountryId,
    this.destinationShippingAgencyCountryCode,
    this.destinationShippingAgencyCountryName,
    this.blNumber,
    this.consigneeId,
    this.consignee,
    this.commodityId,
    this.commodityDescription,
    this.commodityName,
    this.isDangerousCargo,
    this.hsCode,
    this.eta,
    this.etd,
    this.lct,
    this.specialInstruction,
    this.termsOfPayment,
    this.bookingPartyImage,
    this.consigneeImage,
    this.shipperImage,
    this.shippingLineImage,
    this.seaFreightTicket,
    this.containerOwnership,
    this.containerSummary,
    this.containers,
    this.containerInsuranceNotBookedContainer,
  });

  ReservationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seaFreightTransactionId = json['seaFreightTransactionId'];
    reservationId = json['reservationId'];
    serviceType = json['serviceType'];
    serviceTypeId = json['serviceTypeId'];
    supplementaryTrucking = json['supplementaryTrucking'];
    shipmentType = json['shipmentType'];
    shipmentTypeId = json['shipmentTypeId'];
    shipmentDate = json['shipmentDate'];
    loadingAddress = json['loadingAddress'];
    loadingAddressLatLng = json['loadingAddressLatLng'];
    loadingAddressLoCode = json['loadingAddressLoCode'];
    loadingAddressAdditional = json['loadingAddressAdditional'];
    deliveryAddress = json['deliveryAddress'];
    deliveryAddressLatlng = json['deliveryAddressLatlng'];
    deliveryAddressLoCode = json['deliveryAddressLoCode'];
    deliveryAddressCountryCode = json['deliveryAddressCountryCode'];
    deliveryAddressAdditional = json['deliveryAddressAdditional'];
    portOfLoadingId = json['portOfLoadingId'];
    portOfLoadingName = json['portOfLoadingName'];
    portOfLoadingLoCode = json['portOfLoadingLoCode'];
    portOfLoadingCountryCode = json['portOfLoadingCountryCode'];
    portOfLoadingCountryName = json['portOfLoadingCountryName'];
    portOfDischargeId = json['portOfDischargeId'];
    portOfDischargeName = json['portOfDischargeName'];
    portOfDischargeLoCode = json['portOfDischargeLoCode'];
    portOfDischargeCountryCode = json['portOfDischargeCountryCode'];
    portOfDischargeCountryName = json['portOfDischargeCountryName'];
    portOfLoadingPortCode = json['portOfLoadingPortCode'];
    portOfLoadingLongitude = json['portOfLoadingLongitude'];
    portOfLoadingLatitude = json['portOfLoadingLatitude'];
    portOfDischargePortCode = json['portOfDischargePortCode'];
    portOfDischargeLongitude = json['portOfDischargeLongitude'];
    portOfDischargeLatitude = json['portOfDischargeLatitude'];
    bookingPartyId = json['bookingPartyId'];
    bookingParty = json['bookingParty'];
    bookingPartyCurrencyCode = json['bookingPartyCurrencyCode'];
    bookingPartyCountryCode = json['bookingPartyCountryCode'];
    notifyPartyIds = json['notifyPartyIds'];
    shipperId = json['shipperId'];
    shipper = json['shipper'];
    shippingLine = json['shippingLine'];
    shippingLineId = json['shippingLineId'];
    originShippingAgencyId = json['originShippingAgencyId'];
    originShippingAgencyName = json['originShippingAgencyName'];
    originShippingAgencyImage = json['originShippingAgencyImage'];
    originShippingAgencyAddressLine = json['originShippingAgencyAddressLine'];
    originShippingAgencyLandline = json['originShippingAgencyLandline'];
    originShippingAgencyFax = json['originShippingAgencyFax'];
    originShippingAgencyCountryId = json['originShippingAgencyCountryId'];
    originShippingAgencyeCountryCode = json['originShippingAgencyeCountryCode'];
    originShippingAgencyCountryName = json['originShippingAgencyCountryName'];
    destinationShippingAgencyId = json['destinationShippingAgencyId'];
    destinationShippingAgencyName = json['destinationShippingAgencyName'];
    destinationShippingAgencyImage = json['destinationShippingAgencyImage'];
    destinationShippingAgencyAddressLine =
        json['destinationShippingAgencyAddressLine'];
    destinationShippingAgencyLandline =
        json['destinationShippingAgencyLandline'];
    destinationShippingAgencyFax = json['destinationShippingAgencyFax'];
    destinationShippingAgencyCountryId =
        json['destinationShippingAgencyCountryId'];
    destinationShippingAgencyCountryCode =
        json['destinationShippingAgencyCountryCode'];
    destinationShippingAgencyCountryName =
        json['destinationShippingAgencyCountryName'];
    blNumber = json['blNumber'];
    consigneeId = json['consigneeId'];
    consignee = json['consignee'];
    commodityId = json['commodityId'];
    commodityDescription = json['commodityDescription'];
    commodityName = json['commodityName'];
    isDangerousCargo = json['isDangerousCargo'];
    hsCode = json['hsCode'];
    eta = json['eta'] != null ? DateTime.tryParse(json['eta']) : null;
    etd = json['etd'] != null ? DateTime.tryParse(json['etd']) : null;
    lct = json['lct'];
    specialInstruction = json['specialInstruction'];
    termsOfPayment = json['termsOfPayment'];
    bookingPartyImage = json['bookingPartyImage'];
    consigneeImage = json['consigneeImage'];
    shipperImage = json['shipperImage'];
    shippingLineImage = json['shippingLineImage'];
    seaFreightTicket = SeaFreightTicket.fromJson(json['seaFreightTicket']);
    containerOwnership = json['containerOwnership'];
    if (json['containerSummary'] != null) {
      containerSummary = <ContainerSummaryDetails>[];
      json['containerSummary'].forEach(
        (v) {
          containerSummary!.add(ContainerSummaryDetails.fromJson(v));
        },
      );
    } else {
      containerSummary = [];
    }
    if (json['containers'] != null) {
      containers = <ContainerDetails>[];
      json['containers'].forEach(
        (v) {
          containers!.add(ContainerDetails.fromJson(v));
        },
      );
    } else {
      containers = [];
    }
    if (json['containerInsuranceNotBookedContainer'] != null) {
      containerInsuranceNotBookedContainer = <ContainerDetails>[];
      json['containerInsuranceNotBookedContainer'].forEach(
        (v) {
          containerInsuranceNotBookedContainer!
              .add(ContainerDetails.fromJson(v));
        },
      );
    } else {
      containerInsuranceNotBookedContainer = [];
    }
  }
}
