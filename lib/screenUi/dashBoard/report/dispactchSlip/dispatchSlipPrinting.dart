import 'package:milkdairy/all_import.dart';

class dispatchSlipPrint extends StatelessWidget {
  DispatchModelData dispatchSowData;

  dispatchSlipPrint({Key? key, required this.dispatchSowData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Main_Theme.mainTheme(
        color: AppBodyColor.backGro,
        actionwiget: const SizedBox(),
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.dispatchSlip,
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
                      child: buildText(
                          itemText.id, 18.w, AppColor.black, FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.id.toString(), 16.w,
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
                      child: buildText(itemText.milkType, 18.w, AppColor.black,
                          FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.milkType.toString(), 16.w,
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
                      child: buildText(itemText.shift, 18.w, AppColor.black,
                          FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
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
                                      dispatchSowData.shift.toString()] ??
                                  dispatchSowData.shift.toString(),
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
                      child: buildText(itemText.tankerCan, 18.w, AppColor.black,
                          FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.totalCan.toString(), 16.w,
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
                      child: buildText(itemText.tankerQty, 18.w, AppColor.black,
                          FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.totalQty.toString(), 16.w,
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
                      child: buildText(
                          itemText.fat, 18.w, AppColor.black, FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.fat.toString(), 16.w,
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
                      child: buildText(itemText.tankerNo, 18.w, AppColor.black,
                          FontWeight.w400)),
                  Container(
                    height: 40.w,
                    width: 180.w,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(dispatchSowData.tankerNo.toString(), 16.w,
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PrintingDispatch(PrintingData: dispatchSowData),
                      ));
                },
                child: buildContainer(50.h, MediaQuery.of(context).size.width,
                    AppBodyColor.blue, itemText.printing, AppColor.white),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ));
    ;
  }
}
