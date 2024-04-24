import 'package:milkdairy/all_import.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Main_Theme.mainTheme(
        actionwiget: SizedBox(),
        color: AppBodyColor.grey,
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.transaction,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AutomaticMilk()));
                        },
                        child: buildCard(itemText.automaticMilkCollection,
                            "Assets/transaction/automatic.png")),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManualMilkCollection()));
                      },
                      child: buildCard(itemText.manualMilkCollection,
                          "Assets/transaction/manual.png"),
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
                                builder: (context) => editMilkcollectio()));
                      },
                      child: buildCard(itemText.editMilkCollection,
                          "Assets/transaction/edit_milk.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SimpleDispatch()));
                      },
                      child: buildCard(itemText.simpleDispatch,
                          "Assets/transaction/simple_dis.png"),
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
