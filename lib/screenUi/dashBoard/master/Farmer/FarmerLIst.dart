import 'package:milkdairy/all_import.dart';

class FARmerList extends StatelessWidget {
  const FARmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmerProvier>(
      builder: (context, provider, child) {
        return PopScope(
            onPopInvoked: (v) async {
              // provider.changeBack();
            },
            child: Main_Theme.mainTheme(
                color: AppBodyColor.white,
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.changeBack();
                  Navigator.pop(context);
                },
                actionwiget: Row(
                  children: [
                    Visibility(
                      visible: provider.enable == '1',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeTap("0");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.search_outlined,
                              color: AppBodyColor.white),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: provider.enable == '0',
                      child: GestureDetector(
                        onTap: () {
                          provider.changeTap("1");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.close_outlined,
                              color: AppBodyColor.white),
                        ),
                      ),
                    ),
                  ],
                ),
                floatingAction: buildFloatingActionButton(() {
                  provider.cleanData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddFarmer()));
                }),
                pageName:
                    "${AppLocalizations.of(context)!.farmer} ${AppLocalizations.of(context)!.list}",
                widget: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppBodyColor.deepPurple,
                      ))
                    : provider.FarmerList.isEmpty
                        ? Center(
                            child: Text(
                                AppLocalizations.of(context)!.notDataFound),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              Visibility(
                                visible: provider.enable == '0',
                                child: Column(
                                  children: [
                                    TextField(
                                      onChanged: (value) {
                                        if (value.trim().isEmpty) {
                                          provider.searchFarmerList.clear();
                                        } else if (value.trim().isNotEmpty) {
                                          provider.searchFarmerList = provider
                                              .searchNames(value.trim());
                                        }
                                      },
                                      controller: provider.searchControler,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 30),
                                        hintText: AppLocalizations.of(context)!
                                                .search +
                                            "......",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: const BorderSide(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),

                              Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                          width: 80.w,
                                          child: buildText(
                                              AppLocalizations.of(context)!
                                                  .code,
                                              16.w,
                                              AppColor.deepPurple,
                                              FontWeight.w500)),
                                      SizedBox(
                                          width: 120.w,
                                          child: buildText(
                                              AppLocalizations.of(context)!
                                                  .name,
                                              16.w,
                                              AppColor.deepPurple,
                                              FontWeight.w500)),
                                      SizedBox(
                                          width: 60.w,
                                          child: buildText(
                                              AppLocalizations.of(context)!.id,
                                              16.w,
                                              AppColor.deepPurple,
                                              FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Visibility(
                                visible: provider.enable == '1',
                                child: Flexible(
                                  child: provider.isLoading
                                      ? CircularProgressIndicator()
                                      : ListView.builder(
                                          itemCount: provider.FarmerList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            var item =
                                                provider.FarmerList[index];
                                            return GestureDetector(
                                              onTap: () {
                                                Provider.of<FarmerProvier>(
                                                        context,
                                                        listen: false)
                                                    .intadd(item);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditFarmer()));
                                              },
                                              child: Card(
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      SizedBox(
                                                          width: 80.w,
                                                          child: buildText(
                                                              item.registrationCode
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                      SizedBox(
                                                          width: 120.w,
                                                          child: buildText(
                                                              item.name
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                      SizedBox(
                                                          width: 60.w,
                                                          child: buildText(
                                                              item.id
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                ),
                              ),
                              Visibility(
                                visible: provider.enable == '0',
                                child: provider.searchControler.text
                                        .trim()
                                        .isEmpty
                                    ? Text(" ")
                                    : provider.searchFarmerList.isEmpty
                                        ? Center(
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .notDataFound),
                                          )
                                        : Flexible(
                                            child: ListView.builder(
                                                itemCount: provider
                                                    .searchFarmerList.length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  var item = provider
                                                      .searchFarmerList[index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Provider.of<FarmerProvier>(
                                                              context,
                                                              listen: false)
                                                          .intadd(item);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditFarmer()));
                                                    },
                                                    child: Card(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            SizedBox(
                                                                width: 80.w,
                                                                child: buildText(
                                                                    item.registrationCode
                                                                        .toString(),
                                                                    16.w,
                                                                    AppColor
                                                                        .black,
                                                                    FontWeight
                                                                        .w400)),
                                                            SizedBox(
                                                                width: 120.w,
                                                                child: buildText(
                                                                    item.name
                                                                        .toString(),
                                                                    16.w,
                                                                    AppColor
                                                                        .black,
                                                                    FontWeight
                                                                        .w400)),
                                                            SizedBox(
                                                                width: 60.w,
                                                                child: buildText(
                                                                    item.id
                                                                        .toString(),
                                                                    16.w,
                                                                    AppColor
                                                                        .black,
                                                                    FontWeight
                                                                        .w400)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // )
                            ],
                          )));
      },
    );
  }
}
