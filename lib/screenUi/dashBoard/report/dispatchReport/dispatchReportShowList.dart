import 'package:milkdairy/all_import.dart';

class DispatchReportShowList extends StatelessWidget {
  const DispatchReportShowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.dispatchReport.clear();
          },
          child: Main_Theme.mainTheme(
              color: AppBodyColor.backGro,
              actionwiget: const SizedBox(),
              width: MediaQuery.of(context).size.width,
              icononpress: () {
                provider.dispatchReport.clear();
                Navigator.pop(context);
              },
              pageName: itemText.dispatchReport,
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
                          provider.searchDipatchReportList.clear();
                        } else if (value.trim().isNotEmpty) {
                          provider.searchDipatchReportList =
                              provider.searchDispatchReport(value.trim());
                        }
                      },
                      controller: provider.searchControler,
                      keyboardType: TextInputType.number,
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
                              child: buildText(itemText.id, 12.w,
                                  AppColor.white, FontWeight.w400),
                            )),
                        SizedBox(
                            width: 80.w,
                            child: Center(
                              child: buildText(itemText.shift, 12.w,
                                  AppColor.white, FontWeight.w400),
                            )),
                        SizedBox(
                            width: 80.w,
                            child: Center(
                              child: buildText(itemText.tankerNo, 12.w,
                                  AppColor.white, FontWeight.w400),
                            )),
                      ],
                    ),
                  ),
                  provider.searchControler.text.trim().isEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: provider.dispatchReport.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.dispatchReport[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DispatchReportPrint(
                                                  dispatchReportShowData: item),
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
                                                      item.id.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      shiftsInput(context)[item
                                                              .shift
                                                              .toString()] ??
                                                          item.shift.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.tankerNo.toString(),
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
                                  provider.searchDipatchReportList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item =
                                    provider.searchDipatchReportList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DispatchReportPrint(
                                                  dispatchReportShowData: item),
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
                                                      item.id.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.shift.toString(),
                                                      12.w,
                                                      AppColor.black,
                                                      FontWeight.w400),
                                                )),
                                            SizedBox(
                                                width: 80.w,
                                                child: Center(
                                                  child: buildText(
                                                      item.tankerNo.toString(),
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
