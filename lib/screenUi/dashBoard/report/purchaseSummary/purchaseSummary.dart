import 'package:milkdairy/all_import.dart';

class PurchaseSummary extends StatefulWidget {
  const PurchaseSummary({Key? key}) : super(key: key);

  @override
  State<PurchaseSummary> createState() => _PurchaseSummaryState();
}

class _PurchaseSummaryState extends State<PurchaseSummary> {
  @override
  void initState() {
    Provider.of<ReportProvider>(context, listen: false).getInitDate();
    Provider.of<AutomaticProvider>(context, listen: false).GetItemData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.DataClean();
          },
          child: Main_Theme.mainTheme(
            color: AppBodyColor.blueGrey,
            actionwiget: SizedBox(),
            width: MediaQuery.of(context).size.width,
            icononpress: () {
              provider.DataClean();
              Navigator.pop(context);
            },
            pageName: itemText.purchaseSummary,
            widget: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 40.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Text(
                        "From Date",
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              provider.fromDateController.text =
                                  date.toString().substring(0, 10);
                            },
                            controller: provider.fromDateController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                constraints:
                                    BoxConstraints(maxWidth: double.infinity),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                fillColor: Color(0xffffffff),
                                suffixIcon: Icon(
                                  Icons.date_range_rounded,
                                ),
                                hintText: "yyyy/mm/dd"),
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
                        itemText.toDate,
                        style: TextStyle(fontSize: 18),
                      )),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
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
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                constraints:
                                    BoxConstraints(maxWidth: double.infinity),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                fillColor: Color(0xffffffff),
                                suffixIcon: Icon(
                                  Icons.date_range_rounded,
                                ),
                                hintText: "yyyy/mm/dd"),
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
                          itemText.shift,
                          style: TextStyle(fontSize: 18),
                        )),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 60.h,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  textAlign: TextAlign.left,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      constraints: BoxConstraints(
                                          maxWidth: double.infinity),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: DropdownButtonHideUnderline(
                                    child: provider.GetShift(context),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ]),
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
                          itemText.milkType,
                          style: TextStyle(fontSize: 18),
                        )),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 60.h,
                            child: FormField(
                              builder: (FormFieldState<dynamic> field) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          top: 10, bottom: 10, right: 10),
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
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: provider.myItemList ??
                                            itemText.select,
                                        onChanged: (newValue) {
                                          provider.changeItem(newValue);
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(itemText.select),
                                            value: itemText.select,
                                          ),
                                          ...Provider.of<AutomaticProvider>(
                                                  context,
                                                  listen: false)
                                              .itemList
                                              .map((item) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                item.item.toString(),
                                              ),
                                              value: item.id.toString(),
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
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () async {
                    DateTime fDate =
                        DateTime.parse(provider.fromDateController.text.trim());
                    DateTime tDate =
                        DateTime.parse(provider.dateController.text.trim());
                    Duration difference = tDate.difference(fDate);
                    if (provider.dateController.text.trim().toString() ==
                        provider.fromDateController.text.toString()) {
                      snackMessage(
                          context, "${itemText.pleaseEnter} ${itemText.date}");
                    } else if (difference.inDays < 0) {
                      snackMessage(context,
                          "${itemText.pleaseEnter} ${itemText.validtodate}");
                    } else if (provider.shift == itemText.select ||
                        provider.shift.toString().isEmpty ||
                        provider.shift == null) {
                      snackMessage(
                          context, "${itemText.pleaseEnter} ${itemText.shift}");
                    } else if (provider.myItemList.toString() ==
                            itemText.select ||
                        provider.myItemList.toString().isEmpty ||
                        provider.myItemList == null) {
                      snackMessage(context,
                          "${itemText.pleaseEnter} ${itemText.milkType}");
                    } else {
                      var response = await provider.GetPurchaseSummaryList();
                      if (response['success'] == true &&
                          response['data'] != "" &&
                          response['data'] != null &&
                          !response['data'].isEmpty) {
                        snackMessage(context, response["message"], no: 2);
                        PurchaseSummaryModel rateChatModel =
                            PurchaseSummaryModel.fromJson(response);
                        provider.purchaseSummary.addAll(rateChatModel.data!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PurchaseSummaryShwoList(),
                            ));
                      } else if (response["data"].isEmpty) {
                        snackMessage(context, itemText.invalid);
                      } else if (response["data"] == "") {
                        snackMessage(context, itemText.invalid);
                      } else if (response["data"] == null) {
                        snackMessage(context, itemText.invalid);
                      } else if (response["success"] == false) {
                        snackMessage(context, response["message"]);
                      }
                    }
                  },
                  child: buildContainer(
                      loading: provider.isLoading,
                      50.h,
                      MediaQuery.of(context).size.width,
                      AppBodyColor.blue,
                      "SUBMIT",
                      AppColor.white),
                ),
              ],
            ),
          ));
    });
  }
}
