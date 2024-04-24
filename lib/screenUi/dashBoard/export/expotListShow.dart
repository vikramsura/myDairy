import 'package:milkdairy/all_import.dart';

class ExportShowList extends StatelessWidget {
  ExportModelData export;

  ExportShowList({Key? key, required this.export}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Consumer<ExportProvider>(
      builder: (context, provider, child) {
        return Main_Theme.mainTheme(
            color: AppBodyColor.white,
            actionwiget: const SizedBox(),
            width: MediaQuery.of(context).size.width,
            icononpress: () {
              Navigator.pop(context);
            },
            pageName: itemText.export,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.adminID, 18.w,
                              AppColor.black, FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.adminId, 16.w, AppColor.black,
                                  FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.name, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.users?.name.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.dairyName, 18.w,
                              AppColor.black, FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(UserDetails.userDairyName.toString(),
                                  16.w, AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.shift.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.route + " " + itemText.id,
                              18.w, AppColor.black, FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.routeId.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.milkType, 18.w,
                              AppColor.black, FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(
                                  shiftsInput(context)[
                                          export.milkType.toString()] ??
                                      export.milkType.toString(),
                                  16.w,
                                  AppColor.black,
                                  FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.qty, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.qty.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.fat, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.fat.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.snf, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.snf.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.clr, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.clr.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.rate, 18.w, AppColor.black,
                              FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.snf.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100.w,
                          child: buildText(itemText.amount, 18.w,
                              AppColor.black, FontWeight.w400)),
                      Container(
                        height: 40.w,
                        width: 180.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: AppBodyColor.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(export.snf.toString(), 16.w,
                                  AppColor.black, FontWeight.w400),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
