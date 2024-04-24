import 'package:http/http.dart' as http;
import 'package:milkdairy/Model/profileModel.dart';
import 'package:milkdairy/all_import.dart';

class ProfProviderPage with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dairyNameController = TextEditingController();
  TextEditingController diaryShortNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController tehsilController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  bool isEditData = true;
  bool isLoading = false;
  String? imageFiles;
  List statesList = [];
  String? myState;
  List tehsilList = [];
  String? mytehsil;
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
        tehsilController.clear();
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

  void dataClear() {
    isEditData = true;
    statesList.clear();
    tehsilList.clear();
    myState = null;
    mytehsil = null;
    isState = null;
    isTehsil = null;
    sendNewFile = null;
    nameController.clear();
    phoneController.clear();
    dairyNameController.clear();
    diaryShortNameController.clear();
    stateController.clear();
    tehsilController.clear();
    cityController.clear();
    villageController.clear();
    pinCodeController.clear();
    notifyListeners();
  }

  Future<void> GetProfileData() async {
    isLoading = true;
    data = await GetProfileList();
    imageFiles = data.image.toString();
    nameController.text = data.name ?? "Name";
    dairyNameController.text = data.userDetails?.dairyName ?? "DairyName";
    diaryShortNameController.text =
        data.userDetails?.dairyShtName ?? "Diary Short Name";
    stateController.text = data.userDetails?.state?.name.toString() ?? "State";
    isState = data.userDetails?.state?.id.toString();
    tehsilController.text =
        data.userDetails?.district?.name.toString() ?? "District";
    isTehsil = data.userDetails?.district?.id.toString();
    cityController.text = data.userDetails?.city.toString() ?? "City";
    villageController.text = data.userDetails?.village ?? "Village";
    pinCodeController.text = data.userDetails?.pincode.toString() ?? "Pin Code";
    phoneController.text = data.phone.toString() ?? "Phone";
    LocalDataSaver.setUserName(data.name.toString());
    LocalDataSaver.setUserPhone(data.phone.toString());
    LocalDataSaver.setUserDairyName(
        data.userDetails?.dairyName.toString() ?? "Dairy Name");
    await getUserDetails();
    isLoading = false;
    notifyListeners();
  }

  ProfileModeleData data = ProfileModeleData();

  Future GetProfileList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.Getprofile);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      });
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        ProfileModele newsModel = ProfileModele.fromJson(jsonResponse);
        data = newsModel.data!;
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

  Future checkAuthToken(context) async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.Getprofile);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      });
      if (response.statusCode == 200) {
      } else {
        clearUserDetails();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      }
    } catch (e) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    }
  }

  Future UpdateProfile() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.updateProfile);
      final newDataFrom = await http.MultipartRequest("Post", ApiUrl,);
      if (sendNewFile != null) {
        newDataFrom.files
            .add(await http.MultipartFile.fromPath("image", sendNewFile!.path));
      }
      newDataFrom.fields.addAll({
        "country_code": "+91",
        "phone": phoneController.text.toString(),
        "name": nameController.text.toString(),
        "dairy_name": dairyNameController.text.toString(),
        "dairy_sht_name": diaryShortNameController.text.toString(),
        "state_id": isState.toString(),
        "district_id": isTehsil.toString(),
        "city": cityController.text.toString(),
        "village": villageController.text.toString(),
        "pincode": pinCodeController.text.toString(),
      });

      newDataFrom.headers['Authorization'] =
          'Bearer ${UserDetails.userAuthToken}';
      newDataFrom.headers['Accept-Language'] = '${UserDetails.userLang}';
      final response = await http.Response.fromStream(await newDataFrom.send());
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
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

  File? sendNewFile;

  Future uploadImage() async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    sendNewFile = File(pickedFile!.path);
    notifyListeners();
  }
}
