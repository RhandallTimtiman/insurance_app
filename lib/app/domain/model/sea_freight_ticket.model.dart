import 'package:insurance_app/app/domain/model/models.dart';

class SeaFreightTicket {
  String? commodityDescription;
  String? commodityId;
  String? hsCode;
  String? termsOfPayment;
  String? specialInstruction;
  String? serviceTicketId;
  ShippingLine? shippingLine;

  SeaFreightTicket({
    this.commodityDescription,
    this.commodityId,
    this.hsCode,
    this.termsOfPayment,
    this.specialInstruction,
    this.serviceTicketId,
    this.shippingLine,
  });

  SeaFreightTicket.fromJson(Map<String, dynamic> json) {
    commodityDescription = json['commodityDescription'];
    commodityId = json['commodityId'];
    hsCode = json['hsCode'];
    termsOfPayment = json['termsOfPayment'];
    specialInstruction = json['specialInstruction'];
    serviceTicketId = json['serviceTicketId'];
    shippingLine = ShippingLine.fromJson(json['shippingLine']);
  }
}
