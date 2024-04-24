class RateChatModel {
  bool? success;
  int? status;
  String? message;
  List<RateChatModelDate>? data;

  RateChatModel({this.success, this.status, this.message, this.data});

  RateChatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RateChatModelDate>[];
      json['data'].forEach((v) {
        data!.add(new RateChatModelDate.fromJson(v));
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

class RateChatModelDate {
  int? id;
  String? adminId;
  String? registrationCode;
  String? shDate;
  String? shift;
  String? rateCode;
  String? remark;
  var fateCow;
  var fateBuffalo;
  var fateRateMix;
  var fateOther;
  var clrCow;
  var clrBuffalo;
  var clrRateMix;
  var clrOther;
  var snfCow;
  var snfBuffalo;
  var snfRateMix;
  var snfOther;
  var status;
  String? createdAt;
  String? updatedAt;

  RateChatModelDate(
      {this.id,
      this.adminId,
      this.registrationCode,
      this.shDate,
      this.shift,
      this.rateCode,
      this.remark,
      this.fateCow,
      this.fateBuffalo,
      this.fateRateMix,
      this.fateOther,
      this.clrCow,
      this.clrBuffalo,
      this.clrRateMix,
      this.clrOther,
      this.snfCow,
      this.snfBuffalo,
      this.snfRateMix,
      this.snfOther,
      this.status,
      this.createdAt,
      this.updatedAt});

  RateChatModelDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    registrationCode = json['registration_code'];
    shDate = json['sh_date'];
    shift = json['shift'];
    rateCode = json['rate_code'];
    remark = json['remark'];
    fateCow = json['fate_cow'];
    fateBuffalo = json['fate_buffalo'];
    fateRateMix = json['fate_rate_mix'];
    fateOther = json['fate_other'];
    clrCow = json['clr_cow'];
    clrBuffalo = json['clr_buffalo'];
    clrRateMix = json['clr_rate_mix'];
    clrOther = json['clr_other'];
    snfCow = json['snf_cow'];
    snfBuffalo = json['snf_buffalo'];
    snfRateMix = json['snf_rate_mix'];
    snfOther = json['snf_other'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['registration_code'] = this.registrationCode;
    data['sh_date'] = this.shDate;
    data['shift'] = this.shift;
    data['rate_code'] = this.rateCode;
    data['remark'] = this.remark;
    data['fate_cow'] = this.fateCow;
    data['fate_buffalo'] = this.fateBuffalo;
    data['fate_rate_mix'] = this.fateRateMix;
    data['fate_other'] = this.fateOther;
    data['clr_cow'] = this.clrCow;
    data['clr_buffalo'] = this.clrBuffalo;
    data['clr_rate_mix'] = this.clrRateMix;
    data['clr_other'] = this.clrOther;
    data['snf_cow'] = this.snfCow;
    data['snf_buffalo'] = this.snfBuffalo;
    data['snf_rate_mix'] = this.snfRateMix;
    data['snf_other'] = this.snfOther;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
