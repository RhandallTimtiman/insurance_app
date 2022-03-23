import 'package:insurance_app/app/domain/model/models.dart';

class Reservation {
  late String reservationId;
  late String origin;
  String? originAddress;
  late String destination;
  String? destinationAddress;
  List<ContainerSummary>? containerSummary;
  String? serviceProvider;
  String? serviceType;
  String? shipmentType;
  bool? supplementaryTrucking;
  late dynamic shipmentDate;
  String? createdOn;
  String? blNumber;
  late String status;

  Reservation({
    this.reservationId = '',
    this.origin = '',
    this.originAddress,
    this.destination = '',
    this.destinationAddress,
    this.containerSummary,
    this.serviceProvider,
    this.serviceType,
    this.shipmentType,
    this.supplementaryTrucking,
    this.shipmentDate,
    this.createdOn,
    this.blNumber,
    this.status = '',
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservationId'];
    origin = json['origin'];
    originAddress = json['originAddress'];
    destination = json['destination'];
    destinationAddress = json['destinationAddress'];
    if (json['containerSummary'] != null) {
      containerSummary = <ContainerSummary>[];
      json['containerSummary'].forEach((v) {
        containerSummary!.add(
          ContainerSummary.fromJson(
            v,
          ),
        );
      });
    }
    serviceProvider = json['serviceProvider'];
    serviceType = json['serviceType'];
    shipmentType = json['shipmentType'];
    supplementaryTrucking = json['supplementaryTrucking'];
    shipmentDate = json['shipmentDate'];
    createdOn = json['createdOn'];
    blNumber = json['blNumber'];
    status = json['status'];
  }
}
