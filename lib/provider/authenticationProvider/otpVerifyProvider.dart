import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class OtpVerifyProvider with ChangeNotifier {

  OtpFieldController otpPinController = OtpFieldController();
  void changeValue(value){
    otpCode=value;
    otpPinController=value as OtpFieldController;
    notifyListeners();
  }
  void ShowPassword(){
    isPasswordVisible=!isPasswordVisible;
    notifyListeners();
  }

  bool isLoading = false;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  String ?otpCode;
  late FocusNode myFocusNode;

  StateSetter? timerState;


  void resendCode() async {
    secondsRemaining = 60;
    enableResend = false;
    notifyListeners();
  }

  Future OtpVeification(context) async {
    try{
    isLoading=true;
    notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.otpVerify);
    Map OtpVerify = {
      'phone':  Provider.of<SingupProvider>(context, listen: false).phone.text.toString(),
      'login_otp': otpCode.toString(),
      'user_fcm_token': UserDetails.userFcmToken.toString(),
      "country_code":Provider.of<SingupProvider>(context, listen: false).codeController.text.toString(),
      "otp_purpose":"1"
    };

    http.Response response = await http.post(ApiUrl, body: OtpVerify);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isLoading=false;
      notifyListeners();
      return data;
    }else{
      isLoading=false;
      notifyListeners();
    }}catch(e){
      isLoading = false;
      notifyListeners();
    }
  }
  Future OtpVeificationLogin(context) async {
    try{
    isLoading=true;
    notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.otpVerify);
    Map OtpVerify = {
      'phone': Provider.of<LoginProvider>(context, listen: false).phoneNumberController.text.toString(),
      'login_otp': otpCode.toString(),
      'user_fcm_token': UserDetails.userFcmToken.toString(),
      "country_code":Provider.of<LoginProvider>(context, listen: false).codeController.text.toString(),
      "otp_purpose":"2"
    };
    http.Response response = await http.post(ApiUrl, body: OtpVerify);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isLoading=false;
      notifyListeners();
      return data;
    } else {
      isLoading=false;
      notifyListeners();
    }}catch(e){
      isLoading = false;
      notifyListeners();
    }
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

      }
    });
  }

  void disposeTime() {
    myFocusNode.dispose();
    timer.cancel();
  }
  void dataClear(){
    otpCode=null;

  }

}
