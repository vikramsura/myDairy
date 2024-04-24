import 'package:milkdairy/all_import.dart';

class AddHardware extends StatelessWidget {
  AddHardware({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HardwareProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "1";
              provider.cleanData(context);
            },
            child: Main_Theme.mainTheme(
                color: AppBodyColor.white,
                actionwiget: const SizedBox(),
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.enabled = "1";
                  provider.cleanData(context);
                  Navigator.pop(context);
                },
                pageName: itemText.hardware,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText:
                                      "${itemText.add} ${itemText.hardware}",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: DropdownButtonHideUnderline(
                                  child: provider.getHardware(context)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        controller: provider.hwname,
                        decoration: InputDecoration(
                            labelText: itemText.name,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.broudrate,
                        decoration: InputDecoration(
                            labelText: itemText.baudRate,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        controller: provider.databits,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[1-8]')),
                        ],
                        decoration: InputDecoration(
                            counterText: " ",
                            labelText: itemText.dataBits,
                            border: OutlineInputBorder()),
                      ),
                      // SizedBox(height: 20.h,),
                      TextField(
                        controller: provider.stopbits,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[1-2]')),
                        ],
                        decoration: InputDecoration(
                            counterText: " ",
                            labelText: itemText.stopBits,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 65.h,
                        child: FormField(
                          builder: (FormFieldState<dynamic> field) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: itemText.parity,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: DropdownButtonHideUnderline(
                                  child: provider.getParity(context)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.noofstring,
                        decoration: InputDecoration(
                            labelText: itemText.noofString,
                            border: OutlineInputBorder()),
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
                                  labelText: itemText.continuousStr,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: DropdownButtonHideUnderline(
                                  child: provider.getContinuousstr(context)),
                            );
                          },
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
                                  labelText: itemText.flowControl,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              child: DropdownButtonHideUnderline(
                                  child: provider.getFlowControl(context)),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.stringlength,
                        decoration: InputDecoration(
                            labelText: itemText.stringLenght,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.startingchar,
                        decoration: InputDecoration(
                            labelText: itemText.startingChar,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.tarechart,
                        decoration: InputDecoration(
                            labelText: itemText.tareChar,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.hardwareType.toString() ==
                                  itemText.select ||
                              provider.hardwareType.toString().isEmpty ||
                              provider.hardwareType == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.hardware}");
                          } else if (provider.hwname.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.name}");
                          } else if (provider.broudrate.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.baudRate}");
                          } else if (provider.databits.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.dataBits}");
                          } else if (provider.stopbits.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.stopBits}");
                          } else if (provider.parityName.toString() ==
                                  itemText.select ||
                              provider.parityName.toString().isEmpty ||
                              provider.parityName == null) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.parity}");
                          } else if (provider.noofstring.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.noofString}");
                          } else if (provider.stringlength.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.stringLenght}");
                          } else if (provider.startingchar.text
                              .trim()
                              .isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.startingChar}");
                          } else if (provider.tarechart.text.trim().isEmpty) {
                            snackMessage(context,
                                "${itemText.pleaseEnter} ${itemText.tareChar}");
                          } else {
                            provider.AddHardware(context);
                          }
                        },
                        child: buildContainer(
                            50.h,
                            MediaQuery.of(context).size.width,
                            AppBodyColor.deepPurple,
                            itemText.submit,
                            AppColor.white,
                            loading: provider.isLoading),
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
