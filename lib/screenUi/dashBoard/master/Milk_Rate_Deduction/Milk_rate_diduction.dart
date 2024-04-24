import 'package:milkdairy/all_import.dart';

class MilkDeduction extends StatelessWidget {
  const MilkDeduction({Key? key}) : super(key: key);

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
                actionwiget: SizedBox(),
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.enabled = "0";
                  provider.cleanData();
                  Navigator.pop(context);
                },
                floatingAction: buildFloatingActionButton(
                  () {
                    provider.cleanData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddMilkDeduction()));
                  },
                ),
                pageName: itemText.milkRateDeduction,
                widget: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppBodyColor.deepPurple,
                      ))
                    : provider.MilkDeductionList.isEmpty
                        ? Center(
                            child: Text(itemText.notDataFound),
                          )
                        : Column(children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                        width: 70.w,
                                        child: Center(
                                            child: buildText(
                                                itemText.morning,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500))),
                                    SizedBox(
                                        width: 70.w,
                                        child: Center(
                                            child: buildText(
                                                itemText.penalty,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500))),
                                    SizedBox(
                                        width: 70.w,
                                        child: buildText(
                                            itemText.evening,
                                            16.w,
                                            AppColor.deepPurple,
                                            FontWeight.w500)),
                                    SizedBox(
                                        width: 70.w,
                                        child: Center(
                                            child: buildText(
                                                itemText.penalty,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Flexible(
                              child: provider.isLoading
                                  ? CircularProgressIndicator()
                                  : ListView.builder(
                                      itemCount:
                                          provider.MilkDeductionList.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var item =
                                            provider.MilkDeductionList[index];
                                        return Container(
                                          height: 50.h,
                                          child: GestureDetector(
                                            onTap: () {
                                              Provider.of<MilkRateDeductionProvider>(
                                                      context,
                                                      listen: false)
                                                  .initData(context, item);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditMilkDeduction()));
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                        width: 70.w,
                                                        child: Center(
                                                            child: buildText(
                                                                item.morningFromTime
                                                                    .toString(),
                                                                16.w,
                                                                AppColor.black,
                                                                FontWeight
                                                                    .w400))),
                                                    SizedBox(
                                                        width: 70.w,
                                                        child: Center(
                                                            child: buildText(
                                                                item.morningPenaltyValue
                                                                    .toString(),
                                                                16.w,
                                                                AppColor.black,
                                                                FontWeight
                                                                    .w400))),
                                                    SizedBox(
                                                        width: 70.w,
                                                        child: Center(
                                                            child: buildText(
                                                                item.eveningFromTime
                                                                    .toString(),
                                                                16.w,
                                                                AppColor.black,
                                                                FontWeight
                                                                    .w400))),
                                                    SizedBox(
                                                        width: 70.w,
                                                        child: Center(
                                                            child: buildText(
                                                                item.eveningPenaltyValue
                                                                    .toString(),
                                                                16.w,
                                                                AppColor.black,
                                                                FontWeight
                                                                    .w400))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                            ),
                          ])));
      },
    );
  }
}
