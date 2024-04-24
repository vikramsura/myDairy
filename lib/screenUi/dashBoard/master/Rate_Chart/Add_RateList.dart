import 'package:milkdairy/all_import.dart';

class AddRateList extends StatefulWidget {
  AddRateList({
    Key? key,
  }) : super(key: key);

  @override
  State<AddRateList> createState() => _AddRateListState();
}

class _AddRateListState extends State<AddRateList> {
  @override
  void initState() {
    Provider.of<RateChartProvider>(context, listen: false).getInitDate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RateChartProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "1";
              provider.dataClear();
            },
            child: Main_Theme.mainTheme(
                color: AppColor.white,
                actionwiget: SizedBox(),
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.enabled = "`1";
                  provider.dataClear();
                  Navigator.pop(context);
                },
                pageName: itemText.milkRateChart,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      TextField(
                        readOnly: true,
                        controller: provider.dateController,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.date_range_rounded,
                          ),
                          labelText: itemText.date,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: itemText.shift,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: DropdownButtonHideUnderline(
                                  child: provider.getShift(context)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.registrationCodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.regCode,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.ratecodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.code,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.remarkController,
                        decoration: InputDecoration(
                            labelText: itemText.remark,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.faterateCowController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.fateRate + " " + itemText.cow,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.faterateBuffaloController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                itemText.fateRate + " " + itemText.buffalo,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.faterateMixController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.fateRate + " " + itemText.mix,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.faterateOtherController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.fateRate + " " + itemText.other,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.clrCowController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.clr + " " + itemText.cow,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.clrBuffaloController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.clr + " " + itemText.buffalo,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.clrOtherController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.clr + " " + itemText.other,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.clrRateMixController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.clr + " " + itemText.mix,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.snfCowController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.snf + " " + itemText.cow,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.snfBuffaloController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.snf + " " + itemText.buffalo,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.snfRateMixController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.snf + " " + itemText.mix,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.snfOtherController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.snf + " " + itemText.other,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.dateController.text.trim().isEmpty) {
                            snackMessage(
                              context,
                              "${itemText.pleaseEnter} ${itemText.date}",
                            );
                          } else if (provider.shift.toString() ==
                                  itemText.select ||
                              provider.shift.toString().isEmpty ||
                              provider.shift == null) {
                            snackMessage(
                              context,
                              "${itemText.pleaseEnter} ${itemText.shift}",
                            );
                          } else if (provider.registrationCodeController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(
                              context,
                              "${itemText.pleaseEnter} ${itemText.regCode}",
                            );
                          } else if (provider.ratecodeController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(
                              context,
                              "${itemText.pleaseEnter} ${itemText.code}",
                            );
                          } else if (provider.remarkController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(
                              context,
                              "${itemText.pleaseEnter} ${itemText.remark}",
                            );
                          } else if (provider.faterateCowController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.fateRate} ${itemText.cow}");
                          } else if (provider.faterateBuffaloController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.fateRate} ${itemText.buffalo}");
                          } else if (provider.faterateMixController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.fateRate} ${itemText.mix}");
                          } else if (provider.faterateOtherController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.fateRate} ${itemText.other}");
                          } else if (provider.clrCowController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.clr} ${itemText.cow}");
                          } else if (provider.clrBuffaloController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.clr} ${itemText.buffalo}");
                          } else if (provider.clrOtherController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.clr} ${itemText.other}");
                          } else if (provider.clrRateMixController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.clr} ${itemText.mix}");
                          } else if (provider.snfCowController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.snf} ${itemText.cow}");
                          } else if (provider.snfBuffaloController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.snf} ${itemText.buffalo}");
                          } else if (provider.snfRateMixController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.snf} ${itemText.mix}");
                          } else if (provider.snfOtherController.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.snf} ${itemText.other}");
                          } else {
                            provider.addRateChart(context);
                          }
                        },
                        child: buildContainer(
                          loading: provider.isLoading,
                          50.h,
                          MediaQuery.of(context).size.width,
                          AppBodyColor.deepPurple,
                          itemText.submit,
                          AppColor.white,
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
