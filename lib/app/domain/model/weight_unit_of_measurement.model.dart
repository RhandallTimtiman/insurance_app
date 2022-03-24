class WeightUnitOfMeasurement {
  String? unitOfMeasurementId;
  String? code;
  String? name;
  String? description;
  String? type;
  String? guid;

  WeightUnitOfMeasurement({
    this.unitOfMeasurementId,
    this.code,
    this.name,
    this.description,
    this.type,
    this.guid,
  });

  WeightUnitOfMeasurement.fromJson(Map<String, dynamic> json) {
    unitOfMeasurementId = json['unitOfMeasurementId'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    guid = json['guid'];
  }
}
