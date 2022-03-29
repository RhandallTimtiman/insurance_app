import 'package:insurance_app/app/domain/model/models.dart';

class NotifyParty {
  int? seaFreightTicketActorId;
  int? seaFreightTicketId;
  String? actorType;
  String? guid;
  String? companyName;
  String? emailAddress;
  String? imageUrl;
  String? addresses;
  ContactDetails? contactDetails;
  AddressDetails? addressDetails;

  NotifyParty({
    this.seaFreightTicketActorId,
    this.seaFreightTicketId,
    this.actorType,
    this.guid,
    this.companyName,
    this.emailAddress,
    this.imageUrl,
    this.addresses,
    this.contactDetails,
    this.addressDetails,
  });

  NotifyParty.fromJson(Map<String, dynamic> json) {
    seaFreightTicketActorId = json['seaFreightTicketActorId'];
    seaFreightTicketId = json['seaFreightTicketId'];
    actorType = json['actorType'];
    guid = json['guid'];
    companyName = json['companyName'];
    emailAddress = json['emailAddress'];
    imageUrl = json['imageUrl'];
    addresses = json['addresses'];
    contactDetails = ContactDetails.fromJson(json['contactDetails']);
    addressDetails = AddressDetails.fromJson(json['addressDetails']);
  }
}
