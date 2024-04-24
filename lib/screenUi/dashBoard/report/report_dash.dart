import 'package:milkdairy/all_import.dart';

class ReportDashBoard extends StatelessWidget {
  ReportDashBoard({
    Key? key,
  }) : super(key: key);

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
        pageName: itemText.report,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24.w,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FarmerListReport()));
                      },
                      child: buildCard(
                          itemText.farmer, "Assets/report/farmer.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MilkSlip()));
                      },
                      child: buildCard(
                          itemText.milkSlip, "Assets/report/milkSlip.png"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PurchaseSummary()));
                      },
                      child: buildCard(itemText.purchaseSummary,
                          "Assets/report/farm_mi_repo.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MilkBill()));
                      },
                      child: buildCard(itemText.farmerMilkBill,
                          "Assets/report/far_mil_bill.png"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisMilkSlip()));
                      },
                      child: buildCard(
                          itemText.dispatchSlip, "Assets/report/dis_slip.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisReport()));
                      },
                      child: buildCard(itemText.dispatchReport,
                          "Assets/report/dis_repo.png"),
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
  }
}
