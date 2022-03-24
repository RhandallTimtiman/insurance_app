import 'package:insurance_app/app/domain/model/models.dart';

class InsuranceProvider {
  String? guid;
  String? name;
  String? code;
  String? address;
  String? cityProvince;
  String? state;
  String? country;
  String? postalCode;
  String? emailAddress;
  String? landLinePrefix;
  String? landLine;
  dynamic faxNumberPrefix;
  dynamic faxNumber;
  String? mobileNumberPrefix;
  String? mobileNumber;
  String? imgUrl;
  String? countryCode;
  String? currencyCode;
  String? termsAndConditions;
  String? productGuid;
  String? productTypeGuid;
  String? productTypeName;
  ContainerRateList? containerRateList;

  InsuranceProvider({
    this.guid,
    this.name,
    this.code,
    this.address,
    this.cityProvince,
    this.state,
    this.country,
    this.postalCode,
    this.emailAddress,
    this.landLinePrefix,
    this.landLine,
    this.faxNumberPrefix,
    this.faxNumber,
    this.mobileNumberPrefix,
    this.mobileNumber,
    this.imgUrl,
    this.countryCode,
    this.currencyCode,
    this.termsAndConditions,
    this.productGuid,
    this.productTypeGuid,
    this.productTypeName,
    this.containerRateList,
  });

  InsuranceProvider.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    code = json['code'];
    address = json['address'];
    cityProvince = json['cityProvince'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postalCode'];
    emailAddress = json['emailAddress'];
    landLinePrefix = json['landLinePrefix'];
    landLine = json['landLine'];
    faxNumberPrefix = json['faxNumberPrefix'];
    faxNumber = json['faxNumber'];
    mobileNumberPrefix = json['mobileNumberPrefix'];
    mobileNumber = json['mobileNumber'];
    imgUrl = json['imgUrl'];
    countryCode = json['countryCode'];
    currencyCode = json['currencyCode'];
    termsAndConditions = json['termsAndConditions'];
    productGuid = json['productGuid'];
    productTypeGuid = json['productTypeGuid'];
    productTypeName = json['productTypeName'];
    containerRateList = ContainerRateList.fromJson(json['containerRateList']);
  }
}
