import 'package:milkdairy/all_import.dart';

class New_Password extends StatefulWidget {
  const New_Password({super.key});

  @override
  State<New_Password> createState() => _New_PasswordState();
}

class _New_PasswordState extends State<New_Password> {
  final digitRegex = RegExp(r'\d');
  final uppercaseRegex = RegExp(r'[A-Z]');
  final lowercaseRegex = RegExp(r'[a-z]');
  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotOtpVerifyProvider>(
        builder: (context, provider, child) {
      return provider.isLoading
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                  child: CircularProgressIndicator(
                color: AppColor.deepPurple,
              )),
            )
          : Main_Theme.mainTheme(
              icononpress: () {
                Navigator.pop(context);
              },
              actionwiget: SizedBox(),
              color: AppBodyColor.white,
              width: MediaQuery.of(context).size.width,
              pageName: 'New Password',
              widget: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  TextField(
                    controller: provider.passwordController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.showPassword();
                          },
                          icon: Icon((provider.isPasswordVisible)
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    controller: provider.ConfirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.isPasswordVisibles,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.showPasswordC();
                          },
                          icon: Icon((provider.isPasswordVisibles)
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                      onTap: () async {
                        if (provider.passwordController.text.trim().isEmpty) {
                          snackMessage(context, "Enter Password");
                        } else if (provider.passwordController.text
                                .trim()
                                .length <
                            4) {
                          snackMessage(context, "Password is Too Weak!");
                        } else if (provider.passwordController.text
                                .trim()
                                .length <
                            6) {
                          snackMessage(
                              context, "Minimum 6 Character Required!");
                        } else if (!lowercaseRegex.hasMatch(
                            provider.passwordController.text.trim())) {
                          snackMessage(context,
                              'Password must include at least one lowercase letter');
                        } else if (!uppercaseRegex.hasMatch(
                            provider.passwordController.text.trim())) {
                          snackMessage(context,
                              'Password must include at least one uppercase letter');
                        } else if (!digitRegex.hasMatch(
                            provider.passwordController.text.trim())) {
                          snackMessage(context,
                              'Password must include at least one digit');
                        } else if (provider.ConfirmPassController.text
                            .trim()
                            .isEmpty) {
                          snackMessage(context, "Enter Confirm Password!");
                        } else if (provider.ConfirmPassController.text.trim() !=
                            provider.passwordController.text.trim()) {
                          snackMessage(context, "Password Doesn't Same!");
                        } else if (provider.formKey.currentState!.validate()) {
                          var response = await provider.ForgotResetPassword();
                          if (response["success"] == true) {
                            provider.dataClear();
                            Provider.of<LoginProvider>(context, listen: false)
                                .dataClear();
                            Provider.of<SingupProvider>(context, listen: false)
                                .cleanData();
                            Provider.of<OtpVerifyProvider>(context,
                                    listen: false)
                                .dataClear();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (route) => false);
                            snackMessage(context, response["message"], no: 2);
                          } else if (response["success"] == false) {
                            snackMessage(context, response["message"]);
                          }
                        }
                      },
                      child: buildContainer(
                          50.h,
                          MediaQuery.of(context).size.width,
                          AppBodyColor.deepPurple,
                          "SUBMIT",
                          AppColor.white))
                ],
              ));
    });
  }
}
