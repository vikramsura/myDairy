import 'package:milkdairy/all_import.dart';

class EditMilkDeduction extends StatelessWidget {
  EditMilkDeduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MilkRateDeductionProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "0";
              provider.cleanData();
            },
            child: Main_Theme.mainTheme(
                color: AppColor.white,
                actionwiget: Row(
                  children: [
                    Visibility(
                      visible: provider.enabled == '0',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeValues("1");
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.enabled == '1',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeValues("0");
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                pageName: itemText.milkRateDeduction,
                icononpress: () {
                  provider.enabled = "0";
                  provider.cleanData();
                  Navigator.pop(context);
                },
                widget: SingleChildScrollView(
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return itemText.time;
                            }
                            RegExp timeRegex =
                                RegExp(r'^(\d{1,2})(:\d{2})?(:\d{2})?$');
                            if (!timeRegex.hasMatch(value)) {
                              return itemText.ftime;
                            }

                            List<String> parts = value.split(':');

                            int hours = int.tryParse(parts[0]) ?? 0;
                            if (hours < 0 || hours > 23) {
                              return itemText.htime;
                            }

                            int minutes = 0;
                            if (parts.length >= 2) {
                              minutes = int.tryParse(parts[1]) ?? 0;
                              if (minutes < 0 || minutes > 59) {
                                return itemText.mtime;
                              }
                            }

                            int seconds = 0;
                            if (parts.length >= 3) {
                              seconds = int.tryParse(parts[2]) ?? 0;
                              if (seconds < 0 || seconds > 59) {
                                return itemText.stime;
                              }
                            }
                            return null;
                          },
                          readOnly: provider.enabled == '0',
                          controller: provider.MorningFromTimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: itemText.fmtime,
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return itemText.time;
                            }
                            RegExp timeRegex =
                                RegExp(r'^(\d{1,2})(:\d{2})?(:\d{2})?$');
                            if (!timeRegex.hasMatch(value)) {
                              return itemText.ftime;
                            }

                            List<String> parts = value.split(':');

                            int hours = int.tryParse(parts[0]) ?? 0;
                            if (hours < 0 || hours > 23) {
                              return itemText.htime;
                            }

                            int minutes = 0;
                            if (parts.length >= 2) {
                              minutes = int.tryParse(parts[1]) ?? 0;
                              if (minutes < 0 || minutes > 59) {
                                return itemText.mtime;
                              }
                            }

                            int seconds = 0;
                            if (parts.length >= 3) {
                              seconds = int.tryParse(parts[2]) ?? 0;
                              if (seconds < 0 || seconds > 59) {
                                return itemText.stime;
                              }
                            }
                            return null;
                          },
                          readOnly: provider.enabled == '0',
                          controller: provider.MorningToTimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: itemText.tmtime,
                              hintText: '12.00.00',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Visibility(
                          visible: provider.enabled == '1',
                          child: SizedBox(
                            height: 60,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: itemText.penaltyType,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                  child: DropdownButtonHideUnderline(
                                      child:
                                          provider.getMorningPenalty(context)),
                                );
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: provider.enabled == '0',
                          child: TextField(
                            readOnly: provider.enabled == '0',
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.penaltyType,
                                hintText: provider.MorningpenaltyType,
                                hintStyle: hintStyle(),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextField(
                          readOnly: provider.enabled == '0',
                          controller: provider.PenaltyMorningValueController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: itemText.penaltyValue,
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return itemText.time;
                            }
                            RegExp timeRegex =
                                RegExp(r'^(\d{1,2})(:\d{2})?(:\d{2})?$');
                            if (!timeRegex.hasMatch(value)) {
                              return itemText.ftime;
                            }

                            List<String> parts = value.split(':');

                            int hours = int.tryParse(parts[0]) ?? 0;
                            if (hours < 0 || hours > 23) {
                              return itemText.htime;
                            }

                            int minutes = 0;
                            if (parts.length >= 2) {
                              minutes = int.tryParse(parts[1]) ?? 0;
                              if (minutes < 0 || minutes > 59) {
                                return itemText.mtime;
                              }
                            }

                            int seconds = 0;
                            if (parts.length >= 3) {
                              seconds = int.tryParse(parts[2]) ?? 0;
                              if (seconds < 0 || seconds > 59) {
                                return itemText.stime;
                              }
                            }
                            return null;
                          },
                          readOnly: provider.enabled == '0',
                          controller: provider.EveningFromTimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: itemText.eveningFromTime,
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return itemText.time;
                            }
                            RegExp timeRegex =
                                RegExp(r'^(\d{1,2})(:\d{2})?(:\d{2})?$');
                            if (!timeRegex.hasMatch(value)) {
                              return itemText.ftime;
                            }

                            List<String> parts = value.split(':');

                            int hours = int.tryParse(parts[0]) ?? 0;
                            if (hours < 0 || hours > 23) {
                              return itemText.htime;
                            }

                            int minutes = 0;
                            if (parts.length >= 2) {
                              minutes = int.tryParse(parts[1]) ?? 0;
                              if (minutes < 0 || minutes > 59) {
                                return itemText.mtime;
                              }
                            }

                            int seconds = 0;
                            if (parts.length >= 3) {
                              seconds = int.tryParse(parts[2]) ?? 0;
                              if (seconds < 0 || seconds > 59) {
                                return itemText.stime;
                              }
                            }
                            return null;
                          },
                          readOnly: provider.enabled == '0',
                          controller: provider.EveningToTimeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              labelText: itemText.eveningToTime,
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Visibility(
                          visible: provider.enabled == '1',
                          child: SizedBox(
                            height: 60,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: itemText.penaltyType,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                  child: DropdownButtonHideUnderline(
                                      child:
                                          provider.getEveningPenalty(context)),
                                );
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: provider.enabled == '0',
                          child: TextField(
                            readOnly: provider.enabled == '0',
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.penaltyType,
                                hintText: provider.EveningpenaltyType,
                                hintStyle: hintStyle(),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextField(
                          readOnly: provider.enabled == '0',
                          controller: provider.PenaltyEveningValueController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: itemText.penaltyValue,
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Visibility(
                          visible: provider.enabled == '1',
                          child: InkWell(
                            onTap: () {
                              if (provider.MorningFromTimeController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.fmtime}");
                              } else if (provider.MorningToTimeController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.tmtime}");
                              } else if (provider.MorningpenaltyType
                                          .toString() ==
                                      itemText.select ||
                                  provider.MorningpenaltyType.toString()
                                      .isEmpty ||
                                  provider.MorningpenaltyType == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.penaltyType}");
                              } else if (provider
                                  .PenaltyMorningValueController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.penaltyValue}");
                              } else if (provider.EveningFromTimeController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.eveningFromTime}");
                              } else if (provider.EveningToTimeController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.eveningToTime}");
                              } else if (provider.EveningpenaltyType?.trim() ==
                                  itemText.select) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.penaltyType}");
                              } else if (provider.EveningpenaltyType.toString()
                                      .isEmpty ||
                                  provider.EveningpenaltyType.toString() ==
                                      itemText.select ||
                                  provider.EveningpenaltyType == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.penaltyValue}");
                              } else if (provider.formKey.currentState!
                                  .validate()) {
                                provider.editMilkDeduction(context);
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
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
