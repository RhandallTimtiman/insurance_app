import 'package:insurance_app/app/domain/model/models.dart';

class ContainerDisplay extends ContainerRate {
  List<ContainerDetails>? containers = [];

  ContainerDisplay({
    this.containers,
    String? containerTypeGuid,
    String? containerTypeName,
    String? containerSizeGuid,
    String? containerSizeName,
    int? qty,
    double? publishedRateAmount,
    double? totalAmount,
    String? publishedCurrencyCode,
  }) : super(
          containerTypeGuid: containerTypeGuid,
          containerTypeName: containerTypeName,
          containerSizeGuid: containerSizeGuid,
          containerSizeName: containerSizeName,
          qty: qty,
          publishedRateAmount: publishedRateAmount,
          totalAmount: totalAmount,
          publishedCurrencyCode: publishedCurrencyCode,
        );
}
