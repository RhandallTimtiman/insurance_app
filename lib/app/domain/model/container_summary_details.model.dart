class ContainerSummaryDetails {
  String? typeId;
  String? type;
  String? sizeId;
  String? size;
  int? quantity;
  String? packagingType;
  String? bookingStatus;
  String? bookingStatusId;
  String? rebookingNewReservationId;

  ContainerSummaryDetails({
    this.typeId,
    this.type,
    this.sizeId,
    this.size,
    this.quantity,
    this.packagingType,
    this.bookingStatus,
    this.bookingStatusId,
    this.rebookingNewReservationId,
  });

  ContainerSummaryDetails.fromJson(Map<String, dynamic> json) {
    typeId = json['typeId'];
    type = json['type'];
    sizeId = json['sizeId'];
    size = json['size'];
    quantity = json['quantity'];
    packagingType = json['packagingType'];
    bookingStatus = json['bookingStatus'];
    bookingStatusId = json['bookingStatusId'];
    rebookingNewReservationId = json['rebookingNewReservationId'];
  }
}
