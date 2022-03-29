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
  BookingParty? shipper;
  List<NotifyParty>? notifyParties;

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
    this.shipper,
    this.notifyParties,
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
    shipper = BookingParty.fromJson(json['shipper']);
    if (json['notifyParties'] != null) {
      notifyParties = <NotifyParty>[];
      json['notifyParties'].forEach(
        (v) {
          notifyParties!.add(NotifyParty.fromJson(v));
        },
      );
    } else {
      notifyParties = [];
    }
  }
}
