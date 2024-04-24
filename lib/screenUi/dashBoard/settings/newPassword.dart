import 'package:milkdairy/all_import.dart';

class PasswordNew extends StatelessWidget {
  PasswordNew({super.key});

  final lowercaseRegex = RegExp(r'[a-z]');

  final uppercaseRegex = RegExp(r'[A-Z]');

  final digitRegex = RegExp(r'\d');

  @override
  Widget build(BuildContext context) {
    return Consumer<SittingProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.DataClean();
          },
          child: Main_Theme.mainTheme(
              icononpress: () {
                provider.DataClean();
                Navigator.pop(context);
              },
              actionwiget: SizedBox(),
              color: AppBodyColor.white,
              width: MediaQuery.of(context).size.width,
              pageName: itemText.changePassword,
              widget: Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormField(
                      controller: provider.oPasswordController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: provider.isPasswordVisible,
                      decoration: InputDecoration(
                          labelText: itemText.oldPassword,
                          prefixIcon: const Icon(Icons.password_rounded),
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.changeShow();
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
                    TextFormField(
                      controller: provider.nPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: provider.isPasswordVisibles,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: itemText.newPassword,
                          prefixIcon: const Icon(Icons.password_rounded),
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.changeShows();
                            },
                            icon: Icon((provider.isPasswordVisibles)
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                          onTap: () async {
                            if (provider.oPasswordController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                  context, itemText.passwordisrequired);
                            } else if (provider.nPasswordController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                  context, itemText.passwordisrequired);
                            } else if (provider.nPasswordController.text
                                    .trim()
                                    .length <
                                6) {
                              snackMessage(context, itemText.leastPassword);
                            } else if (!lowercaseRegex.hasMatch(
                                provider.nPasswordController.text.trim())) {
                              snackMessage(context, itemText.letterPassword);
                            } else if (!uppercaseRegex.hasMatch(
                                provider.nPasswordController.text.trim())) {
                              snackMessage(context, itemText.uppercase);
                            } else if (!digitRegex.hasMatch(
                                provider.nPasswordController.text.trim())) {
                              snackMessage(context, itemText.oneDigitPassword);
                            } else if (provider.oPasswordController.text
                                    .trim() ==
                                provider.nPasswordController.text.trim()) {
                              snackMessage(context, itemText.newOldPassword);
                            } else {
                              var response = await provider.ResetPassword();
                              if (response["success"] == true) {
                                provider.DataClean();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashBoard()));
                                snackMessage(context, response["message"],
                                    no: 2);
                              } else if (response["success"] == false) {
                                snackMessage(context, response["message"]);
                              }
                            }
                          },
                          child: buildContainer(
                              50.h,
                              MediaQuery.of(context).size.width,
                              AppBodyColor.deepPurple,
                              itemText.submit,
                              AppColor.white)),
                    )
                  ],
                ),
              )));
    });
  }
}
