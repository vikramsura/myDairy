import 'package:milkdairy/all_import.dart';

class RateList extends StatelessWidget {
  RateList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RateChartProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return PopScope(
            onPopInvoked: (didPop) {
              provider.enabled = "1";
              provider.dataClear();
            },
            child: Main_Theme.mainTheme(
                color: AppBodyColor.white,
                actionwiget: SizedBox(),
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.enabled = '0';
                  provider.dataClear();
                  Navigator.pop(context);
                },
                floatingAction: buildFloatingActionButton(() {
                  provider.dataClear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddRateList()));
                }),
                pageName: itemText.milkRateChart,
                widget: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppBodyColor.deepPurple,
                      ))
                    : provider.rateChatModelList.isEmpty
                        ? Center(
                            child: Text(itemText.notDataFound),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              SizedBox(
                                height: 50.h,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                            width: 80.w,
                                            child: buildText(
                                                itemText.code,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500)),
                                        SizedBox(
                                            width: 100.w,
                                            child: buildText(
                                                itemText.date,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500)),
                                        SizedBox(
                                            width: 80.w,
                                            child: buildText(
                                                itemText.shift,
                                                16.w,
                                                AppColor.deepPurple,
                                                FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Flexible(
                                child: provider.isLoading
                                    ? const CircularProgressIndicator()
                                    : ListView.builder(
                                        itemCount:
                                            provider.rateChatModelList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var item =
                                              provider.rateChatModelList[index];
                                          return GestureDetector(
                                            onTap: () {
                                              provider.id = item.id.toString();
                                              provider.initData(context, item);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditRateChart()));
                                            },
                                            onLongPress: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        Text(itemText.delete),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                              itemText.no)),
                                                      TextButton(
                                                          onPressed: () async {
                                                            var response =
                                                                await provider
                                                                    .DeleteRateChart(item
                                                                        .id
                                                                        .toString());
                                                            if (response[
                                                                    'success'] ==
                                                                true) {
                                                              provider
                                                                  .GetRateChartData();
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
                                                        width: 80.w,
                                                        child: buildText(
                                                            item.rateCode
                                                                .toString(),
                                                            16.w,
                                                            AppColor.black,
                                                            FontWeight.w400)),
                                                    SizedBox(
                                                        width: 100.w,
                                                        child: buildText(
                                                            item.shDate
                                                                .toString(),
                                                            16.w,
                                                            AppColor.black,
                                                            FontWeight.w400)),
                                                    SizedBox(
                                                        width: 80.w,
                                                        child: buildText(
                                                            shiftsInput(context)[item
                                                                    .shift
                                                                    .toString()] ??
                                                                item.shift
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
                              )
                            ],
                          )));
      },
    );
  }
}
