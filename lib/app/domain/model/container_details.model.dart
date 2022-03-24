import 'package:insurance_app/app/domain/model/models.dart';

class ContainerDetails {
  List<dynamic>? billOfLadingContainers;
  String? bookingStatus;
  String? bookingStatusId;
  InventoryStatus? inventoryStatus;
  dynamic rebookingNewReservationId;
  dynamic containerId;
  String? id;
  String? ownership;
  String? typeId;
  String? type;
  String? sizeId;
  String? size;
  dynamic quantity;
  dynamic packagingQuantity;
  double? weight;
  String? weightUnitOfMeasurementId;
  WeightUnitOfMeasurement? weightUnitOfMeasurement;
  dynamic volume;
  dynamic volumeUnitOfMeasurementId;
  dynamic volumeUnitOfMeasurement;
  dynamic dimensionsUnitOfMeasurementId;
  dynamic dimensionUnitOfMeasurement;
  dynamic dimensionLength;
  dynamic dimensionWidth;
  dynamic dimensionHeight;
  dynamic reeferTemperature;
  dynamic reeferTemperatureUnitOfMeasurementId;
  dynamic reeferTemperatureUnitOfMeasurement;
  dynamic packagingTypeId;
  dynamic packagingType;
  dynamic packagingTypeObject;
  String? containerNumber;
  dynamic sealNumber;
  dynamic loadType;
  dynamic containerInventoryStatusId;
  String? status;
  String? createdOn;
  String? updatedBy;
  String? updatedOn;
  dynamic releasedOn;
  dynamic loadedOn;
  dynamic returnedOn;
  dynamic containerRate;
  dynamic containerTotalRate;
  String? currencyId;
  String? currencyCode;
  String? currencyName;
  String? currencySymbol;
  List<dynamic>? billOfLadingRemarks;
  Commodity? commodity;
  String? commodityId;

  ContainerDetails({
    this.billOfLadingContainers,
    this.bookingStatus,
    this.bookingStatusId,
    this.inventoryStatus,
    this.rebookingNewReservationId,
    this.containerId,
    this.id,
    this.ownership,
    this.typeId,
    this.type,
    this.sizeId,
    this.size,
    this.quantity,
    this.packagingQuantity,
    this.weight,
    this.weightUnitOfMeasurementId,
    this.weightUnitOfMeasurement,
    this.volume,
    this.volumeUnitOfMeasurementId,
    this.volumeUnitOfMeasurement,
    this.dimensionsUnitOfMeasurementId,
    this.dimensionUnitOfMeasurement,
    this.dimensionLength,
    this.dimensionWidth,
    this.dimensionHeight,
    this.reeferTemperature,
    this.reeferTemperatureUnitOfMeasurementId,
    this.reeferTemperatureUnitOfMeasurement,
    this.packagingTypeId,
    this.packagingType,
    this.packagingTypeObject,
    this.containerNumber,
    this.sealNumber,
    this.loadType,
    this.containerInventoryStatusId,
    this.status,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.releasedOn,
    this.loadedOn,
    this.returnedOn,
    this.containerRate,
    this.containerTotalRate,
    this.currencyId,
    this.currencyCode,
    this.currencyName,
    this.currencySymbol,
    this.billOfLadingRemarks,
    this.commodity,
    this.commodityId,
  });

  ContainerDetails.fromJson(Map<String, dynamic> json) {
    billOfLadingContainers = json['billOfLadingContainers'];
    bookingStatus = json['bookingStatus'];
    bookingStatusId = json['bookingStatusId'];
    inventoryStatus = json['inventoryStatus'] != null
        ? InventoryStatus.fromJson(json['inventoryStatus'])
        : null;
    rebookingNewReservationId = json['rebookingNewReservationId'];
    containerId = json['containerId'];
    id = json['id'];
    ownership = json['ownership'];
    typeId = json['typeId'];
    type = json['type'];
    sizeId = json['sizeId'];
    size = json['size'];
    quantity = json['quantity'];
    packagingQuantity = json['packagingQuantity'];
    weight = json['weight'];
    weightUnitOfMeasurementId = json['weightUnitOfMeasurementId'];
    weightUnitOfMeasurement = json['weightUnitOfMeasurement'] != null
        ? WeightUnitOfMeasurement.fromJson(json['weightUnitOfMeasurement'])
        : null;
    volume = json['volume'];
    volumeUnitOfMeasurementId = json['volumeUnitOfMeasurementId'];
    volumeUnitOfMeasurement = json['volumeUnitOfMeasurement'];
    dimensionsUnitOfMeasurementId = json['dimensionsUnitOfMeasurementId'];
    dimensionUnitOfMeasurement = json['dimensionUnitOfMeasurement'];
    dimensionLength = json['dimensionLength'];
    dimensionWidth = json['dimensionWidth'];
    dimensionHeight = json['dimensionHeight'];
    reeferTemperature = json['reeferTemperature'];
    reeferTemperatureUnitOfMeasurementId =
        json['reeferTemperatureUnitOfMeasurementId'];
    reeferTemperatureUnitOfMeasurement =
        json['reeferTemperatureUnitOfMeasurement'];
    packagingTypeId = json['packagingTypeId'];
    packagingType = json['packagingType'];
    packagingTypeObject = json['packagingTypeObject'];
    containerNumber = json['containerNumber'];
    sealNumber = json['sealNumber'];
    loadType = json['loadType'];
    containerInventoryStatusId = json['containerInventoryStatusId'];
    status = json['status'];
    createdOn = json['createdOn'];
    updatedBy = json['updatedBy'];
    updatedOn = json['updatedOn'];
    releasedOn = json['releasedOn'];
    loadedOn = json['loadedOn'];
    returnedOn = json['returnedOn'];
    containerRate = json['containerRate'];
    containerTotalRate = json['containerTotalRate'];
    currencyId = json['currencyId'];
    currencyCode = json['currencyCode'];
    currencyName = json['currencyName'];
    currencySymbol = json['currencySymbol'];
    billOfLadingRemarks = json['billOfLadingRemarks'];
    commodity = json['commodity'] != null
        ? Commodity.fromJson(json['commodity'])
        : null;
    commodityId = json['commodityId'];
  }
}
