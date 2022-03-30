class TransactionStatus {
  dynamic transactionStatusId;
  String? name;
  String? description;

  TransactionStatus({
    this.transactionStatusId,
    this.name,
    this.description,
  });

  TransactionStatus.fromJson(Map<String, dynamic> json) {
    transactionStatusId = json['transactionStatusId'];
    name = json['name'];
    description = json['description'];
  }
}
