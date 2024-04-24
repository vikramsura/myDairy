import 'package:milkdairy/all_import.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemText = AppLocalizations.of(context)!;
    return Main_Theme.mainTheme(
        color: AppBodyColor.deepPurple,
        actionwiget: SizedBox(),
        width: MediaQuery.of(context).size.width,
        icononpress: () {
          Navigator.pop(context);
        },
        pageName: itemText.about,
        widget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(
                  itemText.myDairy, 20.w, AppColor.white, FontWeight.w500),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage('Assets/about/Description.png')),
                  buildText(itemText.description, 18.w, AppColor.yellow,
                      FontWeight.w500),
                  SizedBox(
                    width: 24.w,
                  ),
                  buildText(
                      itemText.rateUs, 18.w, AppColor.yellow, FontWeight.w500),
                  Image(image: AssetImage('Assets/about/Rate.png')),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              buildText(
                  itemText.aboutList, 14.w, AppColor.white, FontWeight.w400),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Image(image: AssetImage('Assets/about/http.png')),
                  SizedBox(
                    width: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      _launchSite();
                    },
                    child: buildText("https://akshayanidhi-projects.com", 16.w,
                        AppColor.white, FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 14.w,
              ),
              Row(
                children: [
                  Image(image: AssetImage('Assets/about/http.png')),
                  SizedBox(
                    width: 10.h,
                  ),
                  buildText(
                      "Privacy Policy", 16.w, AppColor.white, FontWeight.w400),
                  InkWell(
                    onTap: () => _launchURL(),
                    child: buildText(
                      " - Click Here",
                      16.w,
                      AppColor.yellow,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14.w,
              ),
              Row(
                children: [
                  Image(image: AssetImage('Assets/about/ProDescri.png')),
                  SizedBox(
                    width: 10.h,
                  ),
                  buildText("Akshayanidhi. Digital", 18.w, AppColor.white,
                      FontWeight.w500),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Image(
                  image: AssetImage('Assets/about/aboutImage.jpg'),
                  height: 130.h),
            ],
          ),
        ));
  }

  _launchURL() async {
    const url = 'https://mydairy.tech/privacy-policy';
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchSite() async {
    const url = 'https://akshayanidhi-projects.com/';
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
