import 'package:milkdairy/all_import.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;

    return Consumer<SecProvider>(
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
                pageName: itemText.securitySettings,
                widget: Consumer<SecProvider>(
                  builder: (context, provider, child) => SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
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
                                        fontSize: 16,
                                        color: AppBodyColor.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: SizedBox(
                                  child: Text(
                                    itemText.value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppBodyColor.white),
                                  ),
                                ),
                              ),
                            ],
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
                                  width: 120.w,
                                  child: Text(itemText.allowEditInMilkEntry),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getmilkEntry(context),
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
                                  width: 120.w,
                                  child: Text(itemText.milkParamsAllowedManual),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getallowedManual(context),
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
                                  width: 120.w,
                                  child: Text(itemText.allowQtyManual),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getQntManual(context),
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
                                  width: 120.w,
                                  child: Text(itemText.allowFarmerCodeManual),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getFarCodeManual(context),
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
                                  width: 120.w,
                                  child: Text(itemText.allowManualMilkEntry),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getManualMilkEntry(context),
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
                                  width: 120.w,
                                  child: Text(itemText.allowDeduction),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getDeduction(context),
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
                                  width: 120.w,
                                  child:
                                      Text(itemText.allowdeductiononmilkamount),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getmilkAmount(context),
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
                                  width: 120.w,
                                  child: Text(itemText.allowPaymentcycle),
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
                                          baseStyle: TextStyle(fontSize: 14),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 10,
                                                  top: 10,
                                                  left: 20,
                                                  right: 10),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getPaymentCycle(context),
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
                                  width: 120.w,
                                  child: Text(itemText.logoutTime),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getLogoutTime(context),
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
                                  width: 120.w,
                                  child: Text(itemText.milkslipSMS),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getmilkSlipSMS(context),
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
                                  width: 120.w,
                                  child: Text(itemText.localSaleSMS),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: provider
                                                .getLocalSaleSMS(context),
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
                                  width: 120.w,
                                  child: Text(itemText.paymentSMS),
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
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child:
                                                provider.getPaymentSMS(context),
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
                            if (provider.entry.toString() == itemText.select ||
                                provider.entry.toString().isEmpty ||
                                provider.entry == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowEditInMilkEntry}");
                            } else if (provider.allowedManual.toString() ==
                                    itemText.select ||
                                provider.allowedManual.toString().isEmpty ||
                                provider.allowedManual == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.milkParamsAllowedManual}");
                            } else if (provider.qntManual.toString() == itemText.select ||
                                provider.qntManual.toString().isEmpty ||
                                provider.qntManual == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowQtyManual}");
                            } else if (provider.farCodeManual.toString() ==
                                    itemText.select ||
                                provider.farCodeManual.toString().isEmpty ||
                                provider.farCodeManual == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowFarmerCodeManual}");
                            } else if (provider.manualMilkEntry.toString() ==
                                    itemText.select ||
                                provider.manualMilkEntry.toString().isEmpty ||
                                provider.manualMilkEntry == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowManualMilkEntry}");
                            } else if (provider.deduction.toString() == itemText.select ||
                                provider.deduction.toString().isEmpty ||
                                provider.deduction == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowDeduction}");
                            } else if (provider.milkAmount.toString() == itemText.select ||
                                provider.milkAmount.toString().isEmpty ||
                                provider.milkAmount == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowdeductiononmilkamount}");
                            } else if (provider.paymentCycle.toString() ==
                                    itemText.select ||
                                provider.paymentCycle.toString().isEmpty ||
                                provider.paymentCycle == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.allowPaymentcycle}");
                            } else if (provider.time.toString() == itemText.select ||
                                provider.time.toString().isEmpty ||
                                provider.time == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.logoutTime}");
                            } else if (provider.milkSlipSMS.toString() ==
                                    itemText.select ||
                                provider.milkSlipSMS.toString().isEmpty ||
                                provider.milkSlipSMS == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.milkslipSMS}");
                            } else if (provider.saleSMS.toString() == itemText.select ||
                                provider.saleSMS.toString().isEmpty ||
                                provider.saleSMS == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.localSaleSMS}");
                            } else if (provider.paymentSMS.toString() ==
                                    itemText.select ||
                                provider.paymentSMS.toString().isEmpty ||
                                provider.paymentSMS == null) {
                              snackMessage(context,
                                  "${itemText.pleaseEnter} ${itemText.paymentSMS}");
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
                                            buildText(
                                                itemText.save,
                                                18.w,
                                                AppColor.black,
                                                FontWeight.w500),
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
                                                        .addSecuritySettings();
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
                ))));
  }
}
