import 'package:milkdairy/all_import.dart';

class PrinterSettings extends StatelessWidget {
  const PrinterSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Consumer<printerProvider>(builder: (context, provider, child) {
      return PopScope(
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
              pageName: itemText.printerSetting,
              widget: SingleChildScrollView(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Container(
                        height: 40.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.milkSlipPrinterType,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetPrinters(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.noOfBlankLines,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetLines(),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.printMilkSlipLang,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.Getlanguage(),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.paymentDays,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 60.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: provider.paymentController,
                                  decoration: InputDecoration(
                                    hintText: "0",
                                    constraints: BoxConstraints(
                                        maxWidth: double.infinity),
                                    contentPadding: EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.paymentTotalPrintOnSlip,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetprintSlip(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.allowDeductiononMilkBill,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetmilkBill(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.allowDeductiononPaymentRegister,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.Getregister(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.printMilkSlip,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetmilkSlip(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.printPerliterRateonSlip,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child:
                                              provider.GetrateOnSlip(context),
                                        ));
                                  },
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.printFATKgRate,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child: provider.GetFatKg(context),
                                        ));
                                  },
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
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              itemText.printUsernameDateTime,
                              style: TextStyle(fontSize: 14),
                            )),
                            Expanded(
                              child: Container(
                                height: 40.w,
                                width: 180.w,
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
                                          child:
                                              provider.GetusernameDate(context),
                                        ));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {
                          if (provider.printer.toString() == itemText.select ||
                              provider.printer.toString().isEmpty ||
                              provider.printer == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.milkSlipPrinterType}");
                          } else if (provider.paymentController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.paymentDays}");
                          } else if (provider.paymentSlip.toString() ==
                                  itemText.select ||
                              provider.paymentSlip.toString().isEmpty ||
                              provider.paymentSlip == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.paymentTotalPrintOnSlip}");
                          } else if (provider.milkBill.toString() ==
                                  itemText.select ||
                              provider.milkBill.toString().isEmpty ||
                              provider.milkBill == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.allowDeductiononMilkBill}");
                          } else if (provider.register.toString() ==
                                  itemText.select ||
                              provider.register.toString().isEmpty ||
                              provider.register == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.allowDeductiononPaymentRegister}");
                          } else if (provider.milkSlip.toString() ==
                                  itemText.select ||
                              provider.milkSlip.toString().isEmpty ||
                              provider.milkSlip == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.printMilkSlip}");
                          } else if (provider.rateSlip.toString() ==
                                  itemText.select ||
                              provider.rateSlip.toString().isEmpty ||
                              provider.rateSlip == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.printPerliterRateonSlip}");
                          } else if (provider.FatKg.toString() ==
                                  itemText.select ||
                              provider.FatKg.toString().isEmpty ||
                              provider.FatKg == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.printFATKgRate}");
                          } else if (provider.usernameDate.toString() ==
                                  itemText.select ||
                              provider.usernameDate.toString().isEmpty ||
                              provider.usernameDate == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.printUsernameDateTime}");
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
                                                                      "Assets/new/checked.png",
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
                                                },
                                                child: InkWell(
                                                  onTap: () async {
                                                    var response = await provider
                                                        .addPrinterSettings();
                                                    if (response['success'] ==
                                                        true) {
                                                      snackMessage(context,
                                                          '${response['message']}',
                                                          no: 2);
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
                                                                        .circular(4
                                                                            .w),
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
                                                                            28.w,
                                                                      ),
                                                                      ImageIcon(
                                                                        AssetImage(
                                                                          "Assets/new/yes.png",
                                                                        ),
                                                                        size:
                                                                            40,
                                                                        color: Color(
                                                                            0xff00b42c),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
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
              )));
    });
  }
}
