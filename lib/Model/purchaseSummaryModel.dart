class PurchaseSummaryModel {
  bool? success;
  int? status;
  String? message;
  List<PurchaseSummaryModelData>? data;

  PurchaseSummaryModel({this.success, this.status, this.message, this.data});

  PurchaseSummaryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PurchaseSummaryModelData>[];
      json['data'].forEach((v) {
        data!.add(new PurchaseSummaryModelData.fromJson(v));
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

class PurchaseSummaryModelData {
  int? id;
  String? bmcId;
  String? slipId;
  String? adminId;
  String? registrationCode;
  String? userUniId;
  var exportId;
  var expDate;
  String? shDate;
  String? shift;
  String? milkType;
  var qty;
  var fat;
  var snf;
  var clr;
  String? amt;
  var penalty;
  var totalAmount;
  int? sampleNo;
  int? status;
  String? createdAt;
  String? updatedAt;

  PurchaseSummaryModelData(
      {this.id,
        this.bmcId,
        this.slipId,
        this.adminId,
        this.registrationCode,
        this.userUniId,
        this.exportId,
        this.expDate,
        this.shDate,
        this.shift,
        this.milkType,
        this.qty,
        this.fat,
        this.snf,
        this.clr,
        this.amt,
        this.penalty,
        this.totalAmount,
        this.sampleNo,
        this.status,
        this.createdAt,
        this.updatedAt});

  PurchaseSummaryModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bmcId = json['bmc_id'];
    slipId = json['slip_id'];
    adminId = json['admin_id'];
    registrationCode = json['registration_code'];
    userUniId = json['user_uni_id'];
    exportId = json['export_id'];
    expDate = json['exp_date'];
    shDate = json['sh_date'];
    shift = json['shift'];
    milkType = json['milk_type'];
    qty = json['qty'];
    fat = json['fat'];
    snf = json['snf'];
    clr = json['clr'];
    amt = json['amt'];
    penalty = json['penalty'];
    totalAmount = json['total_amount'];
    sampleNo = json['sample_no'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bmc_id'] = this.bmcId;
    data['slip_id'] = this.slipId;
    data['admin_id'] = this.adminId;
    data['registration_code'] = this.registrationCode;
    data['user_uni_id'] = this.userUniId;
    data['export_id'] = this.exportId;
    data['exp_date'] = this.expDate;
    data['sh_date'] = this.shDate;
    data['shift'] = this.shift;
    data['milk_type'] = this.milkType;
    data['qty'] = this.qty;
    data['fat'] = this.fat;
    data['snf'] = this.snf;
    data['clr'] = this.clr;
    data['amt'] = this.amt;
    data['penalty'] = this.penalty;
    data['total_amount'] = this.totalAmount;
    data['sample_no'] = this.sampleNo;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}