import 'package:insurance_app/app/domain/model/models.dart';

class SeaFreightTicket {
  String? commodityDescription;
  String? commodityId;
  String? hsCode;
  String? termsOfPayment;
  String? specialInstruction;
  String? serviceTicketId;
  ShippingLine? shippingLine;
  BookingParty? consignee;
  BookingParty? bookingParty;

  SeaFreightTicket({
    this.commodityDescription,
    this.commodityId,
    this.hsCode,
    this.termsOfPayment,
    this.specialInstruction,
    this.serviceTicketId,
    this.shippingLine,
    this.consignee,
    this.bookingParty,
  });

  SeaFreightTicket.fromJson(Map<String, dynamic> json) {
    commodityDescription = json['commodityDescription'];
    commodityId = json['commodityId'];
    hsCode = json['hsCode'];
    termsOfPayment = json['termsOfPayment'];
    specialInstruction = json['specialInstruction'];
    serviceTicketId = json['serviceTicketId'];
    shippingLine = ShippingLine.fromJson(json['shippingLine']);
    bookingParty = BookingParty.fromJson(json['bookingParty']);
    consignee = BookingParty.fromJson(json['consignee']);
  }
}
