class AddressDetails {
  String? addressId;
  dynamic seaFreightTicketActorId;
  String? addressTypeId;
  String? addressLine;
  String? cityId;
  String? cityName;
  String? stateId;
  String? stateName;
  String? zipCode;
  String? countryId;
  String? countryName;
  String? fullAddress;
  String? guid;
  String? longitude;
  String? latitude;
  dynamic addressAdditionalInformation;
  bool? isDeleted;
  String? createdBy;
  String? createdOn;
  String? updatedBy;
  String? updatedOn;
  dynamic deletedBy;
  dynamic deletedOn;

  AddressDetails({
    this.addressId,
    this.seaFreightTicketActorId,
    this.addressTypeId,
    this.addressLine,
    this.cityId,
    this.cityName,
    this.stateId,
    this.stateName,
    this.zipCode,
    this.countryId,
    this.countryName,
    this.fullAddress,
    this.guid,
    this.longitude,
    this.latitude,
    this.addressAdditionalInformation,
    this.isDeleted,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.deletedBy,
    this.deletedOn,
  });

  AddressDetails.fromJson(Map<String, dynamic> json) {
    addressId = json['addressId'];
    seaFreightTicketActorId = json['seaFreightTicketActorId'];
    addressTypeId = json['addressTypeId'];
    addressLine = json['addressLine'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    zipCode = json['zipCode'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    fullAddress = json['fullAddress'];
    guid = json['guid'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    addressAdditionalInformation = json['addressAdditionalInformation'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    updatedBy = json['updatedBy'];
    updatedOn = json['updatedOn'];
    deletedBy = json['deletedBy'];
    deletedOn = json['deletedOn'];
  }
}
