import 'package:milkdairy/all_import.dart';
import 'package:milkdairy/provider/dashBoardProvider/masterProvider/driverProvider.dart';
import 'package:milkdairy/screenUi/dashBoard/master/driverList/driverList.dart';

class Master extends StatelessWidget {
  Master({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RateChartProvider>(
      builder: (context, value, child) {
        return Main_Theme.mainTheme(
            actionwiget: const SizedBox(),
            color: AppBodyColor.grey,
            width: MediaQuery.of(context).size.width,
            icononpress: () {
              Navigator.pop(context);
            },
            pageName: AppLocalizations.of(context)!.master,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              Provider.of<FarmerProvier>(context, listen: false)
                                  .GetFarmerListsData();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FARmerList()));
                            },
                            child: buildCard(
                                AppLocalizations.of(context)!.farmer,
                                "Assets/master/farmer.png")),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<RateChartProvider>(context,
                                    listen: false)
                                .GetRateChartData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RateList()));
                          },
                          child: buildCard(AppLocalizations.of(context)!.rate,
                              "Assets/master/rateChart.png"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<HardwareProvider>(context,
                                    listen: false)
                                .GetHardwareListData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HardWareList()));
                          },
                          child: buildCard(
                              AppLocalizations.of(context)!.hardware,
                              "Assets/master/hardware.png"),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<ItemProvider>(context, listen: false)
                                .GetItemData();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemList()));
                          },
                          child: buildCard(AppLocalizations.of(context)!.item,
                              "Assets/master/itemList.png"),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<MilkRateDeductionProvider>(context,
                                  listen: false)
                              .GetMilkDeduction();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MilkDeduction()));
                        },
                        child: buildCard(
                            AppLocalizations.of(context)!.milkRateDeduction,
                            "Assets/master/milkRateDe.png"),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<DriverProvider>(context, listen: false)
                              .GetDriverData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DriverList()));
                        },
                        child: buildCard(
                            AppLocalizations.of(context)!.driverList,
                            "Assets/master/driverList.png"),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
