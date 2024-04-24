import 'package:milkdairy/all_import.dart';
import 'package:milkdairy/provider/dashBoardProvider/settingsProvider/choosePlanProvider.dart';

class ChoosePlanPage extends StatefulWidget {
  ChoosePlanPage({super.key});

  @override
  State<ChoosePlanPage> createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  @override
  void initState() {
    Provider.of<ChoosePlanProvider>(context, listen: false).plans();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChoosePlanProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.DataClean();
          },
          child: Main_Theme.mainTheme(
              icononpress: () {
                provider.DataClean();
                Navigator.pop(context);
              },
              actionwiget: const SizedBox(),
              color: AppBodyColor.backGro,
              width: MediaQuery.of(context).size.width,
              pageName: itemText.choosePlan,
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.w),
                    buildText(itemText.subscriptionForDailyItems, 18.w,
                        AppColor.black, FontWeight.w500),
                    SizedBox(height: 30.h),
                    provider.isLoading
                        ? const CircularProgressIndicator()
                        : provider.plansList.isEmpty
                            ? buildText(itemText.notDataFound, 18.w,
                                AppColor.black, FontWeight.w500)
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.plansList.length,
                                itemBuilder: (context, index) {
                                  var listData = provider.plansList[index];
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 200.h,
                                        child: Stack(children: [
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.2,
                                                  height: 180.w,
                                                  decoration: BoxDecoration(
                                                      color: AppBodyColor.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.w)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.w),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: buildText(
                                                                "${listData.duration}",
                                                                14.w,
                                                                AppColor.white,
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                          SizedBox(
                                                              height: 14.w),
                                                          buildText(
                                                              "${listData.name}",
                                                              18.w,
                                                              AppColor.white,
                                                              FontWeight.w500),
                                                          SizedBox(
                                                              height: 20.h),
                                                          // buildText(
                                                          //     "\u{20B9} 189/${itemText.order}",
                                                          //     16.w,
                                                          //     AppColor.white,
                                                          //     FontWeight.w400),
                                                          buildText(
                                                              "\u{20B9} ${listData.price}",
                                                              16.w,
                                                              AppColor.white,
                                                              FontWeight.w400),
                                                          // Padding(
                                                          //   padding: EdgeInsets.only(
                                                          //       top: 6.h, left: 10.w),
                                                          //   child: buildText(
                                                          //       itemText.freeDelivery,
                                                          //       16.w,
                                                          //       AppColor.white,
                                                          //       FontWeight.w400),
                                                          // ),
                                                        ]),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 18.h,
                                                  right: 14.w,
                                                  child: buildContainer(
                                                      30.h,
                                                      85.w,
                                                      AppBodyColor.white,
                                                      itemText.pay,
                                                      AppColor.black),
                                                )
                                              ],
                                            ),
                                          ),
                                          // Align(
                                          //   alignment: Alignment.topLeft,
                                          //   child: Container(
                                          //     width: 150.w,
                                          //     height: 50.h,
                                          //     decoration: BoxDecoration(
                                          //         color: AppBodyColor.deepPurple,
                                          //         borderRadius:
                                          //             BorderRadius.circular(6.w)),
                                          //     child: Padding(
                                          //       padding: EdgeInsets.all(4.w),
                                          //       child: Center(
                                          //         child: buildText(
                                          //             "${itemText.getCashbackUpto} 10% ${itemText.onYourWallet}",
                                          //             14.w,
                                          //             AppColor.white,
                                          //             FontWeight.w400),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                    ],
                                  );
                                }),
                  ],
                ),
              )));
    });
  }
}
