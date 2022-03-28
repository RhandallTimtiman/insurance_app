class PaymentProvider {
  dynamic providerId;
  String? providerCode;
  dynamic providerPrefix;
  String? providerGuid;
  String? providerName;
  String? providerLogo;
  dynamic productId;
  String? productGuid;
  String? productCode;
  String? productName;
  String? productImageUrl;
  dynamic paymentTypeId;
  String? paymentTypeCode;
  String? paymentTypeName;
  String? instruction;
  dynamic limitMinimum;
  dynamic limitMaximum;
  dynamic localValue;
  dynamic foreignValue;
  bool? isPercentage;

  PaymentProvider({
    this.providerId,
    this.providerCode,
    this.providerPrefix,
    this.providerGuid,
    this.providerName,
    this.providerLogo,
    this.productId,
    this.productGuid,
    this.productCode,
    this.productName,
    this.productImageUrl,
    this.paymentTypeId,
    this.paymentTypeCode,
    this.paymentTypeName,
    this.instruction,
    this.limitMinimum,
    this.limitMaximum,
    this.localValue,
    this.foreignValue,
    this.isPercentage,
  });

  PaymentProvider.fromJson(Map<String, dynamic> json) {
    providerId = json['providerId'];
    providerCode = json['providerCode'];
    providerPrefix = json['providerPrefix'];
    providerGuid = json['providerGuid'];
    providerName = json['providerName'];
    providerLogo = json['providerLogo'];
    productId = json['productId'];
    productGuid = json['productGuid'];
    productCode = json['productCode'];
    productName = json['productName'];
    productImageUrl = json['productImageUrl'];
    paymentTypeId = json['paymentTypeId'];
    paymentTypeCode = json['paymentTypeCode'];
    paymentTypeName = json['paymentTypeName'];
    instruction = json['instruction'];
    limitMinimum = json['limitMinimum'];
    limitMaximum = json['limitMaximum'];
    localValue = json['localValue'];
    foreignValue = json['foreignValue'];
    isPercentage = json['isPercentage'];
  }
}
