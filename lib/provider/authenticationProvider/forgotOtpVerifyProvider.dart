import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class ForgotOtpVerifyProvider with ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ConfirmPassController = TextEditingController();
  OtpFieldController otpPinController = OtpFieldController();
  TextEditingController codeController = TextEditingController(text: "+91");
  bool isLoading = false;

  void changeValue(value) {
    otpCode = value;
    otpPinController = value;
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
  }

  int secondsRemaining = 60;
  bool enableResend = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isPasswordVisibles = true;
  String? otpCode;
  final int otpCodelenth = 4;
  late FocusNode myFocusNode;
  late Timer timer;

  StateSetter? timerState;

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void showPasswordC() {
    isPasswordVisibles = !isPasswordVisibles;
    notifyListeners();
  }

  void resendCode() async {
    secondsRemaining = 60;
    enableResend = false;
    notifyListeners();
  }

  void getTimer() {
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        if (timerState != null) {
          timerState!(() {});
        }
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }

  void disposeTime() {
    myFocusNode.dispose();
    timer.cancel();
  }

  Future ForgotOtpVeification() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.otpVerify);
      Map OtpVerify = {
        'phone': phoneController.text.toString(),
        'login_otp': otpCode.toString(),
        "user_fcm_token": UserDetails.userFcmToken.toString(),
        "country_code": codeController.text.toString(),
        "otp_purpose": "3"
      };

      http.Response response = await http.post(ApiUrl, body: OtpVerify);
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

  Future ForgotResetPassword() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.forgotResetPassword);
      Map resetPassword = {
        'phone': phoneController.text.toString(),
        'password': passwordController.text.toString(),
        'password_confirmation': ConfirmPassController.text.toString(),
        "country_code": codeController.text.toString(),
      };
      http.Response response = await http.post(ApiUrl, body: resetPassword);
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

  Future GetOtp() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.loginOtpSend);

      Map PhoneNumbe = {
        'phone': phoneController.text.toString(),
        "singnature_id": "+91",
        "country_code": codeController.text.toString(),
        "otp_purpose": "3"
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

  void dataClear() {
    secondsRemaining = 60;
    enableResend = false;
    otpCode = null;
    passwordController.clear();
    phoneController.clear();
    ConfirmPassController.clear();
    notifyListeners();
  }


}
