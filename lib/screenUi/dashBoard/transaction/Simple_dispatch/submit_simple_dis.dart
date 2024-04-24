import 'package:milkdairy/all_import.dart';

class SubmitSimpleDis extends StatefulWidget {
  const SubmitSimpleDis({super.key});

  @override
  State<SubmitSimpleDis> createState() => _SubmitSimpleDisState();
}

class _SubmitSimpleDisState extends State<SubmitSimpleDis> {
  @override
  void initState() {
    Provider.of<AutomaticProvider>(context, listen: false).GetItemData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AutomaticProvider>(builder: (context, provider, child) {
      var itemText = AppLocalizations.of(context)!;

      return PopScope(
          onPopInvoked: (didPop) {
            provider.dataclean();
          },
          child: Main_Theme.mainTheme(
              actionwiget: SizedBox(),
              color: AppBodyColor.backGro,
              width: MediaQuery.of(context).size.width,
              icononpress: () {
                provider.dataclean();
                Navigator.pop(context);
              },
              pageName: itemText.simpleDispatch,
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100.w,
                            child: buildText(itemText.milkType, 14.w,
                                AppColor.black, FontWeight.w400)),
                        Container(
                          height: 40.w,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: FormField(
                            builder: (FormFieldState<dynamic> field) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 10,
                                        left: 5),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: itemText.milkType,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: provider.myItemList?.toString() ??
                                          itemText.select,
                                      style: TextStyle(
                                          fontSize: 14.w,
                                          color: AppColor.black,
                                          fontWeight: FontWeight.w400),
                                      onChanged: (newValue) {
                                        provider.changeItem(newValue);
                                      },
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(itemText.select),
                                          value: itemText.select,
                                        ),
                                        ...provider.itemList.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              item.item.toString(),
                                            ),
                                            value: item.id.toString(),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100.w,
                            child: buildText(
                                itemText.total + " " + itemText.can,
                                14.w,
                                AppColor.black,
                                FontWeight.w400)),
                        Container(
                          height: 40.w,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: provider.totalCanController,
                            style: TextStyle(
                                fontSize: 14.w,
                                color: AppColor.black,
                                fontWeight: FontWeight.w400),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: itemText.total + " " + itemText.can,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 20, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100.w,
                            child: buildText(
                                itemText.total + " " + itemText.qty,
                                14.w,
                                AppColor.black,
                                FontWeight.w400)),
                        Container(
                          height: 40.w,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: provider.totalQtyController,
                            style: TextStyle(
                                fontSize: 14.w,
                                color: AppColor.black,
                                fontWeight: FontWeight.w400),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: itemText.total + " " + itemText.qty,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 20, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100.w,
                            child: buildText(itemText.fat, 14.w, AppColor.black,
                                FontWeight.w400)),
                        Container(
                          height: 40.w,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: provider.fatControler,
                            style: TextStyle(
                                fontSize: 14.w,
                                color: AppColor.black,
                                fontWeight: FontWeight.w400),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: itemText.fat,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 20, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 100.w,
                            child: buildText(itemText.tankerNo, 14.w,
                                AppColor.black, FontWeight.w400)),
                        Container(
                          height: 40.w,
                          width: 180.w,
                          decoration: BoxDecoration(
                              color: AppBodyColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: provider.tankerNoController,
                            style: TextStyle(
                                fontSize: 14.w,
                                color: AppColor.black,
                                fontWeight: FontWeight.w400),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: itemText.tankerNo,
                                contentPadding: EdgeInsets.only(
                                    bottom: 10, top: 10, left: 20, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.w,
                    ),
                    InkWell(
                      onTap: () async {
                        if (provider.myItemList.toString() == itemText.select ||
                            provider.myItemList.toString().isEmpty ||
                            provider.myItemList == null) {
                          snackMessage(context,
                              "${itemText.pleaseEnter} ${itemText.milkType}");
                        } else if (provider.totalCanController.text
                            .trim()
                            .isEmpty) {
                          snackMessage(context,
                              "${itemText.pleaseEnter} ${itemText.tankerNo} ${itemText.can}");
                        } else if (provider.totalQtyController.text
                            .trim()
                            .isEmpty) {
                          snackMessage(context,
                              "${itemText.pleaseEnter} ${itemText.total} ${itemText.qty}");
                        } else if (provider.fatControler.text.trim().isEmpty) {
                          snackMessage(context,
                              "${itemText.pleaseEnter} ${itemText.fat}");
                        } else if (provider.tankerNoController.text
                            .trim()
                            .isEmpty) {
                          snackMessage(context,
                              "${itemText.pleaseEnter} ${itemText.tankerNo}");
                        } else {
                          var response = await provider.AddSimpleDispatch();
                          if (response["success"] == true) {
                            provider.dataclean();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            snackMessage(context, response["message"], no: 2);
                          } else if (response["success"] == false) {
                            snackMessage(context, response["message"]);
                          }
                        }
                      },
                      child: buildContainer(
                          loading: provider.isLoading,
                          50.h,
                          MediaQuery.of(context).size.width,
                          AppBodyColor.blue,
                          itemText.submit,
                          AppColor.white),
                    )
                  ],
                ),
              )));
    });
  }
}
