import 'package:milkdairy/all_import.dart';

class EditFarmer extends StatelessWidget {
  const EditFarmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmerProvier>(
      builder: (context, provider, child) {
        return PopScope(
            onPopInvoked: (didPop) {
              provider.changeBack();
            },
            child: Main_Theme.mainTheme(
                actionwiget: Row(
                  children: [
                    Visibility(
                      visible: provider.enable == '1',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeTap("0");
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.enable == '0',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeTap("1");
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                pageName: AppLocalizations.of(context)!.edit +
                    ' ' +
                    AppLocalizations.of(context)!.farmer,
                icononpress: () {
                  provider.changeBack();
                  Navigator.pop(context);
                },
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.nameController,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.farmer +
                                " " +
                                AppLocalizations.of(context)!.name,
                            hintText: AppLocalizations.of(context)!.farmer +
                                " " +
                                AppLocalizations.of(context)!.name,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.AddressController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.address,
                            hintText: AppLocalizations.of(context)!.address,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                        visible: provider.enable == '0',
                        child: TextField(
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            if (date != null) {
                              // Calculate the age
                              DateTime currentDate = DateTime.now();
                              int age = currentDate.year - date.year;
                              if (currentDate.month < date.month ||
                                  (currentDate.month == date.month &&
                                      currentDate.day < date.day)) {
                                age--;
                              }

                              // Check if the age is 18 or older
                              if (age >= 18) {
                                provider.dateControler.text =
                                    date.toString().substring(0, 10);
                              } else {
                                snackMessage(context,
                                    AppLocalizations.of(context)!.cDate);
                              }
                            }
                          },
                          controller: provider.dateControler,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(
                                Icons.date_range_rounded,
                              ),
                              labelText:
                                  AppLocalizations.of(context)!.dateOfBirth,
                              hintText: "yyyy/mm/dd"),
                        ),
                      ),
                      Visibility(
                        visible: provider.enable == '1',
                        child: TextField(
                          readOnly: provider.enable == '1',
                          controller: provider.dateControler,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText:
                                  AppLocalizations.of(context)!.dateOfBirth,
                              hintText: "yyyy/mm/dd",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.BankNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.bankName,
                            hintText: AppLocalizations.of(context)!.bankName,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.BankHolderNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText:
                                AppLocalizations.of(context)!.bankHolderName,
                            hintText:
                                AppLocalizations.of(context)!.bankHolderName,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.BankAccountNoController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(18),
                          // Assuming a 16-digit bank account number
                        ],
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.bankAccNo,
                            hintText: AppLocalizations.of(context)!.bankAccNo,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 11,
                        readOnly: provider.enable == '1',
                        controller: provider.IFSCController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            counterText: " ",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.ifscCode,
                            hintText: AppLocalizations.of(context)!.ifscCode,
                            border: OutlineInputBorder()),
                      ),
                      TextField(
                        readOnly: provider.enable == '1',
                        controller: provider.BranchNameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.branchName,
                            hintText: AppLocalizations.of(context)!.branchName,
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Visibility(
                          visible: provider.enable == '0',
                          child: InkWell(
                              onTap: () {
                                if (provider.nameController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.farmer} ${AppLocalizations.of(context)!.name}");
                                } else if (provider.AddressController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.address}");
                                } else if (provider.dateControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.dateOfBirth}");
                                } else if (provider.BankNameController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.bankName}");
                                } else if (provider
                                    .BankHolderNameController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.bankHolderName}");
                                } else if (provider.BankAccountNoController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.bankAccNo}");
                                } else if (provider.BankAccountNoController.text
                                        .trim()
                                        .length <
                                    11) {
                                  snackMessage(context,
                                      AppLocalizations.of(context)!.cBank);
                                } else if (provider.IFSCController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.ifscCode}");
                                } else if (provider.IFSCController.text
                                        .trim()
                                        .length <
                                    11) {
                                  snackMessage(context,
                                      AppLocalizations.of(context)!.cIfsc);
                                } else if (provider.BranchNameController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.branchName}");
                                } else {
                                  provider.EditFarmerList(context);
                                }
                              },
                              child: buildContainer(
                                  loading: provider.isLoading,
                                  50.h,
                                  MediaQuery.of(context).size.width,
                                  AppBodyColor.deepPurple,
                                  AppLocalizations.of(context)!.submit,
                                  AppColor.white))),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
