import 'package:milkdairy/all_import.dart';

class forogotOtpVerify extends StatefulWidget {
  @override
  State<forogotOtpVerify> createState() => _forogotOtpVerifyState();
}

class _forogotOtpVerifyState extends State<forogotOtpVerify> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ForgotOtpVerifyProvider>(context, listen: false).getTimer();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ForgotOtpVerifyProvider>(context, listen: false).disposeTime();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotOtpVerifyProvider>(
      builder: (context, provider, child) {
        return PopScope(
          onPopInvoked: (didPop) {
            provider.dataClear();
          },
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      provider.dataClear();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      color: Colors.black,
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
                body: Container(
                  color: AppBodyColor.deepPurple,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Don't share your OTP, be careful",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.4,
                            // height: 600,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.elliptical(30, 30))),
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, left: 30),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  // const OtpForm(),
                                  OTPTextField(
                                    onChanged: (values) {
                                      provider.changeValue(values);
                                    },
                                    controller: provider.otpPinController,
                                    length: 4,
                                    width: MediaQuery.of(context).size.width,
                                    fieldWidth: 50,
                                    style: TextStyle(fontSize: 17),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.underline,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (provider.enableResend == true) {
                                        provider.otpCode = null;
                                        provider.otpPinController.clear();
                                        var response = await provider.GetOtp();
                                        if (response["success"] == true) {
                                          provider.otpCode = null;
                                          provider.resendCode();
                                          snackMessage(
                                              context, response["message"],
                                              no: 2);
                                        } else if (response["success"] ==
                                            false) {
                                          snackMessage(
                                              context, response["message"]);
                                        }
                                      } else {}
                                    },
                                    child: buildContainer(
                                        40.w,
                                        MediaQuery.of(context).size.width / 2,
                                        provider.enableResend == true
                                            ? AppBodyColor.deepPurple
                                            : Colors.black26,
                                        "Resend OTP",
                                        AppColor.white),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  StatefulBuilder(builder: (context, state) {
                                    provider.timerState = state;
                                    return RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                'You can request  otp again after  ',
                                            style: TextStyle(
                                              color: AppColor.red,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '0.${provider.secondsRemaining} ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        var response = await provider
                                            .ForgotOtpVeification();
                                        if (response["success"] != null &&
                                            response["success"] == true) {
                                          LocalDataSaver.setUserLogin(true);
                                          LocalDataSaver.setParentId(
                                              response["data"]["parent_id"]
                                                  .toString());
                                          LocalDataSaver.setRoleId(
                                              response["data"]["role_id"]
                                                  .toString());
                                          LocalDataSaver.setUserUniId(
                                              response["data"]["user_uni_id"]
                                                  .toString());
                                          LocalDataSaver.setRegistrationCode(
                                              response["data"]
                                                      ["registration_code"]
                                                  .toString());
                                          LocalDataSaver.setUserAuth(
                                              response["data"]["user_auth_key"]
                                                  .toString());
                                          LocalDataSaver.setUserPhone(
                                              response["data"]["phone"]
                                                  .toString());
                                          LocalDataSaver.setUserName(
                                              response["data"]["name"]
                                                  .toString());
                                          LocalDataSaver.setUserEmail(
                                              response["data"]["email"]
                                                  .toString());
                                          LocalDataSaver.setUserAuthToken(
                                              response["data"]["access_token"]
                                                  .toString());
                                          await getUserDetails();
                                          provider.passwordController.clear();
                                          provider.ConfirmPassController
                                              .clear();
                                          snackMessage(
                                              context, response["message"],
                                              no: 2);
                                          provider.otpPinController.clear();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      New_Password()));
                                        } else if (response["success"] !=
                                                null &&
                                            response["success"] == false) {
                                          snackMessage(
                                              context, response["message"]);
                                        } else {}
                                      },
                                      child: buildContainer(
                                          50.h,
                                          MediaQuery.of(context).size.width,
                                          AppBodyColor.deepPurple,
                                          "Verify",
                                          AppColor.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: provider.isLoading,
                  child: Scaffold(
                    backgroundColor: Colors.black26,
                    body: Center(
                        child: CircularProgressIndicator(
                      color: AppColor.deepPurple,
                    )),
                  ))
            ],
          ),
        );
      },
    );
  }
}
