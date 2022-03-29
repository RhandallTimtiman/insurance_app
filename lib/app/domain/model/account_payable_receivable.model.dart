class AccountPayableReceivable {
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
  dynamic policyTemplate;
  dynamic policyNumber;
  dynamic certificateNumber;
  dynamic certificateIssuedDate;
  double? totalPublishedAmount;
  int? totalContainerQty;
  String? arapId;
  String? invoiceStatus;
  dynamic paymentResponse;

  AccountPayableReceivable({
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
    this.policyTemplate,
    this.policyNumber,
    this.certificateNumber,
    this.certificateIssuedDate,
    this.totalPublishedAmount,
    this.totalContainerQty,
    this.arapId,
    this.invoiceStatus,
    this.paymentResponse,
  });

  AccountPayableReceivable.fromJson(Map<String, dynamic> json) {
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
    policyTemplate = json['policyTemplate'];
    policyNumber = json['policyNumber'];
    certificateNumber = json['certificateNumber'];
    certificateIssuedDate = json['certificateIssuedDate'];
    totalPublishedAmount = json['totalPublishedAmount'];
    totalContainerQty = json['totalContainerQty'];
    arapId = json['arapId'];
    invoiceStatus = json['invoiceStatus'];
    paymentResponse = json['paymentResponse'];
  }
}
