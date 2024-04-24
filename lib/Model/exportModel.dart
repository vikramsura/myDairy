class ExportModel {
  bool? success;
  int? status;
  String? message;
  List<ExportModelData>? data;

  ExportModel({this.success, this.status, this.message, this.data});

  ExportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExportModelData>[];
      json['data'].forEach((v) {
        data!.add(new ExportModelData.fromJson(v));
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

class ExportModelData {
  int? id;
  String? bmcId;
  String? userUniId;
  String? adminId;
  var slipId;
  String? exportId;
  String? expDate;
  String? routeId;
  String? driverId;
  var vehicleId;
  String? shift;
  var milkType;
  var qty;
  var fat;
  var snf;
  var clr;
  var remMilk;
  int? status;
  String? createdAt;
  String? updatedAt;
  Users? users;
  Users? bmc;

  ExportModelData(
      {this.id,
        this.bmcId,
        this.userUniId,
        this.adminId,
        this.slipId,
        this.exportId,
        this.expDate,
        this.routeId,
        this.driverId,
        this.vehicleId,
        this.shift,
        this.milkType,
        this.qty,
        this.fat,
        this.snf,
        this.clr,
        this.remMilk,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.users,
        this.bmc});

  ExportModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bmcId = json['bmc_id'];
    userUniId = json['user_uni_id'];
    adminId = json['admin_id'];
    slipId = json['slip_id'];
    exportId = json['export_id'];
    expDate = json['exp_date'];
    routeId = json['route_id'];
    driverId = json['driver_id'];
    vehicleId = json['vehicle_id'];
    shift = json['shift'];
    milkType = json['milk_type'];
    qty = json['qty'];
    fat = json['fat'];
    snf = json['snf'];
    clr = json['clr'];
    remMilk = json['rem_milk'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    bmc = json['bmc'] != null ? new Users.fromJson(json['bmc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bmc_id'] = this.bmcId;
    data['user_uni_id'] = this.userUniId;
    data['admin_id'] = this.adminId;
    data['slip_id'] = this.slipId;
    data['export_id'] = this.exportId;
    data['exp_date'] = this.expDate;
    data['route_id'] = this.routeId;
    data['driver_id'] = this.driverId;
    data['vehicle_id'] = this.vehicleId;
    data['shift'] = this.shift;
    data['milk_type'] = this.milkType;
    data['qty'] = this.qty;
    data['fat'] = this.fat;
    data['snf'] = this.snf;
    data['clr'] = this.clr;
    data['rem_milk'] = this.remMilk;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.bmc != null) {
      data['bmc'] = this.bmc!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  int? roleId;
  String? userUniId;
  String? parentId;
  String? panelId;
  String? registrationCode;
  var packageUniId;
  var packageValidDate;
  String? name;
  var email;
  String? username;
  String? pstr;
  String? countryCode;
  int? phone;
  int? createdBy;
  var aboutMe;
  String? image;
  var userFcmToken;
  var userIosToken;
  int? trash;
  int? accountVerified;
  int? status;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
        this.roleId,
        this.userUniId,
        this.parentId,
        this.panelId,
        this.registrationCode,
        this.packageUniId,
        this.packageValidDate,
        this.name,
        this.email,
        this.username,
        this.pstr,
        this.countryCode,
        this.phone,
        this.createdBy,
        this.aboutMe,
        this.image,
        this.userFcmToken,
        this.userIosToken,
        this.trash,
        this.accountVerified,
        this.status,
        this.pushNotification,
        this.createdAt,
        this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    userUniId = json['user_uni_id'];
    parentId = json['parent_id'];
    panelId = json['panel_id'];
    registrationCode = json['registration_code'];
    packageUniId = json['package_uni_id'];
    packageValidDate = json['package_valid_date'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    pstr = json['pstr'];
    countryCode = json['country_code'];
    phone = json['phone'];
    createdBy = json['created_by'];
    aboutMe = json['about_me'];
    image = json['image'];
    userFcmToken = json['user_fcm_token'];
    userIosToken = json['user_ios_token'];
    trash = json['trash'];
    accountVerified = json['account_verified'];
    status = json['status'];
    pushNotification = json['push_notification'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['user_uni_id'] = this.userUniId;
    data['parent_id'] = this.parentId;
    data['panel_id'] = this.panelId;
    data['registration_code'] = this.registrationCode;
    data['package_uni_id'] = this.packageUniId;
    data['package_valid_date'] = this.packageValidDate;
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['pstr'] = this.pstr;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['created_by'] = this.createdBy;
    data['about_me'] = this.aboutMe;
    data['image'] = this.image;
    data['user_fcm_token'] = this.userFcmToken;
    data['user_ios_token'] = this.userIosToken;
    data['trash'] = this.trash;
    data['account_verified'] = this.accountVerified;
    data['status'] = this.status;
    data['push_notification'] = this.pushNotification;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}