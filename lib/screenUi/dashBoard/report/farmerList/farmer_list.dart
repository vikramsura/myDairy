import 'package:milkdairy/all_import.dart';

class FarmerListReport extends StatefulWidget {
  const FarmerListReport({super.key});

  @override
  State<FarmerListReport> createState() => _FarmerListReportState();
}

class _FarmerListReportState extends State<FarmerListReport> {
  @override
  void initState() {
    Provider.of<FarmerProvier>(context, listen: false).GetFarmerListsData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmerProvier>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return Main_Theme.mainTheme(
          actionwiget: SizedBox(),
          color: AppBodyColor.backGro,
          width: MediaQuery.of(context).size.width,
          icononpress: () {
            provider.cleanData();
            Navigator.pop(context);
          },
          pageName: itemText.farmer,
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
                      provider.searchFarmerList.clear();
                    } else if (value.trim().isNotEmpty) {
                      provider.searchFarmerList =
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
                          child: buildText(itemText.code, 12.w, AppColor.white,
                              FontWeight.w400),
                        )),
                    SizedBox(
                        width: 80.w,
                        child: Center(
                          child: buildText(itemText.name, 12.w, AppColor.white,
                              FontWeight.w400),
                        )),
                    SizedBox(
                        width: 80.w,
                        child: Center(
                          child: buildText(itemText.id, 12.w, AppColor.white,
                              FontWeight.w400),
                        )),
                  ],
                ),
              ),
              provider.searchControler.text.trim().isEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: provider.FarmerList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = provider.FarmerList[index];
                            return Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: AppBodyColor.white),
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
                                                item.registrationCode
                                                    .toString(),
                                                12.w,
                                                AppColor.black,
                                                FontWeight.w400),
                                          )),
                                      SizedBox(
                                          width: 80.w,
                                          child: Center(
                                            child: buildText(
                                                item.name.toString(),
                                                12.w,
                                                AppColor.black,
                                                FontWeight.w400),
                                          )),
                                      SizedBox(
                                          width: 80.w,
                                          child: Center(
                                            child: buildText(
                                                item.id.toString(),
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
                            );
                          }),
                    )
                  : Flexible(
                      child: ListView.builder(
                          itemCount: provider.searchFarmerList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = provider.searchFarmerList[index];
                            return Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: AppBodyColor.white),
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
                                                item.registrationCode
                                                    .toString(),
                                                12.w,
                                                AppColor.black,
                                                FontWeight.w400),
                                          )),
                                      SizedBox(
                                          width: 80.w,
                                          child: Center(
                                            child: buildText(
                                                item.name.toString(),
                                                12.w,
                                                AppColor.black,
                                                FontWeight.w400),
                                          )),
                                      SizedBox(
                                          width: 80.w,
                                          child: Center(
                                            child: buildText(
                                                item.id.toString(),
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
                            );
                          }),
                    ),
            ],
          ));
    });
  }
}
