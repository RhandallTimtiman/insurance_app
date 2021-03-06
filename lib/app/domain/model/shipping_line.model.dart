import 'package:insurance_app/app/domain/model/models.dart';

class ShippingLine {
  String? actorType;
  String? addresses;
  String? companyName;
  String? emailAddress;
  String? guid;
  String? imageUrl;
  int? seaFreightTicketActorId;
  int? seaFreightTicketId;
  ContactDetails? contactDetails;
  AddressDetails? addressDetails;

  ShippingLine(
      {this.addresses,
      this.companyName,
      this.actorType,
      this.emailAddress,
      this.guid,
      this.imageUrl,
      this.seaFreightTicketActorId,
      this.seaFreightTicketId,
      this.contactDetails,
      this.addressDetails});

  ShippingLine.fromJson(Map<String, dynamic> json) {
    addresses = json['addresses'];
    companyName = json['companyName'];
    actorType = json['actorType'];
    emailAddress = json['emailAddress'];
    guid = json['guid'];
    imageUrl = json['imageUrl'];
    seaFreightTicketActorId = json['seaFreightTicketActorId'];
    seaFreightTicketId = json['seaFreightTicketId'];
    contactDetails = ContactDetails.fromJson(json['contactDetails']);
    addressDetails = AddressDetails.fromJson(json['addressDetails']);
  }
}
