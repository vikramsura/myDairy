import 'package:milkdairy/all_import.dart';

class FarmerMilkBillShowList extends StatelessWidget {
  const FarmerMilkBillShowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.farmerMilkBill.clear();
          },
          child: Main_Theme.mainTheme(
              color: AppBodyColor.backGro,
              actionwiget: SizedBox(),
              width: MediaQuery.of(context).size.width,
              icononpress: () {
                provider.farmerMilkBill.clear();
                Navigator.pop(context);
              },
              pageName: itemText.farmerMilkBill,
              widget: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppBodyColor.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          provider.searchFarmerMilkBillList.clear();
                        } else if (value.trim().isNotEmpty) {
                          provider.searchFarmerMilkBillList =
                              provider.searchFarmerMilkbill(value.trim());
                        }
                      },
                      controller: provider.searchControler,
                      decoration: InputDecoration(
                        hintText: itemText.search,
                        contentPadding:
                            EdgeInsets.only(bottom: 10, top: 10, left: 20),
                        prefixIcon: Icon(Icons.search, color: Colors.black26),
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: AppBodyColor.deepPurple),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 80.w,
                            child: Center(
                              child: buildText(
                                  "${itemText.farmer} ${itemText.id}",
                                  12.w,
                                  AppColor.white,
                                  FontWeight.w400),
                            )),
                        SizedBox(
                            width: 80.w,
                            child: Center(
                              child: buildText(itemText.milkType, 12.w,
                                  AppColor.white, FontWeight.w400),
                            )),
                        SizedBox(
                            width: 80.w,
                            child: buildText(itemText.amount, 12.w,
                                AppColor.white, FontWeight.w400)),
                      ],
                    ),
                  ),
                  provider.searchControler.text.trim().isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: provider.farmerMilkBill.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.farmerMilkBill[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FarmerBillPrint(
                                              farmerBillShowData: item),
                                        ));
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: AppBodyColor.white),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.userUniId.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.milkType.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.totalAmount
                                                          .toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.w,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: AppBodyColor.black,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Flexible(
                          child: ListView.builder(
                              itemCount:
                                  provider.searchFarmerMilkBillList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item =
                                    provider.searchFarmerMilkBillList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FarmerBillPrint(
                                              farmerBillShowData: item),
                                        ));
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: AppBodyColor.white),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.userUniId.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.milkType.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.totalAmount
                                                          .toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.w,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: AppBodyColor.black,
                                          height: 0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                ],
              )));
    });
  }
}
