import 'package:milkdairy/all_import.dart';

class editMilkcollectio extends StatefulWidget {
  const editMilkcollectio({Key? key}) : super(key: key);

  @override
  State<editMilkcollectio> createState() => _editMilkcollectioState();
}

class _editMilkcollectioState extends State<editMilkcollectio> {
  @override
  void initState() {
    Provider.of<AutomaticProvider>(context, listen: false).GetFarmerListsData();
    Provider.of<AutomaticProvider>(context, listen: false).getInitDate();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AutomaticProvider>(
      builder: (context, provider, child) {
        var itemText = AppLocalizations.of(context)!;

        return PopScope(
            onPopInvoked: (didPop) {
              provider.dataclean();
            },
            child: provider.isLoading
                ? Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(
                      color: AppColor.deepPurple,
                    )),
                  )
                : Main_Theme.mainTheme(
                    actionwiget: SizedBox(),
                    color: AppBodyColor.backGro,
                    width: MediaQuery.of(context).size.width,
                    icononpress: () {
                      provider.dataclean();
                      Navigator.pop(context);
                    },
                    pageName: itemText.editMilkCollection,
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
                                  width: 120.w,
                                  child: buildText(itemText.date, 18.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  readOnly: true,
                                  onTap: () async {
                                    var date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now());
                                    provider.dateControler.text =
                                        date.toString().substring(0, 10);
                                  },
                                  controller: provider.dateControler,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 20,
                                          right: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      suffixIcon: Icon(
                                        Icons.calendar_month_outlined,
                                      ),
                                      hintText: "yyyy/mm/dd"),
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
                                  width: 120.w,
                                  child: buildText(itemText.shift, 18.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: FormField(
                                  builder: (FormFieldState<dynamic> field) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10,
                                              top: 10,
                                              left: 20,
                                              right: 10),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: DropdownButtonHideUnderline(
                                          child: provider.GetShift(context)),
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
                                  width: 120.w,
                                  child: buildText(
                                      itemText.farmer + " " + itemText.name,
                                      18.w,
                                      AppColor.black,
                                      FontWeight.w400)),
                              Container(
                                height: 45.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: FormField(
                                  builder: (FormFieldState<dynamic> field) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                bottom: 10, top: 10, right: 10),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
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
                                              value: provider.myFarmerList ??
                                                  itemText.select,
                                              style: TextStyle(
                                                  fontSize: 14.w,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w400),
                                              onChanged: (newValue) {
                                                provider.changeFarmer(newValue);
                                              },
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text(itemText.select),
                                                  value: itemText.select,
                                                ),
                                                ...provider.FarmerList.map(
                                                    (item) {
                                                  return new DropdownMenuItem(
                                                    child: new Text(
                                                        item.name.toString(),
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .black)),
                                                    value: item.userUniId
                                                        .toString(),
                                                  );
                                                }).toList()
                                              ],
                                            ),
                                          ),
                                        ));
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
                                  width: 120.w,
                                  child: buildText(itemText.sampleNo, 18.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 150.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: provider.sampleControler,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.sampleNo,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 20,
                                          right: 10),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.w,
                          ),
                          InkWell(
                            onTap: () async {
                              if (provider.dateControler.text.trim().isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.date}");
                              } else if (provider.shift.toString() ==
                                      itemText.select ||
                                  provider.shift.toString().isEmpty ||
                                  provider.shift == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.farmer} ${itemText.name}");
                              } else if (provider.myFarmerList.toString() ==
                                      itemText.select ||
                                  provider.myFarmerList.toString().isEmpty ||
                                  provider.myFarmerList == null) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.farmer} ${itemText.name}");
                              } else if (provider
                                  .sampleControler.text.isEmpty) {
                                snackMessage(context,
                                    "${itemText.pleaseEnter} ${itemText.sampleNo}");
                              } else {
                                var responses =
                                    await provider.GetMilkCollectionList();
                                if (responses["success"] == true &&
                                    responses["data"] != null &&
                                    responses["data"].isNotEmpty) {
                                  snackMessage(context, responses["message"],
                                      no: 2);
                                  MilkCollectionModle newModle =
                                      MilkCollectionModle.fromJson(responses);
                                  provider.dataList = newModle.data!;
                                  Provider.of<AutomaticProvider>(context,
                                          listen: false)
                                      .intadd(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => editMilkPage(),
                                      ));
                                } else if (responses['success'] == false) {
                                  snackMessage(context, responses['message']);
                                } else if (responses["data"] == null) {
                                  snackMessage(context, itemText.invalid);
                                } else if (responses["data"].isEmpty) {
                                  snackMessage(context, itemText.invalid);
                                }
                              }
                            },
                            child: buildContainer(
                                50.h,
                                MediaQuery.of(context).size.width,
                                AppBodyColor.blue,
                                itemText.submit,
                                AppColor.white),
                          )
                        ],
                      ),
                    )));
      },
    );
  }
}
