import 'package:milkdairy/all_import.dart';

class MilkSlipPrint extends StatelessWidget {
  MilkSlipModelData milkShowData;

  MilkSlipPrint({Key? key, required this.milkShowData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Main_Theme.mainTheme(
        color: AppBodyColor.backGro,
        actionwiget: SizedBox(),
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.milkSlip,
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
                      child: buildText("${itemText.farmer} ${itemText.id}",
                          18.w, AppColor.black, FontWeight.w400)),
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
                          buildText(milkShowData.userUniId.toString(), 16.w,
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
                          buildText(milkShowData.milkType.toString(), 16.w,
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
                          itemText.qty, 18.w, AppColor.black, FontWeight.w400)),
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
                          buildText(milkShowData.qty.toString(), 16.w,
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
                          buildText(milkShowData.fat.toString(), 16.w,
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
                          itemText.snf, 18.w, AppColor.black, FontWeight.w400)),
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
                          buildText(milkShowData.snf.toString(), 16.w,
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
                          itemText.clr, 18.w, AppColor.black, FontWeight.w400)),
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
                          buildText(milkShowData.clr.toString(), 16.w,
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
                        border: Border.fromBorderSide(BorderSide.none),
                        color: AppBodyColor.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildText(milkShowData.amt.toString(), 16.w,
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
                      child: buildText(itemText.amount, 18.w, AppColor.black,
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
                          buildText(milkShowData.totalAmount.toString(), 16.w,
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
                            PrintingMilkSlip(PrintingData: milkShowData),
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
