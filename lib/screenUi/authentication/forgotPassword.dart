import 'package:milkdairy/all_import.dart';

class Forgot_Password extends StatelessWidget {
  Forgot_Password({Key? key}) : super(key: key);

  final RegExp phoneRegExp = RegExp(r'^\d{10}$');

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
                  // height: MediaQuery.of(context).size.height,
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
                                "Forgot Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Password is very important, be careful",
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
                        child: Container(
                          // height: 600,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.elliptical(30, 30))),
                          child: Padding(
                            padding: EdgeInsets.only(right: 30, left: 30),
                            child: SingleChildScrollView(
                              child: Form(
                                key: provider.formKey,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    TextField(
                                      maxLines: 1,
                                      maxLength: 10,
                                      controller: provider.phoneController,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          prefix: InkWell(
                                              onTap: () {
                                                provider
                                                    .showCountryPicker(context);
                                              },
                                              child: Text(
                                                  "${provider.codeController.text} ",
                                                  style: TextStyle(
                                                      color:
                                                          AppBodyColor.black))),
                                          counterText: "",
                                          labelText: "Phone",
                                          border: OutlineInputBorder()),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          if (provider.phoneController.text
                                              .trim()
                                              .toString()
                                              .isEmpty) {
                                            snackMessage(context,
                                                "Must Be required phone number");
                                          } else if (provider
                                                  .phoneController.text
                                                  .trim()
                                                  .toString()
                                                  .length <
                                              10) {
                                            snackMessage(context,
                                                "Phone Number must be at least 10 digits");
                                          } else if (!phoneRegExp.hasMatch(
                                              provider.phoneController.text
                                                  .trim()
                                                  .toString())) {
                                            snackMessage(context,
                                                'Invalid phone number format');
                                          } else {
                                            var response =
                                                await provider.GetOtp();
                                            if (response["success"] == true) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          forogotOtpVerify()));
                                              snackMessage(
                                                  context, response["message"],
                                                  no: 2);
                                            } else if (response["success"] ==
                                                false) {
                                              snackMessage(
                                                  context, response["message"]);
                                            }
                                          }
                                        },
                                        child: buildContainer(
                                            50.h,
                                            MediaQuery.of(context).size.width,
                                            AppBodyColor.deepPurple,
                                            "Get OTP",
                                            AppColor.white)),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                  ],
                                ),
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
