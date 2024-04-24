import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:milkdairy/Model/driverModel.dart';
import 'package:milkdairy/all_import.dart';

class DriverProvider with ChangeNotifier {
  var enabled = '1';
  bool isLoading = true;
  String? id;
  File? uploadPhoto;
  String? licensePhoto;
  bool isPasswordVisible = true;
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController registrationCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController licenseExpDateController = TextEditingController();
  TextEditingController addharController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

  List statesList = [];
  String? myState;
  String? myStateId;
  List tehsilList = [];
  String? mytehsil;
  String? mytehsilId;
  String? isState;
  String? isTehsil;

  Future GetStateList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.stateapi);
      http.Response response = await http.post(ApiUrl);
      if (response.statusCode == 200) {
        statesList.clear();
        tehsilList.clear();
        myState = null;
        mytehsil = null;
        notifyListeners();
        Map data = jsonDecode(response.body);
        statesList.addAll(data['data']);
        notifyListeners();
      }
    } catch (e) {}
  }

  Future GetTehsilList(String stateId) async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.districtList);
      Map PhoneNumbe = {
        'state_id': stateId,
      };
      http.Response response = await http.post(ApiUrl, body: PhoneNumbe);
      if (response.statusCode == 200) {
        tehsilList.clear();
        mytehsil = null;
        districtController.clear();
        cityController.clear();
        notifyListeners();
        Map data = jsonDecode(response.body);
        tehsilList.addAll(data['data']);
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  String? fileName;
  Future uploadImage() async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    uploadPhoto = File(pickedFile!.path);
    List<String> filePath = uploadPhoto.toString().split("/");
    fileName = filePath.last.toString();

    notifyListeners();
  }

  void getInitDate() {
    final dateTime = DateTime.now();
    final initDate = DateFormat("yyyy-MM-dd").format(dateTime).toString();
    dateController = TextEditingController(text: initDate);
    licenseExpDateController = TextEditingController(text: initDate);
  }

  void changeValues(value) {
    enabled = value;
    notifyListeners();
  }

  void initData(context, DriverModelData driverList) {
    myStateId = driverList.stateId.toString();
    mytehsilId = driverList.districtId.toString();
    nameController.text = driverList.users!.name.toString();
    emailController.text = driverList.users!.email.toString();
    phoneController.text = driverList.phone.toString();
    registrationCodeController.text = driverList.registrationCode.toString();
    licenseController.text = driverList.licenseNo.toString();
    licenseExpDateController.text = driverList.licenseExpDate.toString();
    stateController.text = driverList.stateName.toString();
    districtController.text = driverList.districtName.toString();
    cityController.text = driverList.cityName.toString();
    villageController.text = driverList.village.toString();
    experienceController.text = driverList.experience.toString();
    addharController.text = driverList.addharNo.toString();
    addressController.text = driverList.users!.address.toString();
    licensePhoto = driverList.license.toString();
    notifyListeners();
  }

  Future GetDriverData() async {
    isLoading = true;
    driverlList = await GetDriverList();
    isLoading = false;
    notifyListeners();
  }

  List<DriverModelData> driverlList = [];

  Future GetDriverList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.driverListBmc);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        driverlList.clear();
        var jsonResponse = jsonDecode(response.body);
        DriverModel driverModel = DriverModel.fromJson(jsonResponse);
        driverlList.addAll(driverModel.data!);
        return driverlList;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future addDriver(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.bmcDriver);
      final newDataFrom = await http.MultipartRequest(
        "Post",
        ApiUrl,
      );
      if (uploadPhoto != null) {
        newDataFrom.files.add(
            await http.MultipartFile.fromPath("license", uploadPhoto!.path));
      }
      newDataFrom.fields.addAll({
        "parent_id": UserDetails.parentId.toString(),
        "country_code": "+91",
        "name": nameController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
        "registration_code": registrationCodeController.text,
        "experience": experienceController.text,
        "village": villageController.text,
        "addhar_no": addharController.text,
        "license_exp_date": licenseExpDateController.text,
        "license_no": licenseController.text,
        "city_name": cityController.text,
        "email": emailController.text,
        "state_id": myState.toString(),
        "district_id": mytehsil.toString(),
        "address": addressController.text,
      });

      newDataFrom.headers['Authorization'] =
          'Bearer ${UserDetails.userAuthToken}';
      newDataFrom.headers['Accept-Language'] = '${UserDetails.userLang}';
      final response = await http.Response.fromStream(await newDataFrom.send());
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          dataClear();
          GetDriverData();
          Navigator.pop(context);
          snackMessage(context, data['message'], no: 2);
        } else if (data['success'] == false) {
          snackMessage(context, data['message']);
        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future editDriverList(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var apiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.driverEditBmc);
      final newDataFrom = await http.MultipartRequest(
        "Post",
        apiUrl,
      );
      if (uploadPhoto != null) {
        newDataFrom.files.add(
            await http.MultipartFile.fromPath("license", uploadPhoto!.path));
      }
      newDataFrom.fields.addAll({
        "id": id.toString(),
        "parent_id": UserDetails.parentId.toString(),
        "country_code": "+91",
        "name": nameController.text,
        "phone": phoneController.text,
        "password": passwordController.text,
        "registration_code": registrationCodeController.text,
        "experience": experienceController.text,
        "village": villageController.text,
        "addhar_no": addharController.text,
        "license_exp_date": licenseExpDateController.text,
        "license_no": licenseController.text,
        "city_name": cityController.text,
        "email": emailController.text,
        "state_id": myState == null ? myStateId.toString() : myState.toString(),
        "district_id":
            mytehsil == null ? mytehsilId.toString() : myState.toString(),
        "address": addressController.text,
      });

      newDataFrom.headers['Authorization'] =
          'Bearer ${UserDetails.userAuthToken}';
      newDataFrom.headers['Accept-Language'] = '${UserDetails.userLang}';
      final response = await http.Response.fromStream(await newDataFrom.send());

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);

        if (data['success'] == true) {
          dataClear();
          GetDriverData();
          Navigator.pop(context);
          snackMessage(context, data['message'], no: 2);
        } else if (data['success'] == false) {
          snackMessage(context, data['message']);
        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  void dataClear() {
    dateController.clear();
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    stateController.clear();
    districtController.clear();
    cityController.clear();
    villageController.clear();
    addressController.clear();
    registrationCodeController.clear();
    experienceController.clear();
    licenseExpDateController.clear();
    licenseController.clear();
    addharController.clear();
    isPasswordVisible = true;
    enabled = '1';
    myState = null;
    mytehsil = null;
    uploadPhoto = null;
    fileName = null;
    statesList.clear();
    tehsilList.clear();
    notifyListeners();
  }

  Future deleteDriver(userId) async {
    try {
      var apiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.driverDeleteBmc);
      http.Response response = await http.post(apiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      }, body: {
        "id": userId
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        isLoading = false;
        notifyListeners();
        return data;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
