
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  static String? userID;
  static String? userName;
  static String? userEmail;
  static String? userPhone;
  static String? userAuth;
  static String? userUniId;
  static String? singnatireId;
  static String? registrationCode;
  static String? parentId;
  static String? birthDate;
  static String? address;
  static String? roleId;
  static String? userFcmToken;
  static String? userAuthToken;
  static String? userPassword;
  static String? userDairyName;
  static String? userLang;
}

Future getUserDetails() async {
  UserDetails.userID = await LocalDataSaver.getUserID();
  UserDetails.userName = await LocalDataSaver.getUserName();
  UserDetails.userEmail = await LocalDataSaver.getUserEmail();
  UserDetails.userPhone = await LocalDataSaver.getUserPhone();
  UserDetails.userAuth = await LocalDataSaver.getUserAuth();
  UserDetails.userUniId = await LocalDataSaver.getUserUniId();
  UserDetails.singnatireId = await LocalDataSaver.getSingnatireId();
  UserDetails.registrationCode = await LocalDataSaver.getRegistrationCode();
  UserDetails.parentId = await LocalDataSaver.getParentId();
  UserDetails.birthDate = await LocalDataSaver.getBirthDate();
  UserDetails.address = await LocalDataSaver.getAddress();
  UserDetails.roleId = await LocalDataSaver.getRoleId();
  UserDetails.userAuthToken = await LocalDataSaver.getUserAuthToken();
  UserDetails.userFcmToken = await LocalDataSaver.getUserFcmToken();
  UserDetails.userDairyName = await LocalDataSaver.getUserDairyName();
  UserDetails.userLang = await LocalDataSaver.getUserLang();
}

class LocalDataSaver {
  static const userIDKey = "User ID Key";
  static const nameKey = "User Name Key";
  static const emailKey = "User Email Key";
  static const phoneKey = "User Phone Key";
  static const authKey = "User Auth Key";
  static const uniIdKey = "User Uni Id Key";
  static const singnIdKey = "Singnatire Id Key";
  static const registrationIdKey = "Registration Code Key";
  static const parentIdKey = "Parent Id Key";
  static const birthKey = "Birth Date Key";
  static const addressKey = "Address Key";
  static const roleKey = "Role Id Key";
  static const userFcmTokenKey = "userFcmToken Key";
  static const userAuthTokenKey = "userAuthToken Key";
  static const userLoginKey = "userLogin Key";
  static const userDairyNamekey = "userDairyName Key";
  static const userLangkey = "userLang Key";

  static Future<bool> setUserLang(String userLang) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userLangkey, userLang);
  }

  static Future<String?> getUserLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userLangkey);
  }

  static Future<bool> setUserDairyName(String userDairyName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userDairyNamekey, userDairyName);
  }

  static Future<String?> getUserDairyName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userDairyNamekey);
  }

  static Future<bool> setUserID(String userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userIDKey, userID);
  }

  static Future<String?> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userIDKey);
  }

  static Future<bool> setUserName(String userName) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(nameKey, userName);
  }

  static Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(nameKey);
  }

  static Future<bool> setUserEmail(String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(emailKey, userEmail);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(emailKey);
  }

  static Future<bool> setUserPhone(String userPhone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(phoneKey, userPhone);
  }

  static Future<String?> getUserPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(phoneKey);
  }

  static Future<bool> setUserAuth(String userAuth) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(authKey, userAuth);
  }

  static Future<String?> getUserAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(authKey);
  }

  static Future<bool> setUserUniId(
    String userUniId,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(uniIdKey, userUniId);
  }

  static Future<String?> getUserUniId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(uniIdKey);
  }

  static Future<bool> setSingnatireId(String singnatireId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(singnIdKey, singnatireId);
  }

  static Future<String?> getSingnatireId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(singnIdKey);
  }

  static Future<bool> setRegistrationCode(String registrationCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(registrationIdKey, registrationCode);
  }

  static Future<String?> getRegistrationCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(registrationIdKey);
  }

  static Future<bool> setParentId(String parentId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(parentIdKey, parentId);
  }

  static Future<String?> getParentId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(parentIdKey);
  }

  static Future<bool> setUserFcmToken(String userFcmToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userFcmTokenKey, userFcmToken);
  }

  static Future<String?> getUserFcmToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userFcmTokenKey);
  }

  static Future<bool> setBirthDate(String birthDate) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(birthKey, birthDate);
  }

  static Future<String?> getBirthDate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(birthKey);
  }

  static Future<bool> setAddress(String address) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(addressKey, address);
  }

  static Future<String?> getAddress() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(addressKey);
  }

  static Future<bool> setRoleId(String roleId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(roleKey, roleId);
  }

  static Future<String?> getRoleId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(roleKey);
  }

  static Future<bool> setUserAuthToken(String userAuthToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userAuthTokenKey, userAuthToken);
  }

  static Future<String?> getUserAuthToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userAuthTokenKey);
  }

  static Future<bool> setUserLogin(bool isLogin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool(userLoginKey, isLogin);
  }

  static Future<bool?> getUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoginKey);
  }
}

Future clearUserDetails() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  await sharedPreferences.remove("User ID Key");
  LocalDataSaver.setUserLogin(false);
  await getUserDetails();
}

class AppData {
  static String? userName;
  static int? userNumber;

  static const String userNameKey = "user name";
  static const String userNumberKey = "user number";

  static Future<void> userData() async {
    userName = await getData(userNameKey);
    userNumber = await getData(userNumberKey);
  }

  static Future setData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    }
    return null;
  }

  static Future<T?> getData<T>(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.get(key);
    if (value == null) {
      return null;
    }
    if (T == bool && value is bool ||
        T == int && value is int ||
        T == String && value is String ||
        T == double && value is double) {
      return value as T;
    }
    return null;
  }

}
