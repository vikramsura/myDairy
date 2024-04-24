import 'package:http/http.dart' as http;
import 'package:milkdairy/all_import.dart';

class LoginProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController(text: "+91");
  bool isLoading = false;

  bool isPasswordVisible = true;
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
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

      Map PhoneNumber = {
        'phone': phoneNumberController.text.toString(),
        "singnature_id": "+91",
        "country_code": codeController.text.toString(),
        "otp_purpose": "2"
      };
      http.Response response = await http.post(ApiUrl, body: PhoneNumber);
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

  Future LogIn() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.login);
      http.Response response = await http.post(ApiUrl, body: {
        'phone': phoneNumberController.text.toString(),
        'password': passwordController.text.toString(),
        "country_code": codeController.text.toString(),
      });

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

  // void GetFCMToken() async {
  //   var appSignatureID = await SmsAutoFill().getAppSignature;
  //   print(appSignatureID);
  //   FirebaseMessaging.instance.getToken().then((newToken) {
  //     print('Token  is here : $newToken');
  //     LocalDataSaver.setUserFcmToken(newToken.toString());
  //   });
  // }

  void dataClear() {
    phoneNumberController.clear();
    passwordController.clear();
    isPasswordVisible = true;
    notifyListeners();
  }
}
