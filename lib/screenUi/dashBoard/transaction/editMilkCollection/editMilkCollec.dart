import 'package:milkdairy/all_import.dart';

class editMilkPage extends StatefulWidget {
  const editMilkPage({Key? key}) : super(key: key);

  @override
  State<editMilkPage> createState() => _editMilkPageState();
}

class _editMilkPageState extends State<editMilkPage> {
  void initState() {
    Provider.of<AutomaticProvider>(context, listen: false).GetItemData();
    Provider.of<AutomaticProvider>(context, listen: false).GetFarmerListsData();
    Provider.of<AutomaticProvider>(context, listen: false).GetSummaryList();

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
              provider.isEdit = true;
              provider.dataclean();
            },
            child: Main_Theme.mainTheme(
                actionwiget: Row(
                  children: [
                    provider.isEdit == true
                        ? GestureDetector(
                            onTap: () {
                              provider.changeEdit(false);
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              provider.changeEdit(true);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
                color: AppBodyColor.backGro,
                width: MediaQuery.of(context).size.width,
                icononpress: () {
                  provider.isEdit = true;
                  provider.dataclean();
                  Navigator.pop(context);
                },
                pageName: itemText.editMilkCollection,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(itemText.dairyName, 14.w,
                                  AppColor.black, FontWeight.w400)),
                          Container(
                            height: 40.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              readOnly: true,
                              style: TextStyle(
                                  fontSize: 14.w,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w400),
                              controller: provider.nameControler,
                              decoration: InputDecoration(
                                  hintText: itemText.dairyName,
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
                        height: 16.w,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(itemText.date, 14.w,
                                  AppColor.black, FontWeight.w400)),
                          Container(
                            height: 40.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              readOnly: provider.isEdit,
                              style: TextStyle(
                                  fontSize: 14.w,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w400),
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
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  suffixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  hintText: "****/**/**"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(itemText.shift, 14.w,
                                  AppColor.black, FontWeight.w400)),
                          Container(
                            height: 40.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: provider.isEdit
                                ? TextField(
                                    readOnly: provider.isEdit,
                                    style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w400),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: provider.shift,
                                        hintStyle: TextStyle(
                                            fontSize: 14.w,
                                            color: AppColor.black,
                                            fontWeight: FontWeight.w400),
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
                                  )
                                : FormField(
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
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(itemText.sampleNo, 14.w,
                                  AppColor.black, FontWeight.w400)),
                          Container(
                            height: 40.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              readOnly: true,
                              style: TextStyle(
                                  fontSize: 14.w,
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w400),
                              controller: provider.sampleControler,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: itemText.sampleNo,
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
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(
                                  "${itemText.farmer} ${itemText.name}",
                                  14.w,
                                  AppColor.black,
                                  FontWeight.w400)),
                          Container(
                            height: 45.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: provider.isEdit
                                ? TextField(
                                    readOnly: provider.isEdit,
                                    style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w400),
                                    controller: provider.farmerControler,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: itemText.farmer,
                                        contentPadding: const EdgeInsets.only(
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
                                  )
                                : FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  bottom: 10,
                                                  top: 10,
                                                  right: 10),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                value: provider.myFarmerList ??
                                                    itemText.select,
                                                style: TextStyle(
                                                    fontSize: 14.w,
                                                    color: AppColor.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                onChanged: (newValue) {
                                                  provider
                                                      .changeFarmer(newValue);
                                                },
                                                items: [
                                                  DropdownMenuItem(
                                                    child: Text(provider
                                                        .dataList[0].userUniId
                                                        .toString()),
                                                    value: itemText.select,
                                                  ),
                                                  ...provider.FarmerList.map(
                                                      (item) {
                                                    return DropdownMenuItem(
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
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: 130.w,
                              child: buildText(itemText.milkType, 14.w,
                                  AppColor.black, FontWeight.w400)),
                          Container(
                            height: 40.w,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: AppBodyColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: provider.isEdit
                                ? TextField(
                                    readOnly: provider.isEdit,
                                    style: TextStyle(
                                        fontSize: 14.w,
                                        color: AppColor.black,
                                        fontWeight: FontWeight.w400),
                                    controller: provider.milkController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: itemText.milkType,
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
                                  )
                                : FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 10, bottom: 10, right: 10),
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
                                              value: provider.myItemList
                                                  ?.toString(),
                                              style: TextStyle(
                                                  fontSize: 14.w,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w400),
                                              onChanged: (newValue) {
                                                provider.changeItem(newValue);
                                              },
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text(provider
                                                      .dataList[0].milkType
                                                      .toString()),
                                                  value: itemText.select,
                                                ),
                                                ...provider.itemList
                                                    .map((item) {
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
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.fat, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.fatControler,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.fat,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.snf, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.snfController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.snf,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                        ],
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.qty, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.qtyControler,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.qty,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.clr, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.clrController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.clr,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                        ],
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.rate, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.rateControler,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.rate,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 60.w,
                                  child: buildText(itemText.amount, 14.w,
                                      AppColor.black, FontWeight.w400)),
                              Container(
                                height: 40.w,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    color: AppBodyColor.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  readOnly: provider.isEdit,
                                  style: TextStyle(
                                      fontSize: 14.w,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400),
                                  controller: provider.amountControler,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: itemText.amount,
                                      contentPadding: EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 4,
                                          right: 4),
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
                        ],
                      ),
                      SizedBox(
                        height: 40.w,
                      ),
                      provider.isEdit
                          ? SizedBox()
                          : InkWell(
                              onTap: () {
                                if (provider.nameControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.name}");
                                } else if (provider.dateControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.date}");
                                } else if (provider.sampleControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.sampleNo}");
                                } else if (provider.myFarmerList.toString() ==
                                        itemText.select ||
                                    provider.myFarmerList.toString().isEmpty ||
                                    provider.myFarmerList == null) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.farmer} ${itemText.name}");
                                } else if (provider.myItemList.toString() ==
                                        itemText.select ||
                                    provider.myItemList.toString().isEmpty ||
                                    provider.myItemList == null) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.milkType}");
                                } else if (provider.fatControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.fat}");
                                } else if (provider.snfController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.snf}");
                                } else if (provider.qtyControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.qty}");
                                } else if (provider.clrController.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.clr}");
                                } else if (provider.rateControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.rate}");
                                } else if (provider.amountControler.text
                                    .trim()
                                    .isEmpty) {
                                  snackMessage(context,
                                      "${itemText.pleaseEnter} ${itemText.amount}");
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: AppBodyColor.white,
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.w),
                                              borderSide: BorderSide.none),
                                          actions: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 28.w,
                                                ),
                                                Image(
                                                    image: AssetImage(
                                                        "Assets/new/manualMilkColl.png")),
                                                SizedBox(
                                                  height: 28.w,
                                                ),
                                                buildText(
                                                    itemText.save,
                                                    18.w,
                                                    AppColor.black,
                                                    FontWeight.w500),
                                                SizedBox(
                                                  height: 28.w,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        try {
                                                          var response =
                                                              await provider
                                                                  .EditMilkCollection();
                                                          if (response[
                                                                  'success'] ==
                                                              true) {
                                                            provider.isEdit =
                                                                true;
                                                            String
                                                                sharedContent =
                                                                '''

      Dairy Name: ${provider.nameControler.text}
      Date: ${provider.dateControler.text}
      Shift: ${provider.shift}
      Sample No: ${provider.sampleControler.text}
      Farmer Name: ${provider.myFarmerList}
      Milk type: ${provider.myItemList} 
      Fat: ${provider.fatControler.text}
      Snf: ${provider.snfController.text}   
      Qty(Lt): ${provider.qtyControler.text}
      Clr: ${provider.clrController.text}
      Rate: ${provider.rateControler.text}
      Amount: ${provider.amountControler.text}

    
    ''';
                                                            await Share.share(
                                                                sharedContent);
                                                            provider
                                                                .GetSummaryList();
                                                            provider
                                                                .dataclean();
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                            snackMessage(
                                                                context,
                                                                response[
                                                                    'message'],
                                                                no: 2);
                                                          } else if (response[
                                                                  'success'] ==
                                                              false) {
                                                            Navigator.pop(
                                                                context);
                                                            snackMessage(
                                                                context,
                                                                response[
                                                                    'message']);
                                                          }
                                                        } catch (e) {
                                                          snackMessage(context,
                                                              e.toString());
                                                        }
                                                      },
                                                      child: buildContainer(
                                                          40.w,
                                                          100.w,
                                                          AppBodyColor.blue,
                                                          itemText.oK,
                                                          AppColor.white),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: buildContainer(
                                                          40.w,
                                                          100.w,
                                                          AppBodyColor.blue,
                                                          itemText.cANCEL,
                                                          AppColor.white),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      }); // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                                }
                              },
                              child: buildContainer(
                                  loading: provider.isLoading,
                                  50.h,
                                  MediaQuery.of(context).size.width,
                                  AppBodyColor.blue,
                                  itemText.submit,
                                  AppColor.white),
                            ),
                      SizedBox(
                        height: 40.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildInkWellSummary(
                              context: context,
                              itemText: itemText,
                              provider: provider),
                        ],
                      ),
                      SizedBox(
                        height: 40.w,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
