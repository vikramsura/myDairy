import 'package:milkdairy/all_import.dart';

class MilkSlipList extends StatelessWidget {
  MilkSlipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.milkSlip.clear();
          },
          child: Main_Theme.mainTheme(
              color: AppBodyColor.backGro,
              actionwiget: SizedBox(),
              width: MediaQuery.of(context).size.width,
              icononpress: () {
                provider.milkSlip.clear();
                Navigator.pop(context);
              },
              pageName: itemText.milkSlip,
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
                          provider.searchMilkSlipList.clear();
                        } else if (value.trim().isNotEmpty) {
                          provider.searchMilkSlipList =
                              provider.searchNames(value.trim());
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
                            child: Center(
                              child: buildText(itemText.amount, 12.w,
                                  AppColor.white, FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                  provider.searchControler.text.trim().isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: provider.milkSlip.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.milkSlip[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MilkSlipPrint(milkShowData: item),
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
                              itemCount: provider.searchMilkSlipList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.searchMilkSlipList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MilkSlipPrint(milkShowData: item),
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
                                                width: 50.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.userUniId.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 30.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.milkType.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 30.w,
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
