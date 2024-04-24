import 'package:milkdairy/all_import.dart';

class ItemList extends StatelessWidget {
  ItemList({
    Key? key,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;
        return Main_Theme.mainTheme(
            actionwiget: const SizedBox(),
            color: AppBodyColor.white,
            width: MediaQuery.of(context).size.width,
            icononpress: () {
              Navigator.pop(context);
            },
            pageName: itemText.item,
            widget: provider.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppBodyColor.deepPurple,
                    ),
                  )
                : provider.itemList.isEmpty
                    ? Center(child: Text(itemText.notDataFound))
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
                                      width: 80.w,
                                      child: buildText(
                                          itemText.code,
                                          16.w,
                                          AppColor.deepPurple,
                                          FontWeight.w500)),
                                  SizedBox(
                                      width: 120.w,
                                      child: buildText(
                                          itemText.name,
                                          16.w,
                                          AppColor.deepPurple,
                                          FontWeight.w500)),
                                  SizedBox(
                                      width: 60.w,
                                      child: buildText(
                                          itemText.milk,
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
                          ListView.builder(
                              itemCount: provider.itemList.length,
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = provider.itemList[index];
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                            width: 80.w,
                                            child: buildText(
                                                item.id.toString(),
                                                16.w,
                                                AppColor.black,
                                                FontWeight.w500)),
                                        SizedBox(
                                            width: 120.w,
                                            child: buildText(
                                                item.item.toString(),
                                                16.w,
                                                AppColor.black,
                                                FontWeight.w500)),
                                        item.status == 1
                                            ? SizedBox(
                                                width: 60.w,
                                                child: buildText(
                                                    "Yes",
                                                    16.w,
                                                    AppColor.green,
                                                    FontWeight.w500))
                                            : SizedBox(
                                                width: 60.w,
                                                child: buildText(
                                                    "No",
                                                    16.w,
                                                    AppColor.red,
                                                    FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ],
                      ));
      },
    );
  }
}
