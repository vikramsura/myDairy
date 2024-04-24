import 'package:milkdairy/all_import.dart';

class Signup_Page extends StatefulWidget {
  Signup_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final RegExp phoneRegExp = RegExp(r'^[1-9]\d{9}$');

  @override
  void initState() {
    // initdata();
    // TODO: implement initState
    super.initState();
    Provider.of<SingupProvider>(context, listen: false).GetAdminList();
    Provider.of<SingupProvider>(context, listen: false).GetStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SingupProvider>(
      builder: (context, provider, child) {
        return PopScope(
          onPopInvoked: (didPop) {
            provider.cleanData();
          },
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      provider.cleanData();
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
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Flexible(
                        child: Container(
                          // height: 600,
                          padding: EdgeInsets.only(left: 30, right: 30),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.elliptical(30, 30))),
                          child: SingleChildScrollView(
                            child: Form(
                              key: provider.formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Stack(children: [
                                    CircleAvatar(
                                      radius: 75.r,
                                      backgroundColor: AppColor.Grey,
                                      child: provider.sendFile == null
                                          ? CircleAvatar(
                                              radius: 70.r,
                                              child: Icon(
                                                Icons.person,
                                                size: 100.w,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                showImageViewer(
                                                    context,
                                                    FileImage(
                                                      provider.sendFile!,
                                                    ),
                                                    swipeDismissible: true,
                                                    doubleTapZoomable: true);
                                              },
                                              child: CircleAvatar(
                                                radius: 70.r,
                                                backgroundImage: FileImage(
                                                    provider.sendFile!,
                                                    scale: 0.2),
                                              ),
                                            ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 20,
                                      child: InkWell(
                                        onTap: () {
                                          provider.uploadImage();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: AppColor.black,
                                          radius: 20.w,
                                          child: Icon(Icons.camera_alt,
                                              color: AppColor.white),
                                        ),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 24.w,
                                  ),
                                  Container(
                                    height: 65.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                  focusNode: provider.admins,
                                                  value: provider.myAdmin,
                                                  iconSize: 30,
                                                  icon: (null),
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                  ),
                                                  hint: const Text(
                                                      'Select Admin'),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      provider.myAdmin =
                                                          newValue!;
                                                    });
                                                  },
                                                  items: provider.AdminList.map(
                                                      (item) {
                                                    return DropdownMenuItem(
                                                      value: item['user_uni_id']
                                                          .toString(),
                                                      child: Text(
                                                          item['user_uni_id']),
                                                    );
                                                  }).toList()),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextField(
                                    maxLines: 1,
                                    maxLength: 10,
                                    focusNode: provider.phonefocus,
                                    controller: provider.phone,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: 'Phone no',
                                      prefix: InkWell(
                                          onTap: () {
                                            provider.showCountryPicker(context);
                                          },
                                          child: Text(
                                            "${provider.codeController.text} ",
                                            style: TextStyle(
                                                color: AppBodyColor.black),
                                          )),
                                      hintStyle: const TextStyle(
                                          color: Colors.black26),
                                      counterText: '',
                                      labelText: 'Phone',
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    focusNode: provider.RegistrationCodeFocus,
                                    controller: provider.RegistrationCode,
                                    decoration: const InputDecoration(
                                        label: Text("Reg.Code"),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.fullName,
                                    focusNode: provider.nameFocus,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    decoration: const InputDecoration(
                                        labelText: "Full Name",
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.DairyName,
                                    focusNode: provider.dairyFocus,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        labelText: "Dairy Name",
                                        prefixIcon:
                                            Icon(Icons.edit_note_outlined),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.DairyShortName,
                                    focusNode: provider.dairyshortFocus,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        labelText: "Dairy Short Name",
                                        prefixIcon:
                                            Icon(Icons.edit_note_outlined),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    height: 65.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                  value: provider.myState,
                                                  iconSize: 30,
                                                  icon: (null),
                                                  iconEnabledColor:
                                                      Colors.black,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.w,
                                                  ),
                                                  hint: const Text(
                                                      'Select State'),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      provider.myState =
                                                          newValue!;
                                                      provider.State.text =
                                                          newValue;
                                                      provider.getDistrictList(
                                                          newValue);
                                                    });
                                                  },
                                                  items: provider.statesList
                                                      .map((item) {
                                                    return DropdownMenuItem(
                                                      value:
                                                          item['id'].toString(),
                                                      child: Text(item['name']),
                                                    );
                                                  }).toList()),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    height: 65.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                  value: provider.mytehsil,
                                                  iconSize: 30,
                                                  icon: (null),
                                                  iconEnabledColor:
                                                      Colors.black,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.w,
                                                  ),
                                                  hint: const Text(
                                                      'Select District'),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      provider.mytehsil =
                                                          newValue!;
                                                      provider.Tehsil.text =
                                                          newValue;
                                                    });
                                                  },
                                                  items: provider.tehsilList
                                                      .map((item) {
                                                    return DropdownMenuItem(
                                                      value:
                                                          item['id'].toString(),
                                                      child: Text(item['name']),
                                                    );
                                                  }).toList()),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.city,
                                    focusNode: provider.cityFocus,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        labelText: "City",
                                        prefixIcon:
                                            Icon(Icons.location_city_outlined),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.Village,
                                    focusNode: provider.villageFocus,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        labelText: "Village",
                                        prefixIcon: Icon(Icons.villa_outlined),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.Pincode,
                                    focusNode: provider.pincodeFocus,
                                    maxLines: 1,
                                    maxLength: 6,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        counterText: " ",
                                        labelText: "Pin Code",
                                        prefixIcon:
                                            Icon(Icons.pin_drop_outlined),
                                        border: OutlineInputBorder()),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters long';
                                      }

                                      final lowercaseRegex = RegExp(r'[a-z]');
                                      if (!lowercaseRegex.hasMatch(value)) {
                                        return 'Password must include at least one lowercase letter';
                                      }

                                      final uppercaseRegex = RegExp(r'[A-Z]');
                                      if (!uppercaseRegex.hasMatch(value)) {
                                        return 'Password must include at least one uppercase letter';
                                      }

                                      final digitRegex = RegExp(r'\d');
                                      if (!digitRegex.hasMatch(value)) {
                                        return 'Password must include at least one digit';
                                      }
                                      return null;
                                    },
                                    controller: provider.Password,
                                    focusNode: provider.passwordFocus,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: provider.isPasswordVisible,
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                        prefixIcon:
                                            const Icon(Icons.password_rounded),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            provider.isPasswordVisible =
                                                !provider.isPasswordVisible;
                                            setState(() {});
                                          },
                                          icon: Icon(
                                              (provider.isPasswordVisible)
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                        ),
                                        border: const OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: provider.ConfirmPassword,
                                    focusNode: provider.confirmPasswordFocus,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: provider.isPasswordVisibles,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        labelText: "Confirm Password",
                                        prefixIcon:
                                            const Icon(Icons.password_rounded),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              provider.isPasswordVisibles =
                                                  !provider.isPasswordVisibles;
                                            });
                                          },
                                          icon: Icon(
                                              (provider.isPasswordVisibles)
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          value: provider.checkbox,
                                          onChanged: (value) {
                                            setState(() {
                                              provider.checkbox =
                                                  !provider.checkbox;
                                            });
                                          }),
                                      const Text(
                                        "I accept all",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const Text(
                                        "  Terms & Conditions",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        if (provider.sendFile == null) {
                                          snackMessage(
                                              context, "Please upload image");
                                        } else if (provider.myAdmin
                                                .toString()
                                                .trim()
                                                .isEmpty ||
                                            provider.myAdmin == null) {
                                          provider.admins.requestFocus();
                                          snackMessage(
                                              context, "Please enter Admin!");
                                        } else if (provider.codeController.text
                                            .trim()
                                            .isEmpty) {
                                          snackMessage(context,
                                              "Please enter country code!");
                                        } else if (provider.phone.text
                                            .trim()
                                            .isEmpty) {
                                          provider.phonefocus.requestFocus();
                                          snackMessage(context,
                                              "Please enter phone number!");
                                        } else if (!phoneRegExp.hasMatch(
                                            provider.phone.text.trim())) {
                                          snackMessage(context,
                                              'Invalid phone number format');
                                        } else if (provider.phone.text.trim().length <
                                            10) {
                                          snackMessage(context,
                                              'Phone Number must be at least 10 digits');
                                        } else if (provider.RegistrationCode.text
                                            .trim()
                                            .isEmpty) {
                                          provider.RegistrationCodeFocus
                                              .requestFocus();
                                          snackMessage(
                                              context, "Please enter PinCode");
                                        } else if (provider.fullName.text
                                            .trim()
                                            .isEmpty) {
                                          provider.nameFocus.requestFocus();
                                          snackMessage(context,
                                              "Please enter Your Name!");
                                        } else if (provider.DairyName.text
                                            .trim()
                                            .isEmpty) {
                                          provider.dairyFocus.requestFocus();
                                          snackMessage(context,
                                              "Please enter Dairy Name");
                                        } else if (provider.DairyShortName.text
                                            .trim()
                                            .isEmpty) {
                                          provider.dairyshortFocus
                                              .requestFocus();
                                          snackMessage(context,
                                              "Please enter Dairy Short Name");
                                        } else if (provider.State.text
                                            .trim()
                                            .isEmpty) {
                                          provider.stateFocus.requestFocus();
                                          snackMessage(context, "Select state");
                                        } else if (provider.Tehsil.text
                                            .trim()
                                            .isEmpty) {
                                          provider.tehsilFocus.requestFocus();
                                          snackMessage(
                                              context, "Select district");
                                        } else if (provider.city.text
                                            .trim()
                                            .isEmpty) {
                                          provider.cityFocus.requestFocus();
                                          snackMessage(context, "Select city");
                                        } else if (provider.Village.text
                                            .trim()
                                            .isEmpty) {
                                          provider.villageFocus.requestFocus();
                                          snackMessage(context,
                                              "Please enter village name");
                                        } else if (provider.Pincode.text
                                            .trim()
                                            .isEmpty) {
                                          provider.pincodeFocus.requestFocus();
                                          snackMessage(
                                              context, "Please enter pincode!");
                                        } else if (provider.Pincode.text.trim().length <
                                            6) {
                                          provider.pincodeFocus.requestFocus();
                                          snackMessage(context,
                                              "Please enter 6 pincode!");
                                        } else if (provider.Password.text
                                            .trim()
                                            .isEmpty) {
                                          provider.passwordFocus.requestFocus();
                                          snackMessage(
                                              context, "Please enter Password");
                                        } else if (provider.Password.text
                                                .trim()
                                                .length <
                                            4) {
                                          provider.passwordFocus.requestFocus();
                                          snackMessage(
                                              context, "Password is Too Weak!");
                                        } else if (provider.Password.text
                                                .trim()
                                                .length <
                                            6) {
                                          provider.passwordFocus.requestFocus();
                                          snackMessage(context,
                                              "Minimum 6 Character Required!");
                                        } else if (provider.ConfirmPassword.text
                                            .trim()
                                            .isEmpty) {
                                          provider.confirmPasswordFocus
                                              .requestFocus();
                                          snackMessage(context,
                                              "Please enter Confirm Password!");
                                        } else if (provider.ConfirmPassword.text
                                                .trim() !=
                                            provider.Password.text.trim()) {
                                          provider.confirmPasswordFocus
                                              .requestFocus();
                                          snackMessage(context,
                                              "Password Doesn't Same!");
                                        } else if (provider.checkbox == false) {
                                          snackMessage(context,
                                              "Please accept Terms & Conditions");
                                        } else if (provider.formKey.currentState!
                                            .validate()) {
                                          var response =
                                              await provider.UserRegister();
                                          if (response["success"] != null &&
                                              response["success"] == true) {
                                            UserDetails.userPassword =
                                                provider.Password.text;
                                            var responses =
                                                await provider.GetOtp();
                                            if (responses["success"] == true) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OTP_Verify()));
                                              snackMessage(context,
                                                  "${responses["message"]}",
                                                  no: 2);
                                            } else if (responses["success"] ==
                                                false) {
                                              snackMessage(context,
                                                  "${responses["message"]}");
                                            }
                                          } else if (response["success"] !=
                                                  null &&
                                              response["success"] == false) {
                                            snackMessage(
                                                context, response["message"]);
                                          } else {}
                                        }
                                      },
                                      child: buildContainer(
                                          50.h,
                                          MediaQuery.of(context).size.width,
                                          AppBodyColor.deepPurple,
                                          "Sign Up",
                                          AppColor.white)),
                                  SizedBox(
                                    height: 30.h,
                                  )
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
