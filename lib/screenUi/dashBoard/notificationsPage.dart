import '../../all_import.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppBodyColor.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Center(
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        color: AppBodyColor.blueGrey,
                        borderRadius: BorderRadius.circular(4)),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        },
                        child: Icon(Icons.arrow_back, size: 30.h)),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                buildText(
                    "Notifications", 24.w, AppColor.white, FontWeight.w500),
              ],
            ),
            SizedBox(
              height: 24.w,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.15,
                decoration: BoxDecoration(
                    color: AppBodyColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      prefixIcon: Icon(Icons.search, color: Colors.black26),
                      hintText: "   Search Leaderboard",
                      helperStyle: TextStyle(color: Colors.black26)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14.w,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "You hove ",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "3 Notifications ",
                      style: TextStyle(
                          color: AppColor.yellow,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "today.",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w500)),
                ])),
              ],
            ),
            SizedBox(
              height: 18.w,
            ),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("Assets/new/Ellipse 2.png"),
                          radius: 24.w,
                        ),
                        title: buildText(
                            "Lachiano", 18.w, AppColor.white, FontWeight.w500),
                        subtitle: buildText("045- Favourites- 2 h ago", 16.w,
                            AppColor.white, FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: buildText(
                            "Lorem ipsum dolor sit amet consectetur. Posuere placerat fringilla purus eget fermentum.",
                            12.w,
                            AppColor.white,
                            FontWeight.w400),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 12,
                        endIndent: 12,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 12.w,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                buildText("This Week", 20.w, AppColor.white, FontWeight.w500),
              ],
            ),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("Assets/new/Ellipse 2.png"),
                          radius: 24.w,
                        ),
                        title: buildText(
                            "Lachiano", 18.w, AppColor.white, FontWeight.w500),
                        subtitle: buildText("045- Favourites- 2 h ago", 16.w,
                            AppColor.white, FontWeight.w400),
                      ),
                      Divider(
                        thickness: 2,
                        indent: 12,
                        endIndent: 12,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
          ]),
        ),
      ),
    ));
  }
}
