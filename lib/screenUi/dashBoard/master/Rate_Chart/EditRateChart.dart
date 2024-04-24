import 'package:milkdairy/all_import.dart';

class EditRateChart extends StatelessWidget {
  EditRateChart({
    Key? key,
  }) : super(key: key);

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
                actionwiget: Row(
                  children: [
                    Visibility(
                      visible: provider.enabled == '1',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeValues("0");
                        },
                        child: Icon(
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
                        child: Icon(
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
                pageName: itemText.milkRateChart,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '1',
                        child: TextField(
                          readOnly: provider.enabled == '1',
                          controller: provider.dateController,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: itemText.date,
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            provider.dateController.text =
                                date.toString().substring(0, 10);
                          },
                          controller: provider.dateController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: const Icon(
                              Icons.date_range_rounded,
                            ),
                            labelText: itemText.date,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: SizedBox(
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
                      ),
                      Visibility(
                        visible: provider.enabled == '1',
                        child: TextField(
                          readOnly: provider.enabled == '1',
                          controller: provider.effeShiftController,
                          decoration: InputDecoration(
                              labelText: itemText.shift,
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.ratecodeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.regCode,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.remarkController,
                        decoration: InputDecoration(
                            labelText: itemText.remark,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.faterateCowController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: itemText.fateRate + " " + itemText.cow,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
                        controller: provider.snfOtherController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.snf + " " + itemText.other,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: InkWell(
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
                              provider.editRatechartList(context);
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
