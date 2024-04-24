import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class SingupProvider with ChangeNotifier {
  TextEditingController codeController = TextEditingController(text: "+91");
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController DairyName = TextEditingController();
  TextEditingController DairyShortName = TextEditingController();
  TextEditingController Tehsil = TextEditingController();
  TextEditingController Village = TextEditingController();
  TextEditingController State = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController District = TextEditingController();
  TextEditingController Pincode = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
  TextEditingController RegistrationCode = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List statelist = [];
  String selectedstateID = "";
  FocusNode phonefocus = FocusNode();
  FocusNode admins = FocusNode();
  FocusNode code = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode dairyFocus = FocusNode();
  FocusNode dairyshortFocus = FocusNode();
  FocusNode tehsilFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode pincodeFocus = FocusNode();
  FocusNode RegistrationCodeFocus = FocusNode();
  FocusNode villageFocus = FocusNode();
  FocusNode stateFocus = FocusNode();
  FocusNode districtFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  bool isLoading = false;
  bool checkbox = false;
  bool isPasswordVisible = true;
  bool isPasswordVisibles = true;
  File? sendFile;
  final icon = ['user', 'cow', 'cow'];

  Future UserRegister() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.userRegister);
      final dataFrom = await http.MultipartRequest(
        "Post",
        ApiUrl,
      );
      dataFrom.files
          .add(await http.MultipartFile.fromPath("image", sendFile!.path));
      dataFrom.fields.addAll({
        "country_code": codeController.text.toString(),
        'parent_id': myAdmin.toString(),
        'name': fullName.text.toString(),
        'phone': phone.text.toString(),
        'password': Password.text.toString(),
        'dairy_name': DairyName.text.toString(),
        'dairy_sht_name': DairyShortName.text.toString(),
        'city_id': city.text.toString(),
        'state_id': myState.toString(),
        'district_id': mytehsil.toString(),
        'village': Village.text.toString(),
        'registration_code': RegistrationCode.text.toString(),
        "pincode": Pincode.text.toString(),
        'latitude': '25.192181',
        'longitude': '75.850838'
      });
      final response = await http.Response.fromStream(await dataFrom.send());
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
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

  List statesList = [];
  String? myState;

  List tehsilList = [];
  String? mytehsil;

  List AdminList = [];
  String? myAdmin;

  Future GetStateList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.stateapi);
      http.Response response = await http.post(ApiUrl);
      if (response.statusCode == 200) {
        statesList.clear();
        tehsilList.clear();
        myState = null;
        mytehsil = null;
        Tehsil.clear();
        city.clear();
        notifyListeners();
        var data = jsonDecode(response.body);
        statesList.addAll(data['data']);
        notifyListeners();
      } else {}
    } catch (e) {}
  }

  Future getDistrictList(String stateId) async {
    try {
      var apiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.districtList);
      http.Response response = await http.post(apiUrl, body: {'state_id': stateId,});
      if (response.statusCode == 200) {
        tehsilList.clear();
        mytehsil = null;
        Tehsil.clear();
        city.clear();
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

  Future GetAdminList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.ADMINLIST);
      http.Response response = await http.post(ApiUrl);
      if (response.statusCode == 200) {
        AdminList.clear();
        notifyListeners();
        Map data = jsonDecode(response.body);
        AdminList.addAll(data['data']);
        notifyListeners();
      } else {}
    } catch (e) {}
  }

  void cleanData() {
    sendFile = null;
    fullName.clear();
    DairyName.clear();
    DairyShortName.clear();
    Tehsil.clear();
    Village.clear();
    State.clear();
    city.clear();
    District.clear();
    Pincode.clear();
    Password.clear();
    ConfirmPassword.clear();
    RegistrationCode.clear();
    statelist.clear();
    selectedstateID = "";
    checkbox = false;
    isPasswordVisible = false;
    statesList.clear();
    myState = null;
    phone.clear();
    tehsilList.clear();
    mytehsil = null;
    AdminList.clear();
    myAdmin = null;
    notifyListeners();
  }

  Future uploadImage() async {
    final picker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    sendFile = File(pickedFile!.path);
    notifyListeners();
  }

  void showCountryPicker(
    context,
  ) async {
    final country = await showCountryPickerSheet(context);
    if (country != null) {
      codeController =
          TextEditingController(text: country.callingCode.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future GetOtp() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.loginOtpSend);

      Map PhoneNumbe = {
        'phone': phone.text.toString(),
        "singnature_id": "+91",
        "country code": codeController.text.toString(),
        "otp_purpose": "1",
      };
      http.Response response = await http.post(ApiUrl, body: PhoneNumbe);
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
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
