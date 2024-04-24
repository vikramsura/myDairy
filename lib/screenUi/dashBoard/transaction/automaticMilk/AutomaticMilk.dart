import 'package:milkdairy/all_import.dart';

class AutomaticMilk extends StatefulWidget {
  const AutomaticMilk({Key? key}) : super(key: key);

  @override
  State<AutomaticMilk> createState() => _AutomaticMilkState();
}

class _AutomaticMilkState extends State<AutomaticMilk> {
  @override
  void initState() {
    Provider.of<AutomaticProvider>(context, listen: false).getInitDate();
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
            pageName: itemText.automaticMilkCollection,
            widget: Column(
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
                        child: buildText(itemText.date, 18.w, AppColor.black,
                            FontWeight.w400)),
                    Container(
                      height: 40.w,
                      width: 180.w,
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
                            contentPadding:
                                EdgeInsets.only(bottom: 10, top: 10, left: 20),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                        width: 100.w,
                        child: buildText(itemText.shift, 18.w, AppColor.black,
                            FontWeight.w400)),
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
                                    bottom: 10, top: 10, left: 20, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10))),
                            child: DropdownButtonHideUnderline(
                                child: provider.GetShift(context)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.w,
                ),
                InkWell(
                  onTap: () {
                    if (provider.dateControler.text.trim().isEmpty) {
                      snackMessage(
                          context, "${itemText.pleaseEnter} ${itemText.date}");
                    } else if (provider.shift.toString() == itemText.select ||
                        provider.shift.toString().isEmpty ||
                        provider.shift == null) {
                      snackMessage(
                          context, "${itemText.pleaseEnter} ${itemText.shift}");
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubmitAutomaticMilk(),
                          ));
                    }
                  },
                  child: buildContainer(50.h, MediaQuery.of(context).size.width,
                      AppBodyColor.blue, itemText.submit, AppColor.white),
                )
              ],
            )),
      );
    });
  }
}
