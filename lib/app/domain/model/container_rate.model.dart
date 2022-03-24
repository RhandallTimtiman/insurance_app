class ContainerRate {
  String? containerTypeGuid;
  String? containerTypeName;
  String? containerSizeGuid;
  String? containerSizeName;
  int? qty;
  double? publishedRateAmount;
  double? totalAmount;
  String? publishedCurrencyCode;

  ContainerRate({
    this.containerTypeGuid,
    this.containerTypeName,
    this.containerSizeGuid,
    this.containerSizeName,
    this.qty,
    this.publishedRateAmount,
    this.totalAmount,
    this.publishedCurrencyCode,
  });

  ContainerRate.fromJson(Map<String, dynamic> json) {
    containerTypeGuid = json['containerTypeGuid'];
    containerTypeName = json['containerTypeName'];
    containerSizeGuid = json['containerSizeGuid'];
    containerSizeName = json['containerSizeName'];
    qty = json['qty'];
    publishedRateAmount = json['publishedRateAmount'];
    totalAmount = json['totalAmount'];
    publishedCurrencyCode = json['publishedCurrencyCode'];
  }
}
