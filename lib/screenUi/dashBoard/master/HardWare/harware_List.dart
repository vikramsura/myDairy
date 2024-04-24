import 'package:milkdairy/all_import.dart';

class HardWareList extends StatefulWidget {
  HardWareList({
    Key? key,
  }) : super(key: key);

  @override
  State<HardWareList> createState() => _HardWareListState();
}

class _HardWareListState extends State<HardWareList> {
  @override
  void initState() {
    super.initState();
    Provider.of<HardwareProvider>(context, listen: false).GetHardwareListData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HardwareProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "1";
              provider.cleanData(context);
            },
            child: Main_Theme.mainTheme(
                actionwiget: const SizedBox(),
                color: AppBodyColor.white,
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.enabled = "1";
                  provider.cleanData(context);
                  Navigator.pop(context);
                },
                floatingAction: buildFloatingActionButton(
                  () {
                    provider.cleanData(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddHardware()));
                  },
                ),
                pageName: itemText.hardware,
                widget: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppBodyColor.deepPurple,
                      ))
                    : provider.HardwareList.isEmpty
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
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 60.w,
                                        child: buildText(
                                            itemText.code,
                                            16.w,
                                            AppColor.deepPurple,
                                            FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                        child: buildText(
                                            itemText.name,
                                            16.w,
                                            AppColor.deepPurple,
                                            FontWeight.w500),
                                      ),
                                      SizedBox(
                                          width: 130.w,
                                          child: Center(
                                              child: buildText(
                                                  itemText.type,
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
                                        itemCount: provider.HardwareList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var item =
                                              provider.HardwareList[index];
                                          var hardwareTypes =
                                              hardwareInput(context)[
                                                      item.hwType.toString()] ??
                                                  item.hwType.toString();
                                          return Container(
                                            height: 50,
                                            child: GestureDetector(
                                              onTap: () {
                                                Provider.of<HardwareProvider>(
                                                        context,
                                                        listen: false)
                                                    .initData(context, item);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditHardware(),
                                                    ));
                                              },
                                              onLongPress: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          itemText.hdelete),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                                itemText.no)),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              var response =
                                                                  await provider
                                                                      .DeleteHardware(item
                                                                          .id
                                                                          .toString());
                                                              if (response[
                                                                          'success'] ==
                                                                      true &&
                                                                  response[
                                                                          'success'] !=
                                                                      null) {
                                                                provider
                                                                    .GetHardwareListData();
                                                                snackMessage(
                                                                    context,
                                                                    response[
                                                                        "message"],
                                                                    no: 2);
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            },
                                                            child: Text(
                                                                itemText.yes)),
                                                      ],
                                                    );
                                                  },
                                                );
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
                                                          width: 60.w,
                                                          child: buildText(
                                                              item.id
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                      SizedBox(
                                                          width: 80.w,
                                                          child: buildText(
                                                              item.hwName
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                      SizedBox(
                                                          width: 130.w,
                                                          child: buildText(
                                                              hardwareTypes
                                                                  .toString(),
                                                              16.w,
                                                              AppColor.black,
                                                              FontWeight.w400)),
                                                    ],
                                                  ),
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
