import 'package:milkdairy/all_import.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void getLoginData() async {
    await LocalDataSaver.getUserLogin().then((value) async {
      if (value == true) {
        await getUserDetails();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoard(),
              ));
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/new/Splash.png'), fit: BoxFit.cover)),
    ));
  }
}
