class Company {
  String? companyId;
  String? name;
  String? code;
  String? image;
  String? companyServiceId;
  String? serviceId;
  String? service;
  int? status;
  bool? allowBulkBooking;

  Company({
    this.companyId,
    this.name,
    this.code,
    this.image,
    this.companyServiceId,
    this.serviceId,
    this.service,
    this.status,
    this.allowBulkBooking,
  });

  Company.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    name = json['name'];
    code = json['code'];
    image = json['image'];
    companyServiceId = json['companyServiceId'];
    serviceId = json['serviceId'];
    service = json['service'];
    status = json['status'];
    allowBulkBooking = json['allowBulkBooking'];
  }
}
