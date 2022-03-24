class InventoryStatus {
  int? containerInventoryStatusId;
  String? id;
  String? code;
  String? name;
  String? description;
  String? createdOn;
  String? createdBy;

  InventoryStatus({
    this.containerInventoryStatusId,
    this.id,
    this.code,
    this.name,
    this.description,
    this.createdOn,
    this.createdBy,
  });

  InventoryStatus.fromJson(Map<String, dynamic> json) {
    containerInventoryStatusId = json['containerInventoryStatusId'];
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
  }
}
