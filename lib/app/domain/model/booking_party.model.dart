import 'package:insurance_app/app/domain/model/address_details.model.dart';
import 'package:insurance_app/app/domain/model/models.dart';

class BookingParty {
  dynamic seaFreightTicketActorId;
  dynamic seaFreightTicketId;
  String? actorType;
  String? guid;
  String? companyName;
  String? emailAddress;
  String? imageUrl;
  String? addresses;
  ContactDetails? contactDetails;
  AddressDetails? addressDetails;

  BookingParty({
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

  BookingParty.fromJson(Map<String, dynamic> json) {
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
