class TruckingServiceTicket {
  int? truckingTransactionId;
  String? reservationId;
  String? serviceType;
  String? serviceTypeId;
  String? bookingDate;
  String? shipmentDate;
  String? origin;
  String? originAddress;
  String? destination;
  String? destinationAddress;
  String? originLastRouteInstructions;
  String? destinationFirstRouteInstructions;
  dynamic transactionStatus;
  String? serviceTicketStatus;
  String? eventStatus;
  String? serviceTicketId;
  String? bookingPartyId;
  String? bookingPartyName;
  dynamic notifyPartyIds;
  dynamic notifyPartysName;
  String? shipperId;
  String? shipperName;
  String? consigneeId;
  String? consigneeName;
  String? truckingCompanyId;
  String? truckingCompanyName;

  TruckingServiceTicket({
    this.truckingTransactionId,
    this.reservationId,
    this.serviceType,
    this.serviceTypeId,
    this.bookingDate,
    this.shipmentDate,
    this.origin,
    this.originAddress,
    this.destination,
    this.destinationAddress,
    this.originLastRouteInstructions,
    this.destinationFirstRouteInstructions,
    this.transactionStatus,
    this.serviceTicketStatus,
    this.eventStatus,
    this.serviceTicketId,
    this.bookingPartyId,
    this.bookingPartyName,
    this.notifyPartyIds,
    this.notifyPartysName,
    this.shipperId,
    this.shipperName,
    this.consigneeId,
    this.consigneeName,
    this.truckingCompanyId,
    this.truckingCompanyName,
  });

  TruckingServiceTicket.fromJson(Map<String, dynamic> json) {
    truckingTransactionId = json['truckingTransactionId'];
    reservationId = json['reservationId'];
    serviceType = json['serviceType'];
    serviceTypeId = json['serviceTypeId'];
    bookingDate = json['bookingDate'];
    shipmentDate = json['shipmentDate'];
    origin = json['origin'];
    originAddress = json['originAddress'];
    destination = json['destination'];
    destinationAddress = json['destinationAddress'];
    originLastRouteInstructions = json['originLastRouteInstructions'];
    destinationFirstRouteInstructions =
        json['destinationFirstRouteInstructions'];
    transactionStatus = json['transactionStatus'];
    serviceTicketStatus = json['serviceTicketStatus'];
    eventStatus = json['eventStatus'];
    serviceTicketId = json['serviceTicketId'];
    bookingPartyId = json['bookingPartyId'];
    bookingPartyName = json['bookingPartyName'];
    notifyPartyIds = json['notifyPartyIds'];
    notifyPartysName = json['notifyPartysName'];
    shipperId = json['shipperId'];
    shipperName = json['shipperName'];
    consigneeId = json['consigneeId'];
    consigneeName = json['consigneeName'];
    truckingCompanyId = json['truckingCompanyId'];
    truckingCompanyName = json['truckingCompanyName'];
  }
}
