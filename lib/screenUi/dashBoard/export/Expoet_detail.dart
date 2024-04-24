import 'package:milkdairy/all_import.dart';

class ExportList extends StatefulWidget {
  ExportList({Key? key}) : super(key: key);

  @override
  State<ExportList> createState() => _ExportListState();
}

class _ExportListState extends State<ExportList> {
  @override
  void initState() {
    Provider.of<ExportProvider>(context, listen: false).GetExportListsData();
    // TODO: implement initState
    super.initState();
  }

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
                floatingAction: FloatingActionButton(
                  backgroundColor: AppBodyColor.deepPurple,
                  child: Icon(Icons.add, color: AppBodyColor.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Add_Export()));
                  },
                ),
                pageName: itemText.export,
                widget: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppBodyColor.deepPurple,
                      ))
                    : provider.exportData.isEmpty
                        ? Center(
                            child: Text(itemText.notDataFound),
                          )
                        : Column(
                            children: [
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
                                          width: 50.w,
                                          child: Center(
                                            child: buildText(
                                                itemText.id,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500),
                                          )),
                                      SizedBox(
                                          width: 90.w,
                                          child: Center(
                                            child: buildText(
                                                itemText.name,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500),
                                          )),
                                      SizedBox(
                                          width: 120.w,
                                          child: Center(
                                            child: buildText(
                                                itemText.dairyName,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: provider.exportData.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var item = provider.exportData[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ExportShowList(
                                                          export: item)));
                                        },
                                        child: Card(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                    width: 50.w,
                                                    child: Center(
                                                      child: buildText(
                                                          item.id.toString(),
                                                          16.w,
                                                          AppColor.black,
                                                          FontWeight.w400),
                                                    )),
                                                SizedBox(
                                                    width: 90.w,
                                                    child: Center(
                                                      child: buildText(
                                                          item.users?.name
                                                              .toString(),
                                                          16.w,
                                                          AppColor.black,
                                                          FontWeight.w400),
                                                    )),
                                                SizedBox(
                                                    width: 120.w,
                                                    child: Center(
                                                      child: buildText(
                                                          UserDetails
                                                              .userDairyName
                                                              .toString(),
                                                          16.w,
                                                          AppColor.black,
                                                          FontWeight.w400),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )));
      },
    );
  }
}
