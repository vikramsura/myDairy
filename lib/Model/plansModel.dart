class PlansModel {
  bool? success;
  int? status;
  String? message;
  List<PlansModelData>? data;

  PlansModel({this.success, this.status, this.message, this.data});

  PlansModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PlansModelData>[];
      json['data'].forEach((v) {
        data!.add(PlansModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlansModelData {
  int? id;
  String? packageUniId;
  String? name;
  String? price;
  String? duration;
  String? packageType;
  String? description;
  int? status;
  int? trash;
  String? createdAt;
  String? updatedAt;

  PlansModelData(
      {this.id,
      this.packageUniId,
      this.name,
      this.price,
      this.duration,
      this.packageType,
      this.description,
      this.status,
      this.trash,
      this.createdAt,
      this.updatedAt});

  PlansModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageUniId = json['package_uni_id'];
    name = json['name'];
    price = json['price'];
    duration = json['duration'];
    packageType = json['package_type'];
    description = json['description'];
    status = json['status'];
    trash = json['trash'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_uni_id'] = this.packageUniId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['package_type'] = this.packageType;
    data['description'] = this.description;
    data['status'] = this.status;
    data['trash'] = this.trash;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
