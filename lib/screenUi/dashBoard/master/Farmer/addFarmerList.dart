import 'package:milkdairy/all_import.dart';

class AddFarmer extends StatelessWidget {
  const AddFarmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmerProvier>(
      builder: (context, provider, child) {
        return PopScope(
            onPopInvoked: (didPop) {
              provider.changeBack();
            },
            child: Main_Theme.mainTheme(
                actionwiget: const SizedBox(),
                color: AppBodyColor.white,
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.changeBack();
                  Navigator.pop(context);
                },
                pageName:
                    '${AppLocalizations.of(context)!.add} ${AppLocalizations.of(context)!.farmer}',
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      TextField(
                        controller: provider.RegCodeController,
                        maxLines: 1,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            counterText: " ",
                            labelText: AppLocalizations.of(context)!.regCode,
                            border: OutlineInputBorder()),
                      ),
                      TextField(
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
                      TextField(
                        readOnly: true,
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
                              snackMessage(
                                  context, AppLocalizations.of(context)!.cDate);
                            }
                          }
                        },
                        controller: provider.dateControler,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(
                              Icons.date_range_rounded,
                            ),
                            labelText:
                                AppLocalizations.of(context)!.dateOfBirth,
                            hintText: "yyyy/mm/dd"),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        maxLines: 1,
                        maxLength: 10,
                        controller: provider.PhoneController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            counterText: " ",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: AppLocalizations.of(context)!.phone,
                            hintText: AppLocalizations.of(context)!.phone,
                            border: OutlineInputBorder()),
                      ),
                      TextField(
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
                        controller: provider.BankAccountNoController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
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
                      InkWell(
                          onTap: () {
                            if (provider.RegCodeController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(context,
                                  "${AppLocalizations.of(context)!.pleaseEnter}  ${AppLocalizations.of(context)!.farmer} ${AppLocalizations.of(context)!.regCode}");
                            } else if (provider.nameController.text
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
                            } else if (provider.PhoneController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(context,
                                  "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.phone}");
                            } else if (provider.PhoneController.text
                                    .trim()
                                    .length <
                                10) {
                              snackMessage(context,
                                  AppLocalizations.of(context)!.cPhone);
                            } else if (provider.BankNameController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(context,
                                  "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.bankName}");
                            } else if (provider.BankHolderNameController.text
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
                              snackMessage(
                                  context, AppLocalizations.of(context)!.cBank);
                            } else if (provider.IFSCController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(context,
                                  "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.ifscCode}");
                            } else if (provider.IFSCController.text
                                    .trim()
                                    .length <
                                11) {
                              snackMessage(
                                  context, AppLocalizations.of(context)!.cIfsc);
                            } else if (provider.BranchNameController.text
                                .trim()
                                .isEmpty) {
                              snackMessage(context,
                                  "${AppLocalizations.of(context)!.pleaseEnter} ${AppLocalizations.of(context)!.branchName}");
                            } else {
                              provider.addFarmer(context);
                            }
                          },
                          child: buildContainer(
                              50.h,
                              MediaQuery.of(context).size.width,
                              AppBodyColor.deepPurple,
                              AppLocalizations.of(context)!.submit,
                              AppColor.white,
                              loading: provider.isLoading)),
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
