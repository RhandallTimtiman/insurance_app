class Service {
  String? code;
  String? companyServiceId;
  String? imageURL;
  late String name;
  String? serviceId;
  int? staticId;
  int? status;

  Service({
    this.code,
    this.companyServiceId,
    this.imageURL = '',
    this.name = '',
    this.serviceId,
    this.staticId,
    this.status,
  });

  Service.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    companyServiceId = json['companyServiceId'];
    imageURL = json['imageURL'];
    name = json['name'];
    serviceId = json['serviceId'];
    staticId = json['staticId'];
    status = json['status'];
  }
}
