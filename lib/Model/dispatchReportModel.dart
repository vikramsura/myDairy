class DispatchReportModel {
  bool? success;
  int? status;
  String? message;
  List<DispatchReportModelData>? data;

  DispatchReportModel({this.success, this.status, this.message, this.data});

  DispatchReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DispatchReportModelData>[];
      json['data'].forEach((v) {
        data!.add(DispatchReportModelData.fromJson(v));
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

class DispatchReportModelData {
  int? id;
  String? userId;
  String? shDate;
  String? shift;
  String? milkType;
  var totalCan;
  var totalQty;
  var fat;
  String? tankerNo;
  String? createdAt;
  String? updatedAt;

  DispatchReportModelData(
      {this.id,
      this.userId,
      this.shDate,
      this.shift,
      this.milkType,
      this.totalCan,
      this.totalQty,
      this.fat,
      this.tankerNo,
      this.createdAt,
      this.updatedAt});

  DispatchReportModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shDate = json['sh_date'];
    shift = json['shift'];
    milkType = json['milk_type'];
    totalCan = json['total_can'];
    totalQty = json['total_qty'];
    fat = json['fat'];
    tankerNo = json['tanker_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sh_date'] = this.shDate;
    data['shift'] = this.shift;
    data['milk_type'] = this.milkType;
    data['total_can'] = this.totalCan;
    data['total_qty'] = this.totalQty;
    data['fat'] = this.fat;
    data['tanker_no'] = this.tankerNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
