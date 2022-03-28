class ContactDetails {
  dynamic contactId;
  dynamic seaFreightTicketActorId;
  dynamic contactDetailId;
  dynamic phonePrefixId;
  String? phonePrefix;
  String? phone;
  dynamic mobilePrefixId;
  String? mobilePrefix;
  String? mobile;
  dynamic faxPrefixId;
  String? faxPrefix;
  String? fax;
  dynamic isDeleted;
  String? createdBy;
  String? createdOn;
  dynamic modifiedBy;
  String? modifiedOn;
  String? guid;

  ContactDetails({
    this.contactId,
    this.seaFreightTicketActorId,
    this.contactDetailId,
    this.phonePrefixId,
    this.phonePrefix,
    this.phone,
    this.mobilePrefixId,
    this.mobilePrefix,
    this.mobile,
    this.faxPrefixId,
    this.faxPrefix,
    this.fax,
    this.isDeleted,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.guid,
  });

  ContactDetails.fromJson(Map<String, dynamic> json) {
    contactId = json['contactId'];
    seaFreightTicketActorId = json['seaFreightTicketActorId'];
    contactDetailId = json['contactDetailId'];
    phonePrefixId = json['phonePrefixId'];
    phonePrefix = json['phonePrefix'];
    phone = json['phone'];
    mobilePrefixId = json['mobilePrefixId'];
    mobilePrefix = json['mobilePrefix'];
    mobile = json['mobile'];
    faxPrefixId = json['faxPrefixId'];
    faxPrefix = json['faxPrefix'];
    fax = json['fax'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    guid = json['guid'];
  }
}
