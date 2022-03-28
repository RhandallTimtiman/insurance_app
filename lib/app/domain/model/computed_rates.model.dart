class ComputedRates {
  double? invoiceAmount;
  dynamic convenienceFee;
  dynamic platformFee;
  double? grandTotalAmount;

  ComputedRates({
    this.invoiceAmount,
    this.convenienceFee,
    this.platformFee,
    this.grandTotalAmount,
  });

  ComputedRates.fromJson(Map<String, dynamic> json) {
    invoiceAmount = json['invoiceAmount'];
    convenienceFee = json['convenienceFee'];
    platformFee = json['platformFee'];
    grandTotalAmount = json['grandTotalAmount'];
  }
}
