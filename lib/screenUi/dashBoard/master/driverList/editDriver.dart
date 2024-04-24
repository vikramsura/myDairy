import 'package:milkdairy/all_import.dart';
import 'package:milkdairy/provider/dashBoardProvider/masterProvider/driverProvider.dart';

class EditDriverList extends StatefulWidget {
  EditDriverList({
    Key? key,
  }) : super(key: key);

  @override
  State<EditDriverList> createState() => _EditDriverListState();
}

class _EditDriverListState extends State<EditDriverList> {
  @override
  void initState() {
    Provider.of<DriverProvider>(context, listen: false).getInitDate();
    Provider.of<DriverProvider>(context, listen: false).GetStateList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DriverProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "1";
              provider.dataClear();
            },
            child: Main_Theme.mainTheme(
                color: AppColor.white,
                actionwiget: Row(
                  children: [
                    Visibility(
                      visible: provider.enabled == '1',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeValues("0");
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.enabled == '0',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeValues("1");
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                icononpress: () {
                  provider.enabled = "1";
                  provider.dataClear();
                  Navigator.pop(context);
                },
                width: MediaQuery.of(context).size.width,
                pageName: provider.enabled == "1"
                    ? itemText.driverProfile
                    : itemText.editDriverProfile,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.nameController,
                          labelText: itemText.name),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.emailController,
                          labelText: itemText.email),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.phoneController,
                          labelText: itemText.phone,
                          maxLength: 10,
                          keyboardType: TextInputType.phone),
                      Visibility(
                        visible: provider.enabled == "0",
                        child: buildTextFie(
                          context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.passwordController,
                          labelText: itemText.password,
                          obscureText: provider.isPasswordVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.isPasswordVisible =
                                  !provider.isPasswordVisible;
                              setState(() {});
                            },
                            icon: Icon((provider.isPasswordVisible)
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          keyboardType: TextInputType.number,
                          controllerData: provider.registrationCodeController,
                          labelText: itemText.regCode),
                      Visibility(
                          visible: provider.enabled == '1',
                          child: buildTextFie(context,
                              readOnly: true,
                              controllerData: provider.stateController,
                              labelText: itemText.state)),
                      Visibility(
                        visible: provider.enabled == "0",
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.w),
                          child: Container(
                            height: 65.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                    value: provider.myState,
                                    iconSize: 30,
                                    icon: (null),
                                    iconEnabledColor: Colors.black,
                                    iconDisabledColor: Colors.grey,
                                    dropdownColor: AppBodyColor.white,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    hint: Text(
                                        provider.stateController.text
                                                .trim()
                                                .isEmpty
                                            ? itemText.state
                                            : provider.stateController.text,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16,
                                        )),
                                    onChanged: (newValue) {
                                      setState(() {
                                        provider.myState = newValue!;
                                        provider.isState = newValue;
                                        provider.stateController.text =
                                            newValue;
                                        provider.GetTehsilList(newValue);
                                      });
                                    },
                                    items: provider.statesList.map((item) {
                                      return DropdownMenuItem(
                                        value: item['id'].toString(),
                                        child: Text(item['name']),
                                      );
                                    }).toList()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: provider.enabled == '1',
                          child: buildTextFie(context,
                              readOnly: true,
                              controllerData: provider.districtController,
                              labelText: itemText.district)),
                      Visibility(
                        visible: provider.enabled == "0",
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.w),
                          child: Container(
                            height: 65.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                    value: provider.mytehsil,
                                    iconSize: 30,
                                    icon: (null),
                                    iconEnabledColor: Colors.black,
                                    iconDisabledColor: Colors.grey,
                                    dropdownColor: AppBodyColor.white,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    hint: Text(
                                      provider.districtController.text
                                              .trim()
                                              .isEmpty
                                          ? itemText.district
                                          : provider.districtController.text,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onChanged: (newValue) {
                                      setState(() {
                                        provider.mytehsil = newValue!;
                                        provider.isTehsil = newValue;
                                        provider.districtController.text =
                                            newValue;
                                      });
                                    },
                                    items: provider.tehsilList.map((item) {
                                      return DropdownMenuItem(
                                        value: item['id'].toString(),
                                        child: Text(item['name']),
                                      );
                                    }).toList()),
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.cityController,
                          labelText: itemText.city),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.villageController,
                          labelText: itemText.village),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.addressController,
                          labelText: itemText.address),
                      buildTextFie(context,
                          keyboardType: TextInputType.number,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.experienceController,
                          labelText: itemText.experience),
                      Visibility(
                          visible: provider.enabled == '1',
                          child: buildTextFie(context,
                              readOnly: true,
                              controllerData: provider.licenseExpDateController,
                              labelText: itemText.licenseExpDate)),
                      Visibility(
                        visible: provider.enabled == "0",
                        child: buildTextFie(
                          context,
                          controllerData: provider.licenseExpDateController,
                          labelText: itemText.licenseExpDate,
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2050));
                            provider.dateController.text =
                                date.toString().substring(0, 10);
                          },
                        ),
                      ),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.licenseController,
                          labelText: itemText.licenseNo,
                          maxLength: 15),
                      buildTextFie(context,
                          readOnly: provider.enabled == '1',
                          controllerData: provider.addharController,
                          labelText: itemText.addharNumber,
                          maxLength: 12,
                          keyboardType: TextInputType.number),
                      SizedBox(
                        height: 20.h,
                      ),
                      provider.enabled == '0'
                          ? Container(
                              height: 65.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  border: Border.all(color: Colors.black54)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        provider.uploadImage();
                                      },
                                      child: buildText(
                                          itemText.uploadLicense,
                                          14.w,
                                          AppColor.black,
                                          FontWeight.w400),
                                    ),
                                    Container(
                                      width: 2.w,
                                      color: Colors.black54,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.uploadPhoto == null
                                            ? provider.licensePhoto == null
                                                ? null
                                                : showImageViewer(
                                                    context,
                                                    NetworkImage(provider
                                                        .licensePhoto
                                                        .toString()),
                                                    swipeDismissible: true,
                                                    doubleTapZoomable: true)
                                            : showImageViewer(
                                                context,
                                                FileImage(
                                                  provider.uploadPhoto!,
                                                ),
                                                swipeDismissible: true,
                                                doubleTapZoomable: true);
                                      },
                                      child: buildText("Show Image", 14.w,
                                          AppColor.black, FontWeight.w400),
                                    ),
                                  ]))
                          : InkWell(
                              onTap: () {
                                provider.uploadPhoto == null
                                    ? provider.licensePhoto == null
                                        ? null
                                        : showImageViewer(
                                            context,
                                            NetworkImage(provider.licensePhoto
                                                .toString()),
                                            swipeDismissible: true,
                                            doubleTapZoomable: true)
                                    : showImageViewer(
                                        context,
                                        FileImage(
                                          provider.uploadPhoto!,
                                        ),
                                        swipeDismissible: true,
                                        doubleTapZoomable: true);
                              },
                              child: Container(
                                height: 200.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.w),
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            provider.licensePhoto.toString()))),
                              ),
                            ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: InkWell(
                          onTap: () {
                            if (provider.nameController.text.trim().isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.name}",
                              );
                            } else if (provider.emailController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.email}",
                              );
                            } else if (provider.phoneController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.phone}",
                              );
                            } else if (provider.phoneController.text
                                    .trim()
                                    .length <
                                10) {
                              snackMessage(
                                context,
                                itemText.cPhone,
                              );
                            } else if (provider.registrationCodeController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.regCode}",
                              );
                            } else if (provider.stateController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.state}",
                              );
                            } else if (provider.districtController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.district}",
                              );
                            } else if (provider.cityController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.city}",
                              );
                            } else if (provider.villageController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.village}",
                              );
                            } else if (provider.addressController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.address}",
                              );
                            } else if (provider.experienceController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.experience}",
                              );
                            } else if (provider.licenseExpDateController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.licenseExpDate}",
                              );
                            } else if (provider.licenseController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.licenseNo}",
                              );
                            } else if (provider.licenseController.text
                                    .trim()
                                    .length <
                                15) {
                              snackMessage(
                                context,
                                itemText.lisNo,
                              );
                            } else if (provider.addharController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(
                                context,
                                "${itemText.pleaseEnter} ${itemText.addharNumber}",
                              );
                            } else if (provider.addharController.text
                                    .trim()
                                    .length <
                                12) {
                              snackMessage(
                                context,
                                itemText.addNo,
                              );
                            } else {
                              provider.editDriverList(context);
                            }
                          },
                          child: buildContainer(
                              50.h,
                              MediaQuery.of(context).size.width,
                              AppBodyColor.deepPurple,
                              "Submit",
                              AppColor.white,
                              loading: provider.isLoading),
                        ),
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
