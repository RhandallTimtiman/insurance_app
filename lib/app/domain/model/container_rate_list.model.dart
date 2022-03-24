import 'package:insurance_app/app/domain/model/models.dart';

class ContainerRateList {
  int? totalQty;
  double? totalPublishedAmount;
  List<ContainerRate>? containerRates;
  List<ContainerRate>? containerListNoRates;

  ContainerRateList({
    this.totalQty,
    this.totalPublishedAmount,
    this.containerRates,
    this.containerListNoRates,
  });

  ContainerRateList.fromJson(Map<String, dynamic> json) {
    totalQty = json['totalQty'];
    totalPublishedAmount = json['totalPublishedAmount'];
    if (json['containerRates'] != null) {
      containerRates = <ContainerRate>[];
      json['containerRates'].forEach((v) {
        containerRates!.add(ContainerRate.fromJson(v));
      });
    } else {
      containerRates = [];
    }
    if (json['containerListNoRates'] != null) {
      containerListNoRates = <ContainerRate>[];
      json['containerListNoRates'].forEach((v) {
        containerListNoRates!.add(ContainerRate.fromJson(v));
      });
    } else {
      containerListNoRates = [];
    }
  }
}
