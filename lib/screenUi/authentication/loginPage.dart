import 'package:milkdairy/all_import.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final RegExp phoneRegExp = RegExp(r'^\d{10}$');

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
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
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Sign In now to begin an amazing journey",
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
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.elliptical(30, 30))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                ),
                                TextField(
                                  maxLines: 1,
                                  maxLength: 10,
                                  controller: provider.phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      prefix: InkWell(
                                          onTap: () {
                                            provider.showCountryPicker(context);
                                          },
                                          child: Text(
                                              "${provider.codeController.text} ",
                                              style: TextStyle(
                                                  color: AppBodyColor.black))),
                                      counterText: " ",
                                      labelText: "Phone",
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextField(
                                  controller: provider.passwordController,
                                  keyboardType: TextInputType.multiline,
                                  obscureText: provider.isPasswordVisible,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      border: OutlineInputBorder(),
                                      prefixIcon: Icon(Icons.password_outlined),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          provider.showPassword();
                                        },
                                        icon: Icon((provider.isPasswordVisible)
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      )),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (provider.phoneNumberController.text
                                        .trim()
                                        .toString()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "Must Be required phone number");
                                    } else if (provider
                                            .phoneNumberController.text
                                            .trim()
                                            .toString()
                                            .length <
                                        10) {
                                      snackMessage(context,
                                          "Phone Number must be at least 10 digits");
                                    } else if (!phoneRegExp.hasMatch(provider
                                        .phoneNumberController.text
                                        .trim()
                                        .toString())) {
                                      snackMessage(context,
                                          'Invalid phone number format');
                                    } else if (provider.passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(
                                          context, 'Password is required');
                                    } else if (provider.passwordController.text
                                            .trim()
                                            .length <
                                        6) {
                                      snackMessage(context,
                                          "Password must be at least 6 digits ");
                                    } else {
                                      var response = await provider.LogIn();
                                      if (response["success"] != null &&
                                          response["success"] == true &&
                                          response["data"]
                                                  ["account_verified"] !=
                                              0) {
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
                                        getUserDetails();
                                        Provider.of<LoginProvider>(context,
                                                listen: false)
                                            .dataClear();
                                        Provider.of<SingupProvider>(context,
                                                listen: false)
                                            .cleanData();
                                        Provider.of<OtpVerifyProvider>(context,
                                                listen: false)
                                            .dataClear();
                                        snackMessage(
                                            context, response["message"],
                                            no: 2);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DashBoard(),
                                            ),
                                            (route) => false);
                                      } else if (response["success"] != null &&
                                          response["success"] == false) {
                                        snackMessage(
                                            context, "${response["message"]}");
                                      } else if (response["data"]
                                              ["account_verified"] ==
                                          0) {
                                        var respons = await provider.GetOtp();
                                        if (respons["success"] == true) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginOtpVerify(),
                                              ));
                                          snackMessage(
                                              context, "${respons["message"]}",
                                              no: 2);
                                        } else if (respons["success"] ==
                                            false) {
                                          snackMessage(
                                              context, "${respons["message"]}");
                                        }
                                      }
                                    }
                                  },
                                  child: buildContainer(
                                      50.h,
                                      MediaQuery.of(context).size.width,
                                      AppBodyColor.deepPurple,
                                      "Login ",
                                      AppColor.white),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Forgot_Password()));
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You don't have an account?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Signup_Page()));
                                        },
                                        child: Text(
                                          "   SignUp here",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.deepOrange),
                                        )),
                                  ],
                                ),
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
                  body: Center(child: CircularProgressIndicator()),
                ))
          ],
        );
      },
    );
  }
}
