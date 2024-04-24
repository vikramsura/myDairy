import 'package:milkdairy/all_import.dart';

class MilkSlip extends StatefulWidget {
  const MilkSlip({Key? key}) : super(key: key);

  @override
  State<MilkSlip> createState() => _MilkSlipState();
}

class _MilkSlipState extends State<MilkSlip> {
  @override
  void initState() {
    Provider.of<ReportProvider>(context, listen: false).getInitDate();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, child) {
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
                pageName: itemText.milkSlip,
                widget: Column(children: [
                  SizedBox(height: 50.h),
                  SizedBox(
                    height: 40.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          itemText.date,
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () async {
                      if (provider.shift.toString().isEmpty ||
                          provider.shift == null ||
                          provider.shift == itemText.select) {
                        snackMessage(context,
                            "${itemText.pleaseEnter} ${itemText.shift}");
                      } else {
                        var response = await provider.GetMilkSlipList();
                        if (response['success'] == true &&
                            response['data'] != "" &&
                            response['data'] != null &&
                            !response['data'].isEmpty) {
                          snackMessage(context, response["message"], no: 2);
                          MilkSlipModel rateChatModel =
                              MilkSlipModel.fromJson(response);
                          List<MilkSlipModelData> data = [];
                          data = rateChatModel.data!;
                          provider.milkSlip.addAll(data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MilkSlipList(),
                              ));
                        } else if (response["data"].isEmpty) {
                          snackMessage(context, itemText.invalid);
                        } else if (response["data"] == " ") {
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
                        itemText.sUMMARY,
                        AppColor.white),
                  ),
                ])));
      },
    );
  }
}
