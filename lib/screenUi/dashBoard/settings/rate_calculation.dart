import 'package:milkdairy/all_import.dart';

class RateCalculationSettings extends StatelessWidget {
  const RateCalculationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;

    return Consumer<RateCalculateProvider>(
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
              pageName: itemText.rateCalculation,
              widget: SingleChildScrollView(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        height: 50.h,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: SizedBox(
                                child: Text(
                                  itemText.value,
                                  style: TextStyle(
                                      fontSize: 16, color: AppBodyColor.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.collectionType),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getCollType(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.milkRateType),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getMilkRate(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.calcSNFFromFormula),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getSNF(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.sameFarmerinShift),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getShift(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.milkTypeIdentification),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider
                                            .getTypeIdentification(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.baseFatValue),
                            ),
                            Container(
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: provider.fatValueController,
                                decoration: InputDecoration(
                                    hintText: "5.0",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 12, left: 20, right: 10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.rateCalculationMethod),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
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
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getCalMrthod(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.rateCalculationType),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      baseStyle: TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            bottom: 10,
                                            top: 10,
                                            left: 10,
                                          ),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getCalType(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child:
                                  Text(itemText.multipleRateforMultipleFarmers),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getMultiRate(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.considerMaxRate),
                            ),
                            Container(
                              height: 40.w,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField(
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                        child: provider.getMaxRate(context),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: Text(itemText.dedLimitonMilkAmount),
                            ),
                            Container(
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: AppBodyColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: provider.dedLimitController,
                                decoration: InputDecoration(
                                    hintText: "50",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: 12, left: 20, right: 10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.fatValueController.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.baseFatValue}");
                          } else if (provider.dedLimitController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.dedLimitonMilkAmount}");
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppBodyColor.white,
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.w),
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
                                                onTap: () async {
                                                  var response = await provider
                                                      .addRateCalculations();
                                                  if (response['success'] ==
                                                      true) {
                                                    Navigator.pop(context);
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          backgroundColor:
                                                              AppBodyColor
                                                                  .white,
                                                          shape: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.w),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
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
                                                                      height:
                                                                          28.h,
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
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    buildText(
                                                                        itemText
                                                                            .datasavedsuccessfuly,
                                                                        18.w,
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
                                                    snackMessage(context,
                                                        '${response['message']}',
                                                        no: 2);
                                                  } else if (response[
                                                          'success'] ==
                                                      false) {
                                                    snackMessage(context,
                                                        '${response['message']}');
                                                  }
                                                },
                                                child: buildContainer(
                                                    40.w,
                                                    100.w,
                                                    AppBodyColor.blue,
                                                    itemText.oK,
                                                    AppColor.white),
                                              ),
                                              SizedBox(
                                                width: 10.w,
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
                          }
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
              ),
            )));
  }
}
