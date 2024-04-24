import 'package:milkdairy/all_import.dart';

class EditHardware extends StatefulWidget {
  EditHardware({
    Key? key,
  }) : super(key: key);

  @override
  State<EditHardware> createState() => _EditHardwareState();
}

class _EditHardwareState extends State<EditHardware> {
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
                  provider.cleanData(context);
                  Navigator.pop(context);
                },
                width: MediaQuery.of(context).size.width,
                pageName: itemText.hardware,
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
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText:
                                  "${itemText.edit} ${itemText.hardware}",
                              hintText: provider.hardwareType,
                              hintStyle: hintStyle(),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: SizedBox(
                          height: 65.h,
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    labelText: itemText.hardware,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                child: DropdownButtonHideUnderline(
                                    child: provider.getHardware(context)),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
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
                        readOnly: provider.enabled == '1',
                        controller: provider.broudrate,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.baudRate,
                            border: const OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
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
                      TextField(
                        readOnly: provider.enabled == '1',
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
                      Visibility(
                        visible: provider.enabled == '1',
                        child: TextField(
                          readOnly: provider.enabled == '1',
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              // enabled: enabled,
                              labelText: itemText.parity,
                              hintText: provider.parityName,
                              hintStyle: hintStyle(),
                              border: const OutlineInputBorder()),
                        ),
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: SizedBox(
                          height: 65.h,
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: itemText.parity,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                child: DropdownButtonHideUnderline(
                                    child: provider.getParity(
                                  context,
                                )),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.noofstring,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: itemText.noofString,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '1',
                        child: TextField(
                          readOnly: provider.enabled == '1',
                          // controller: _continuousStr,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: itemText.continuousStr,
                              hintText: provider.continuousStr,
                              hintStyle: hintStyle(),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: SizedBox(
                          height: 65.h,
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: itemText.continuousStr,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                                child: DropdownButtonHideUnderline(
                                    child: provider.getContinuousstr(
                                  context,
                                )),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enabled == '1',
                        child: TextField(
                          readOnly: provider.enabled == '1',
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: itemText.flowControl,
                              hintText: provider.flowControl,
                              hintStyle: hintStyle(),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Visibility(
                        visible: provider.enabled == '0',
                        child: SizedBox(
                          height: 65.h,
                          child: FormField(
                            // initialValue: _hardwareType,
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
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
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.stringlength,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.stringLenght,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.startingchar,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.startingChar,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enabled == '1',
                        controller: provider.tarechart,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: itemText.tareChar,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                          visible: provider.enabled == '0',
                          child: InkWell(
                            onTap: () {
                              if (provider.hardwareType.toString() ==
                                      itemText.select ||
                                  provider.hardwareType.toString().isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.hardware}");
                              } else if (provider.hwname.text.trim().isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.name}");
                              } else if (provider.broudrate.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.baudRate}");
                              } else if (provider.databits.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.dataBits}");
                              } else if (provider.stopbits.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.stopBits}");
                              } else if (provider.parityName.toString() ==
                                      itemText.select ||
                                  provider.parityName.toString().isEmpty ||
                                  provider.parityName == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.parity}");
                              } else if (provider.noofstring.text
                                  .trim()
                                  .isEmpty) {
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
                              } else if (provider.tarechart.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.tareChar}");
                              } else {
                                provider.editHardwareDetail(context);
                              }
                            },
                            child: buildContainer(
                                50.h,
                                MediaQuery.of(context).size.width,
                                AppBodyColor.deepPurple,
                                itemText.submit,
                                AppColor.white,
                                loading: provider.isLoading),
                          )),
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
