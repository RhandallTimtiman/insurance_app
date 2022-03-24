class Commodity {
  String? classification;
  String? commodityCode;
  String? commodityName;
  String? description;
  dynamic imageUrl;
  String? guid;

  Commodity({
    this.classification,
    this.commodityCode,
    this.commodityName,
    this.description,
    this.imageUrl,
    this.guid,
  });

  Commodity.fromJson(Map<String, dynamic> json) {
    classification = json['classification'];
    commodityCode = json['commodityCode'];
    commodityName = json['commodityName'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    guid = json['guid'];
  }
}
