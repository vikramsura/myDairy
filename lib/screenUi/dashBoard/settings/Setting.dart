import 'package:milkdairy/all_import.dart';
import 'package:milkdairy/screenUi/dashBoard/settings/choosePlan.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SittingProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;
      return SafeArea(
          child: provider.isLoading
              ? Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                      child: CircularProgressIndicator(
                    color: AppColor.deepPurple,
                  )),
                )
              : Scaffold(
                  backgroundColor: AppColor.deepPurple,
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.blueGrey,
                                  borderRadius: BorderRadius.circular(4)),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back, size: 30.h)),
                            ),
                            SizedBox(
                              height: 28.w,
                            ),
                            buildText(itemText.settings, 24.w, AppColor.white,
                                FontWeight.w500),
                            SizedBox(
                              height: 35.w,
                            ),
                            buildText(itemText.account, 18.w, AppColor.white,
                                FontWeight.w500),
                            SizedBox(
                              height: 18.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Provider.of<ProfProviderPage>(context,
                                                  listen: false)
                                              .imageFiles ==
                                          null
                                      ? InkWell(
                                          onTap: () {
                                            showImageViewer(
                                                context,
                                                const AssetImage(
                                                    "Assets/new/sipro.png"),
                                                swipeDismissible: true,
                                                doubleTapZoomable: true);
                                          },
                                          child: CircleAvatar(
                                            backgroundImage: const AssetImage(
                                                "Assets/new/sipro.png"),
                                            radius: 40.w,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showImageViewer(
                                                context,
                                                NetworkImage(Provider.of<
                                                            ProfProviderPage>(
                                                        context,
                                                        listen: false)
                                                    .imageFiles
                                                    .toString()),
                                                swipeDismissible: true,
                                                doubleTapZoomable: true);
                                          },
                                          child: CircleAvatar(
                                            radius: 40.w,
                                            backgroundImage: NetworkImage(
                                                Provider.of<ProfProviderPage>(
                                                        context,
                                                        listen: false)
                                                    .imageFiles
                                                    .toString()),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildText(
                                          UserDetails.userName.toString(),
                                          18.w,
                                          AppColor.white,
                                          FontWeight.w400),
                                      buildText(
                                          UserDetails.userDairyName.toString(),
                                          16.w,
                                          AppColor.white,
                                          FontWeight.w400),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.navigate_next_outlined,
                                    color: AppBodyColor.white,
                                    size: 40.w,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 14.w,
                            ),
                            const Divider(thickness: 2),
                            SizedBox(
                              height: 35.w,
                            ),
                            buildText(itemText.settings, 18.w, AppColor.white,
                                FontWeight.w400),
                            SizedBox(
                              height: 35.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LanguageSettings(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/language.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.languagesettings, 20.w,
                                      AppColor.white, FontWeight.w400),
                                  const Spacer(),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppBodyColor.white,
                                    size: 40.w,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PrinterSettings(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/printer.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.printerSetting, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RateParameters(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/rate_para.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.rateParameters, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RateCalculationSettings(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/rateParProfile.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.rateCalculation, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SecuritySettings(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/security.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.securitySettings, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HardwareSettings(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/hardware.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.hardwareSettings, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChoosePlanPage(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/new/choosePlan.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.choosePlan, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PasswordNew(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      const AssetImage(
                                          "Assets/dashBord/report.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.changePassword, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(itemText.doYouWantToLogout),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(itemText.no)),
                                        TextButton(
                                            onPressed: () async {
                                              var response =
                                                  await provider.UsersLogout();
                                              if (response['success'] == true) {
                                                clearUserDetails();
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPage()),
                                                    (route) => false);
                                                snackMessage(context,
                                                    response["message"],
                                                    no: 2);
                                              } else if (response['success'] ==
                                                  false) {
                                                //Navigator.pop(context);
                                                snackMessage(context,
                                                    response["message"]);
                                              }
                                            },
                                            child: Text(itemText.yes)),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28.w,
                                    child: ImageIcon(
                                      AssetImage("Assets/new/log-out.png"),
                                      color: AppBodyColor.black,
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18.w,
                                  ),
                                  buildText(itemText.logOut, 20.w,
                                      AppColor.white, FontWeight.w400),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ]),
                    ),
                  )));
    });
  }
}
