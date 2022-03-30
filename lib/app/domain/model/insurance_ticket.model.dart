class InsuranceTicket {
  String? guid;
  String? productTypeGuid;
  String? productTypeName;
  String? providerGuid;
  String? providerCode;
  String? providerName;
  String? reservationId;
  String? serviceTicketId;
  String? bookingPartyId;
  String? bookingPartyName;
  String? policyNumber;
  String? policyVersion;
  String? certificateNumber;
  String? certificateIssuedDate;
  dynamic totalPublishedAmount;
  dynamic totalContainerQty;
  dynamic paymentOptionId;
  dynamic paymentOption;
  dynamic invoiceStatusId;
  dynamic invoiceStatus;
  dynamic receivablesPayables;

  InsuranceTicket({
    this.guid,
    this.productTypeGuid,
    this.productTypeName,
    this.providerGuid,
    this.providerCode,
    this.providerName,
    this.reservationId,
    this.serviceTicketId,
    this.bookingPartyId,
    this.bookingPartyName,
    this.policyNumber,
    this.policyVersion,
    this.certificateNumber,
    this.certificateIssuedDate,
    this.totalPublishedAmount,
    this.totalContainerQty,
    this.paymentOptionId,
    this.paymentOption,
    this.invoiceStatusId,
    this.invoiceStatus,
    this.receivablesPayables,
  });

  InsuranceTicket.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    productTypeGuid = json['productTypeGuid'];
    productTypeName = json['productTypeName'];
    providerGuid = json['providerGuid'];
    providerCode = json['providerCode'];
    providerName = json['providerName'];
    reservationId = json['reservationId'];
    serviceTicketId = json['serviceTicketId'];
    bookingPartyId = json['bookingPartyId'];
    bookingPartyName = json['bookingPartyName'];
    policyNumber = json['policyNumber'];
    policyVersion = json['policyVersion'];
    certificateNumber = json['certificateNumber'];
    certificateIssuedDate = json['certificateIssuedDate'];
    totalPublishedAmount = json['totalPublishedAmount'];
    totalContainerQty = json['totalContainerQty'];
    paymentOptionId = json['paymentOptionId'];
    paymentOption = json['paymentOption'];
    invoiceStatusId = json['invoiceStatusId'];
    invoiceStatus = json['invoiceStatus'];
    receivablesPayables = json['receivablesPayables'];
  }
}
