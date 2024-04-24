import 'package:milkdairy/all_import.dart';

class HardwareSettings extends StatelessWidget {
  const HardwareSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;

    return Consumer<HardwareSettingsProvider>(
        builder: (context, provider, child) => PopScope(
            onPopInvoked: (didPop) {
              provider.DataClean();
            },
            child: Main_Theme.mainTheme(
              actionwiget: SizedBox(),
              color: AppBodyColor.backGro,
              width: MediaQuery.of(context).size.width,
              icononpress: () {
                provider.DataClean();
                Navigator.pop(context);
              },
              pageName: itemText.hardwareSettings,
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppBodyColor.deepPurple,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: SizedBox(
                              child: Text(
                                itemText.type,
                                style: TextStyle(
                                    fontSize: 16, color: AppBodyColor.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              itemText.machineOnt,
                              style: TextStyle(
                                  fontSize: 16, color: AppBodyColor.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: Text(
                                itemText.tareYesNo,
                                style: TextStyle(
                                    fontSize: 16, color: AppBodyColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 95.w,
                              child: Text(itemText.weightScale),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions1(context),
                                      ));
                                },
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions2(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 95.w,
                              child: Text(itemText.fatMachine),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions3(context),
                                      ));
                                },
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions4(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 95.w,
                              child: Text(itemText.milkAnalyzer),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions5(context),
                                      ));
                                },
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions6(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 95.w,
                              child: Text(itemText.bigDisplay),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions7(context),
                                      ));
                                },
                              ),
                            ),
                            Container(
                              height: 40.w,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                // initialValue: _hardwareType,
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getOptions8(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppBodyColor.white,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.w),
                                    borderSide: BorderSide.none),
                                actions: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 28.w,
                                      ),
                                      Image(
                                          image: AssetImage(
                                              "Assets/new/manualMilkColl.png")),
                                      SizedBox(
                                        height: 28.w,
                                      ),
                                      buildText(itemText.save, 18.w,
                                          AppColor.black, FontWeight.w500),
                                      SizedBox(
                                        height: 28.w,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        AppBodyColor.white,
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.w),
                                                        borderSide:
                                                            BorderSide.none),
                                                    actions: [
                                                      Container(
                                                        // height: 157,
                                                        child: Center(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: 28.h,
                                                              ),
                                                              ImageIcon(
                                                                AssetImage(
                                                                  "Assets/new/yes.png",
                                                                ),
                                                                size: 40,
                                                                color: Color(
                                                                    0xff00b42c),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              buildText(
                                                                  itemText
                                                                      .datasavedsuccessfuly,
                                                                  18.h,
                                                                  AppColor
                                                                      .black,
                                                                  FontWeight
                                                                      .w500),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: buildContainer(
                                                40.w,
                                                100.w,
                                                AppBodyColor.blue,
                                                itemText.oK,
                                                AppColor.white),
                                          ),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: buildContainer(
                                                40.w,
                                                100.w,
                                                AppBodyColor.blue,
                                                itemText.cANCEL,
                                                AppColor.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              );
                            });
                      },
                      child: buildContainer(
                          50.h,
                          MediaQuery.of(context).size.width,
                          AppBodyColor.deepPurple,
                          itemText.submit,
                          AppColor.white),
                    ),
                    SizedBox(
                      height: 30.h,
                    )
                  ],
                ),
              ),
            )));
  }
}
