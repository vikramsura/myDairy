class DriverModel {
  bool? success;
  int? status;
  String? message;
  List<DriverModelData>? data;

  DriverModel({this.success, this.status, this.message, this.data});

  DriverModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DriverModelData>[];
      json['data'].forEach((v) {
        data!.add(DriverModelData.fromJson(v));
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

class DriverModelData {
  int? id;
  String? adminId;
  String? userUniId;
  String? registrationCode;
  int? phone;
  String? cityName;
  int? stateId;
  int? districtId;
  String? village;
  String? experience;
  String? license;
  String? licenseNo;
  String? licenseExpDate;
  String? addharNo;
  int? trash;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? stateName;
  String? districtName;
  Users? users;

  DriverModelData(
      {this.id,
      this.adminId,
      this.userUniId,
      this.registrationCode,
      this.phone,
      this.cityName,
      this.stateId,
      this.districtId,
      this.village,
      this.experience,
      this.license,
      this.licenseNo,
      this.licenseExpDate,
      this.addharNo,
      this.trash,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.stateName,
      this.districtName,
      this.users});

  DriverModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    userUniId = json['user_uni_id'];
    registrationCode = json['registration_code'];
    phone = json['phone'];
    cityName = json['city_name'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    village = json['village'];
    experience = json['experience'];
    license = json['license'];
    licenseNo = json['license_no'];
    licenseExpDate = json['license_exp_date'];
    addharNo = json['addhar_no'];
    trash = json['trash'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stateName = json['state_name'];
    districtName = json['district_name'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['user_uni_id'] = this.userUniId;
    data['registration_code'] = this.registrationCode;
    data['phone'] = this.phone;
    data['city_name'] = this.cityName;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['village'] = this.village;
    data['experience'] = this.experience;
    data['license'] = this.license;
    data['license_no'] = this.licenseNo;
    data['license_exp_date'] = this.licenseExpDate;
    data['addhar_no'] = this.addharNo;
    data['trash'] = this.trash;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state_name'] = this.stateName;
    data['district_name'] = this.districtName;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
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
  String? email;
  var username;
  String? pstr;
  String? countryCode;
  int? phone;
  var createdBy;
  var aboutMe;
  String? image;
  var userFcmToken;
  var userIosToken;
  int? trash;
  int? status;
  int? pushNotification;
  String? createdAt;
  String? updatedAt;
  var birthDate;
  var address;
  int? accountVerified;

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
      this.status,
      this.pushNotification,
      this.createdAt,
      this.updatedAt,
      this.birthDate,
      this.address,
      this.accountVerified});

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
    status = json['status'];
    pushNotification = json['push_notification'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    birthDate = json['birth_date'];
    address = json['address'];
    accountVerified = json['account_verified'];
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
    data['status'] = this.status;
    data['push_notification'] = this.pushNotification;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['birth_date'] = this.birthDate;
    data['address'] = this.address;
    data['account_verified'] = this.accountVerified;
    return data;
  }
}
