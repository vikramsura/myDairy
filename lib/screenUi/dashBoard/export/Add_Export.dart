import 'package:milkdairy/all_import.dart';

class Add_Export extends StatefulWidget {
  Add_Export({Key? key}) : super(key: key);

  @override
  State<Add_Export> createState() => _Add_ExportState();
}

class _Add_ExportState extends State<Add_Export> {
  @override
  void initState() {
    Provider.of<ExportProvider>(context, listen: false).GetRouteList();
    Provider.of<ExportProvider>(context, listen: false).GetItemList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExportProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;

        return PopScope(
            onPopInvoked: (didPop) {
              provider.dataClear();
            },
            child: Main_Theme.mainTheme(
                color: AppBodyColor.white,
                actionwiget: const SizedBox(),
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.dataClear();
                  Navigator.pop(context);
                },
                pageName: itemText.export,
                widget: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          TextField(
                            maxLines: 1,
                            readOnly: true,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.adminID,
                                hintText: UserDetails.parentId,
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 60.h,
                            child: FormField(
                              initialValue: itemText.select,
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 18,
                                          top: 18,
                                          right: 10),
                                      prefix: SizedBox(width: 20.w),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
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
                          SizedBox(
                            height: 60.h,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 18,
                                          top: 18,
                                          right: 10),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: itemText.route,
                                      labelText: itemText.route,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value:
                                            provider.myRoute ?? itemText.select,
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w400),
                                        onChanged: (newValue) {
                                          provider.changeRoute(newValue);
                                        },
                                        hint: Text(itemText.route),
                                        items: [
                                          DropdownMenuItem(
                                            value: itemText.select,
                                            child: Text(itemText.select),
                                          ),
                                          ...provider.RouteList.map((item) {
                                            return DropdownMenuItem(
                                              value:
                                                  item['route_id'].toString(),
                                              child: Text(item['route_id']),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 60.h,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 18,
                                          top: 18,
                                          right: 10),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: itemText.milkType,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: provider.myItemList ??
                                            itemText.select,
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w400),
                                        onChanged: (newValue) {
                                          provider.changeItem(newValue);
                                        },
                                        hint: Text(itemText.milkType),
                                        items: [
                                          DropdownMenuItem(
                                            value: itemText.select,
                                            child: Text(itemText.select),
                                          ),
                                          ...provider.itemList.map((item) {
                                            return DropdownMenuItem(
                                              value: item.id.toString(),
                                              child: Text(
                                                item.item.toString(),
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.qtyController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.qty,
                                hintText: itemText.qty,
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.fatController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.fat,
                                hintText: itemText.fat,
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.snfController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.snf,
                                hintText: itemText.snf,
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.clrController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.clr,
                                hintText: itemText.clr,
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.rateController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.rate,
                                hintText: itemText.rate,
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: provider.amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 10, bottom: 18, top: 18, right: 10),
                                prefix: SizedBox(width: 20.w),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: itemText.amount,
                                hintText: itemText.amount,
                                border: const OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () async {
                              if (provider.shift.toString() ==
                                      itemText.select ||
                                  provider.shift.toString().isEmpty ||
                                  provider.shift == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.shift}");
                              } else if (provider.myRoute.toString() ==
                                      itemText.select ||
                                  provider.myRoute.toString().isEmpty ||
                                  provider.myRoute == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.route}");
                              } else if (provider.myItemList.toString() ==
                                      itemText.select ||
                                  provider.myItemList.toString().isEmpty ||
                                  provider.myItemList == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.milkType}");
                              } else if (provider.qtyController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.qty}");
                              } else if (provider.fatController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.fat}");
                              } else if (provider.snfController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.snf}");
                              } else if (provider.clrController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.clr}");
                              } else if (provider.rateController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.rate}");
                              } else if (provider.amountController.text
                                  .trim()
                                  .isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.amount}");
                              } else {
                                provider.AddExport(context);
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
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
