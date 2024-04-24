import 'package:milkdairy/all_import.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    Provider.of<ProfProviderPage>(context, listen: false)
        .checkAuthToken(context);
    Provider.of<ProfProviderPage>(context, listen: false).GetProfileData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Main_ThemeHome.mainTheme(context,
        actionWidget: IconButton(
            onPressed: () {
              Provider.of<ProfProviderPage>(context, listen: false)
                  .checkAuthToken(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ));
            },
            icon: CircleAvatar(
                backgroundColor: AppBodyColor.white,
                radius: 20.w,
                child: ImageIcon(
                    size: 30.h, const AssetImage("Assets/new/settings.png")))),
        width: MediaQuery.of(context).size.width,
        widgets: Container(
            width: 100.w,
            height: 20.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: (UserDetails.parentId == null)
                    ? CircularProgressIndicator(
                        color: Colors.blue,
                      )
                    : Text(
                        UserDetails.parentId!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Master()));
                      },
                      child: buildCard(AppLocalizations.of(context)!.master,
                          "Assets/dashBord/master.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Transaction()));
                      },
                      child: buildCard(
                          AppLocalizations.of(context)!.transaction,
                          "Assets/dashBord/transaction.png"),
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
                                builder: (context) => ExportList()));
                      },
                      child: buildCard(AppLocalizations.of(context)!.export,
                          "Assets/dashBord/export.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportDashBoard()));
                      },
                      child: buildCard(AppLocalizations.of(context)!.report,
                          "Assets/dashBord/report.png"),
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
                                builder: (context) => HelpPage()));
                      },
                      child: buildCard(AppLocalizations.of(context)!.help,
                          "Assets/dashBord/help.png"),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()));
                      },
                      child: buildCard(AppLocalizations.of(context)!.about,
                          "Assets/dashBord/aboutus.png"),
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
