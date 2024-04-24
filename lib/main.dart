import 'package:milkdairy/provider/dashBoardProvider/masterProvider/driverProvider.dart';
import 'package:milkdairy/provider/dashBoardProvider/settingsProvider/choosePlanProvider.dart';

import 'all_import.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print(message.notification!.title);
// }
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  getData() async {
    await getUserDetails();
    _locale = Locale(UserDetails.userLang ?? "en");
    setState(() {});
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  late Locale _locale = const Locale("en");

  void setLocale(Locale value) async {
    _locale = value;
    LocalDataSaver.setUserLang(value.languageCode);
    await getUserDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HardwareProvider()),
        ChangeNotifierProvider(create: (context) => HardwareSettingsProvider()),
        ChangeNotifierProvider(create: (context) => printerProvider()),
        ChangeNotifierProvider(create: (context) => RateCalculateProvider()),
        ChangeNotifierProvider(create: (context) => ProfProviderPage()),
        ChangeNotifierProvider(create: (context) => SecProvider()),
        ChangeNotifierProvider(create: (context) => ReportProvider()),
        ChangeNotifierProvider(create: (context) => AutomaticProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SingupProvider()),
        ChangeNotifierProvider(create: (context) => OtpVerifyProvider()),
        ChangeNotifierProvider(create: (context) => RateChartProvider()),
        ChangeNotifierProvider(create: (context) => SittingProvider()),
        ChangeNotifierProvider(create: (context) => ExportProvider()),
        ChangeNotifierProvider(create: (context) => FarmerProvier()),
        ChangeNotifierProvider(
            create: (context) => MilkRateDeductionProvider()),
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => ForgotOtpVerifyProvider()),
        ChangeNotifierProvider(create: (context) => ChoosePlanProvider()),
        ChangeNotifierProvider(create: (context) => DriverProvider()),
      ],
      child: ScreenUtilInit(
          designSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: AppBodyColor.blue),
                useMaterial3: true,
              ),
              localizationsDelegates: const [
                AppLocalizations.delegate, // Add this line
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: _locale,
              supportedLocales: const [
                Locale('en'), // English
                Locale('hi'), // Spanish
              ],
              home: const Splash_Screen(),
            );
          }),
    );
  }
}
