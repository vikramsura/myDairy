class ProfileModele {
  bool? success;
  int? status;
  String? message;
  ProfileModeleData? data;

  ProfileModele({this.success, this.status, this.message, this.data});

  ProfileModele.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  ProfileModeleData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModeleData {
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
  var username;
  String? pstr;
  String? countryCode;
  int? phone;
  int? createdBy;
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
  UserData? userDetails;

  ProfileModeleData(
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
        this.accountVerified,
        this.userDetails});

  ProfileModeleData.fromJson(Map<String, dynamic> json) {
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
    userDetails = json['user_details'] != null
        ?  UserData.fromJson(json['user_details'])
        : null;
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
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? userUniId;
  String? registrationCode;
  String? dairyName;
  String? dairyShtName;
  String? city;
  int? stateId;
  int? districtId;
  String? village;
  int? pincode;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  District? district;
  District? state;

  UserData(
      {this.id,
        this.userUniId,
        this.registrationCode,
        this.dairyName,
        this.dairyShtName,
        this.city,
        this.stateId,
        this.districtId,
        this.village,
        this.pincode,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.district,
        this.state});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userUniId = json['user_uni_id'];
    registrationCode = json['registration_code'];
    dairyName = json['dairy_name'];
    dairyShtName = json['dairy_sht_name'];
    city = json['city'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    village = json['village'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    state = json['state'] != null ? new District.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_uni_id'] = this.userUniId;
    data['registration_code'] = this.registrationCode;
    data['dairy_name'] = this.dairyName;
    data['dairy_sht_name'] = this.dairyShtName;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['village'] = this.village;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class District {
  int? id;
  String? name;

  District({this.id, this.name});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}