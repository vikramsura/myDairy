import 'package:milkdairy/all_import.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;

    return Main_Theme.mainTheme(
        actionwiget: SizedBox(),
        color: AppBodyColor.backGro,
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.changeLanguage,
        widget: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border(bottom: BorderSide())),
              child: InkWell(
                onTap: () {
                  MyApp.of(context)
                      ?.setLocale(Locale.fromSubtags(languageCode: 'en'));

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                      (route) => false);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text("English", style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45.h,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border(bottom: BorderSide())),
              child: InkWell(
                onTap: () {
                  MyApp.of(context)
                      ?.setLocale(Locale.fromSubtags(languageCode: 'hi'));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                      (route) => false);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text("हिंदी", style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
