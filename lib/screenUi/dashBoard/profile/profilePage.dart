import 'package:milkdairy/all_import.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfProviderPage>(context, listen: false).GetProfileData();
    Provider.of<ProfProviderPage>(context, listen: false).GetStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfProviderPage>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (value) {
              provider.dataClear();
            },
            child: Stack(
              children: [
                SafeArea(
                    child: Scaffold(
                  backgroundColor: AppColor.deepPurple,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                      color: AppBodyColor.blueGrey,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: InkWell(
                                      onTap: () {
                                        provider.dataClear();
                                        Navigator.pop(context);
                                      },
                                      child:
                                          Icon(Icons.arrow_back, size: 30.h)),
                                ),
                              ),
                              buildText(itemText.profile, 30.h, AppColor.white,
                                  FontWeight.w500),
                              provider.isEditData
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          provider.isEditData = false;
                                        });
                                      },
                                      child: const Image(
                                          image: AssetImage(
                                              "Assets/new/editImage.png")))
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          provider.isEditData = true;
                                        });
                                      },
                                      child: Icon(Icons.close_outlined,
                                          color: AppBodyColor.white))
                            ],
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Stack(children: [
                            provider.imageFiles == null
                                ? InkWell(
                                    onTap: () {
                                      showImageViewer(context,
                                          AssetImage("Assets/new/sipro.png"),
                                          swipeDismissible: true,
                                          doubleTapZoomable: true);
                                    },
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("Assets/new/sipro.png"),
                                      radius: 40.w,
                                    ),
                                  )
                                : provider.sendNewFile == null
                                    ? InkWell(
                                        onTap: () {
                                          showImageViewer(
                                              context,
                                              NetworkImage(provider.imageFiles
                                                  .toString()),
                                              swipeDismissible: true,
                                              doubleTapZoomable: true);
                                        },
                                        child: CircleAvatar(
                                          radius: 40.w,
                                          backgroundImage: NetworkImage(
                                              provider.imageFiles.toString()),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          showImageViewer(context,
                                              FileImage(provider.sendNewFile!),
                                              swipeDismissible: true,
                                              doubleTapZoomable: true);
                                        },
                                        child: CircleAvatar(
                                            radius: 40.w,
                                            backgroundImage: FileImage(
                                                provider.sendNewFile!,
                                                scale: 0.2)),
                                      ),
                            provider.isEditData
                                ? SizedBox()
                                : Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: InkWell(
                                      onTap: () {
                                        provider.uploadImage();
                                      },
                                      child: Icon(Icons.camera_alt,
                                          color: AppColor.white),
                                    ),
                                  )
                          ]),
                          SizedBox(
                            height: 24.w,
                          ),
                          buildTextFieldProfile(
                              provider.phoneController, itemText.phone, true),
                          SizedBox(
                            height: 18.w,
                          ),
                          buildTextFieldProfile(provider.nameController,
                              itemText.name, provider.isEditData),
                          SizedBox(
                            height: 18.w,
                          ),
                          buildTextFieldProfile(provider.dairyNameController,
                              itemText.dairyName, provider.isEditData),
                          SizedBox(
                            height: 18.w,
                          ),
                          buildTextFieldProfile(
                              provider.diaryShortNameController,
                              itemText.dairyShortName,
                              provider.isEditData),
                          SizedBox(
                            height: 18.w,
                          ),
                          Visibility(
                            visible: provider.isEditData == true,
                            child: buildTextFieldProfile(
                                provider.stateController,
                                itemText.state,
                                provider.isEditData),
                          ),
                          Visibility(
                            visible: provider.isEditData == false,
                            child: Container(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppBodyColor.white),
                                  borderRadius: BorderRadius.circular(8)),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                      value: provider.myState,
                                      iconSize: 30,
                                      icon: (null),
                                      iconEnabledColor: Colors.white,
                                      iconDisabledColor: Colors.white38,
                                      dropdownColor: AppBodyColor.deepPurple,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      hint: Text(
                                          provider.stateController.text
                                                  .trim()
                                                  .isEmpty
                                              ? itemText.state
                                              : provider.stateController.text,
                                          style: TextStyle(
                                            color: Colors.white,
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
                          SizedBox(
                            height: 18.w,
                          ),
                          Visibility(
                            visible: provider.isEditData == true,
                            child: buildTextFieldProfile(
                                provider.tehsilController,
                                itemText.district,
                                provider.isEditData),
                          ),
                          Visibility(
                            visible: provider.isEditData == false,
                            child: Container(
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppBodyColor.white),
                                  borderRadius: BorderRadius.circular(8)),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                      value: provider.mytehsil,
                                      iconSize: 30,
                                      icon: (null),
                                      iconEnabledColor: Colors.white,
                                      iconDisabledColor: Colors.white38,
                                      dropdownColor: AppBodyColor.deepPurple,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      hint: Text(
                                        provider.tehsilController.text
                                                .trim()
                                                .isEmpty
                                            ? itemText.district
                                            : provider.tehsilController.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onChanged: (newValue) {
                                        setState(() {
                                          provider.mytehsil = newValue!;
                                          provider.isTehsil = newValue;
                                          provider.tehsilController.text =
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
                          SizedBox(
                            height: 18.w,
                          ),
                          buildTextFieldProfile(provider.cityController,
                              itemText.city, provider.isEditData),
                          SizedBox(
                            height: 18.w,
                          ),
                          buildTextFieldProfile(provider.villageController,
                              itemText.village, provider.isEditData),
                          SizedBox(
                            height: 18.w,
                          ),
                          TextFormField(
                            readOnly: provider.isEditData,
                            style: TextStyle(color: AppColor.white),
                            controller: provider.pinCodeController,
                            maxLines: 1,
                            maxLength: 6,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                counterText: " ",
                                isDense: true,
                                contentPadding: EdgeInsets.all(14),
                                labelStyle: TextStyle(color: AppColor.white),
                                labelText: itemText.pinCode,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppBodyColor.white),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppBodyColor.white),
                                    borderRadius: BorderRadius.circular(8)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppBodyColor.white),
                                    borderRadius: BorderRadius.circular(8)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppBodyColor.white),
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          provider.isEditData
                              ? SizedBox()
                              : InkWell(
                                  onTap: () async {
                                    if (provider.imageFiles
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        provider.imageFiles == null) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.photo}");
                                    } else if (provider.nameController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.name}");
                                    } else if (provider.dairyNameController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.dairyName}");
                                    } else if (provider
                                        .diaryShortNameController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.dairyShortName}");
                                    } else if (provider.stateController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.state}");
                                    } else if (provider.tehsilController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.district}");
                                    } else if (provider.cityController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.city}");
                                    } else if (provider.villageController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.village}");
                                    } else if (provider.pinCodeController.text
                                        .trim()
                                        .isEmpty) {
                                      snackMessage(context,
                                          "${itemText.pleaseEnter} ${itemText.pinCode}");
                                    } else if (provider.pinCodeController.text
                                            .trim()
                                            .length <
                                        6) {
                                      snackMessage(
                                          context, itemText.digitpincode);
                                    } else {
                                      var response =
                                          await provider.UpdateProfile();
                                      if (response["success"] == true) {
                                        provider.isEditData = true;
                                        provider.dataClear();
                                        provider.GetProfileData();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DashBoard(),
                                            ),
                                            (route) => false);
                                        snackMessage(
                                            context, response["message"],
                                            no: 2);
                                      } else if (response["success"] == false) {
                                        snackMessage(
                                            context, response["message"]);
                                      }
                                    }
                                  },
                                  child: buildContainer(
                                      50.h,
                                      MediaQuery.of(context).size.width,
                                      AppBodyColor.blue,
                                      itemText.submit,
                                      AppColor.white),
                                ),
                          SizedBox(
                            height: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                Visibility(
                    visible: provider.isLoading,
                    child: Scaffold(
                      backgroundColor: Colors.black26,
                      body: Center(
                          child: CircularProgressIndicator(
                        color: AppColor.white,
                      )),
                    ))
              ],
            ));
      },
    );
  }
}
