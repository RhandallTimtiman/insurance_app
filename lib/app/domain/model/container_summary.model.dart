class ContainerSummary {
  String? reservationId;
  String? containerType;
  String? containerSize;
  int? quantity;

  ContainerSummary({
    this.reservationId,
    this.containerType,
    this.containerSize,
    this.quantity,
  });

  ContainerSummary.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservationId'];
    containerType = json['containerType'];
    containerSize = json['containerSize'];
    quantity = json['quantity'];
  }
}
