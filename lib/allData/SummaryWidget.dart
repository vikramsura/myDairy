import 'package:milkdairy/all_import.dart';

Widget buildInkWellSummary(
    {required BuildContext context,
    required AppLocalizations itemText,
    required AutomaticProvider provider}) {
  return InkWell(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(4),
              contentPadding: EdgeInsets.all(10),
              content: SizedBox(
                height: 260.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppBodyColor.blue,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4))),
                      child: Center(
                          child: buildSumm(itemText.sUMMARY, 16.w,
                              AppColor.white, FontWeight.w500)),
                    ),
                    Container(
                      height: 180.w,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppBodyColor.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(40.w),
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSumm(itemText.milk, 16.w, AppColor.black,
                                      FontWeight.w600),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSumm(itemText.farmer, 16.w,
                                      AppColor.black, FontWeight.w600),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSumm(itemText.litre, 16.w,
                                      AppColor.black, FontWeight.w600),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSumm(itemText.fat, 16.w, AppColor.black,
                                      FontWeight.w600),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSumm(itemText.rate, 16.w, AppColor.black,
                                      FontWeight.w600),
                                ],
                              ),
                            ),
                          ]),
                          buildTableRow(
                              provider: provider, itemText: itemText, no: 0),
                          buildTableRow(
                              provider: provider, itemText: itemText, no: 1),
                          buildTableRow(
                              provider: provider, itemText: itemText, no: 2),
                          buildTableRow(
                              provider: provider, itemText: itemText, no: 3),
                          TableRow(
                              decoration:
                                  BoxDecoration(color: AppBodyColor.peach),
                              children: [
                                SizedBox(
                                  height: 30.h,
                                  width: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSumm(itemText.total, 14.w,
                                          AppColor.black, FontWeight.w400),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                  width: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSumm(
                                          provider.data.overallTotals
                                                  ?.totalFarmer
                                                  .toString() ??
                                              " ",
                                          14.w,
                                          AppColor.black,
                                          FontWeight.w400),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                  width: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSumm(
                                          provider.data.overallTotals
                                                  ?.totalQuantity
                                                  .toString() ??
                                              " ",
                                          14.w,
                                          AppColor.black,
                                          FontWeight.w400),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                  width: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSumm(
                                          provider.data.overallTotals == null
                                              ? ""
                                              : double.parse(provider
                                                      .data
                                                      .overallTotals!
                                                      .totalFatAvg
                                                      .toString())
                                                  .toStringAsFixed(2),
                                          14.w,
                                          AppColor.black,
                                          FontWeight.w400),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                  width: 80.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildSumm(
                                          provider.data.overallTotals
                                                  ?.totalAmount
                                                  .toString() ??
                                              " ",
                                          14.w,
                                          AppColor.black,
                                          FontWeight.w400),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    },
    child: buildContainer(50.h, MediaQuery.of(context).size.width / 3,
        AppBodyColor.blue, itemText.sUMMARY, AppColor.white),
  );
}

TableRow buildTableRow(
    {required AutomaticProvider provider,
    required AppLocalizations itemText,
    no}) {
  return TableRow(children: [
    SizedBox(
      height: 30.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSumm(
              provider.data.summary == null
                  ? ""
                  : provider.data.summary!.length > no
                      ? provider.data.summary![no].milkType.toString() == "1"
                          ? itemText.cow.toString()
                          : provider.data.summary![no].milkType.toString() ==
                                  "2"
                              ? itemText.buffalo
                              : provider.data.summary![no].milkType
                                          .toString() ==
                                      "3"
                                  ? itemText.mix
                                  : itemText.other
                      : "",
              14.w,
              AppColor.black,
              FontWeight.w400),
        ],
      ),
    ),
    SizedBox(
      height: 30.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSumm(
              provider.data.summary == null
                  ? ""
                  : provider.data.summary!.length > no
                      ? provider.data.summary![no].farmerCount.toString()
                      : " ",
              14.w,
              AppColor.black,
              FontWeight.w400),
        ],
      ),
    ),
    SizedBox(
      height: 30.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSumm(
              provider.data.summary == null
                  ? ""
                  : provider.data.summary!.length > no
                      ? provider.data.summary![no].totalQuantity.toString()
                      : " ",
              14.w,
              AppColor.black,
              FontWeight.w400),
        ],
      ),
    ),
    SizedBox(
      height: 30.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSumm(
              provider.data.summary == null
                  ? ""
                  : provider.data.summary!.length > no
                      ? double.parse(
                              provider.data.summary![no].avgFat.toString())
                          .toStringAsFixed(2)
                      : " ",
              14.w,
              AppColor.black,
              FontWeight.w400),
        ],
      ),
    ),
    SizedBox(
      height: 30.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSumm(
              provider.data.summary == null
                  ? ""
                  : provider.data.summary!.length > no
                      ? provider.data.summary![no].totalAmount.toString()
                      : " ",
              14.w,
              AppColor.black,
              FontWeight.w400),
        ],
      ),
    ),
  ]);
}
