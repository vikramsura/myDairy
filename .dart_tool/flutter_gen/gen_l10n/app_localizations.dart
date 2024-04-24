import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome To'**
  String get welcome;

  /// No description provided for @myDairy.
  ///
  /// In en, this message translates to:
  /// **'My Dairy'**
  String get myDairy;

  /// No description provided for @master.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get master;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about;

  /// No description provided for @farmer.
  ///
  /// In en, this message translates to:
  /// **'Farmer'**
  String get farmer;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @hardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware'**
  String get hardware;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @milkRateDeduction.
  ///
  /// In en, this message translates to:
  /// **'Milk Rate Deduction'**
  String get milkRateDeduction;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @notDataFound.
  ///
  /// In en, this message translates to:
  /// **'Not Data Found'**
  String get notDataFound;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'Id'**
  String get id;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @regCode.
  ///
  /// In en, this message translates to:
  /// **'Registration Code'**
  String get regCode;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date Of Birth'**
  String get dateOfBirth;

  /// No description provided for @cDate.
  ///
  /// In en, this message translates to:
  /// **'You must be 18 or older to use this feature.'**
  String get cDate;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone No.'**
  String get phone;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @bankHolderName.
  ///
  /// In en, this message translates to:
  /// **'Bank Holder Name'**
  String get bankHolderName;

  /// No description provided for @bankAccNo.
  ///
  /// In en, this message translates to:
  /// **'Bank Acc No'**
  String get bankAccNo;

  /// No description provided for @ifscCode.
  ///
  /// In en, this message translates to:
  /// **'IFSC code'**
  String get ifscCode;

  /// No description provided for @branchName.
  ///
  /// In en, this message translates to:
  /// **'Branch Name'**
  String get branchName;

  /// No description provided for @pleaseEnter.
  ///
  /// In en, this message translates to:
  /// **'Please enter'**
  String get pleaseEnter;

  /// No description provided for @cBank.
  ///
  /// In en, this message translates to:
  /// **'Bank account Number must be 11 digits '**
  String get cBank;

  /// No description provided for @cIfsc.
  ///
  /// In en, this message translates to:
  /// **' Bank IFSC code must be 11 digits'**
  String get cIfsc;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get submit;

  /// No description provided for @cPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number must be at least 10 digits'**
  String get cPhone;

  /// No description provided for @lisNo.
  ///
  /// In en, this message translates to:
  /// **'License number must be at least 15 digits'**
  String get lisNo;

  /// No description provided for @addNo.
  ///
  /// In en, this message translates to:
  /// **'Addhar number must be at least 12 digits'**
  String get addNo;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @milkRateChart.
  ///
  /// In en, this message translates to:
  /// **'Milk Rate Chart'**
  String get milkRateChart;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @shift.
  ///
  /// In en, this message translates to:
  /// **'Shift'**
  String get shift;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Do you Want to delete rate chart ID?'**
  String get delete;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @remark.
  ///
  /// In en, this message translates to:
  /// **'Remark'**
  String get remark;

  /// No description provided for @fateRate.
  ///
  /// In en, this message translates to:
  /// **'Fate Rate'**
  String get fateRate;

  /// No description provided for @cow.
  ///
  /// In en, this message translates to:
  /// **'Cow'**
  String get cow;

  /// No description provided for @buffalo.
  ///
  /// In en, this message translates to:
  /// **'Buffalo'**
  String get buffalo;

  /// No description provided for @mix.
  ///
  /// In en, this message translates to:
  /// **'Mix'**
  String get mix;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @clr.
  ///
  /// In en, this message translates to:
  /// **'Clr'**
  String get clr;

  /// No description provided for @snf.
  ///
  /// In en, this message translates to:
  /// **'Snf'**
  String get snf;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @hdelete.
  ///
  /// In en, this message translates to:
  /// **'Do you Want to delete hardware ID?'**
  String get hdelete;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @baudRate.
  ///
  /// In en, this message translates to:
  /// **'Baud Rate'**
  String get baudRate;

  /// No description provided for @stopBits.
  ///
  /// In en, this message translates to:
  /// **'Stop Bits'**
  String get stopBits;

  /// No description provided for @parity.
  ///
  /// In en, this message translates to:
  /// **'Parity'**
  String get parity;

  /// No description provided for @noofString.
  ///
  /// In en, this message translates to:
  /// **'No. of String'**
  String get noofString;

  /// No description provided for @continuousStr.
  ///
  /// In en, this message translates to:
  /// **'Continuous Str'**
  String get continuousStr;

  /// No description provided for @flowControl.
  ///
  /// In en, this message translates to:
  /// **'Flow Control'**
  String get flowControl;

  /// No description provided for @stringLenght.
  ///
  /// In en, this message translates to:
  /// **'String Lenght'**
  String get stringLenght;

  /// No description provided for @startingChar.
  ///
  /// In en, this message translates to:
  /// **'Starting Char'**
  String get startingChar;

  /// No description provided for @tareChar.
  ///
  /// In en, this message translates to:
  /// **'Tare Char'**
  String get tareChar;

  /// No description provided for @dataBits.
  ///
  /// In en, this message translates to:
  /// **'Data Bits'**
  String get dataBits;

  /// No description provided for @milk.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get milk;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @penalty.
  ///
  /// In en, this message translates to:
  /// **'Penalty'**
  String get penalty;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Please enter a time'**
  String get time;

  /// No description provided for @ftime.
  ///
  /// In en, this message translates to:
  /// **'Invalid time format'**
  String get ftime;

  /// No description provided for @htime.
  ///
  /// In en, this message translates to:
  /// **'Invalid hours. Must be between 0 and 23.'**
  String get htime;

  /// No description provided for @mtime.
  ///
  /// In en, this message translates to:
  /// **'Invalid minutes. Must be between 0 and 59.'**
  String get mtime;

  /// No description provided for @stime.
  ///
  /// In en, this message translates to:
  /// **'Invalid seconds. Must be between 0 and 59.'**
  String get stime;

  /// No description provided for @fmtime.
  ///
  /// In en, this message translates to:
  /// **'Time From Morning'**
  String get fmtime;

  /// No description provided for @tmtime.
  ///
  /// In en, this message translates to:
  /// **'Morning To Time'**
  String get tmtime;

  /// No description provided for @penaltyType.
  ///
  /// In en, this message translates to:
  /// **'Penalty Type'**
  String get penaltyType;

  /// No description provided for @penaltyValue.
  ///
  /// In en, this message translates to:
  /// **'Penalty Value'**
  String get penaltyValue;

  /// No description provided for @eveningFromTime.
  ///
  /// In en, this message translates to:
  /// **'Time From Evening'**
  String get eveningFromTime;

  /// No description provided for @eveningToTime.
  ///
  /// In en, this message translates to:
  /// **'Evening To Time'**
  String get eveningToTime;

  /// No description provided for @automaticMilkCollection.
  ///
  /// In en, this message translates to:
  /// **'Automatic Milk Collection'**
  String get automaticMilkCollection;

  /// No description provided for @manualMilkCollection.
  ///
  /// In en, this message translates to:
  /// **'Manual Milk Collection'**
  String get manualMilkCollection;

  /// No description provided for @editMilkCollection.
  ///
  /// In en, this message translates to:
  /// **'Edit Milk Collection'**
  String get editMilkCollection;

  /// No description provided for @simpleDispatch.
  ///
  /// In en, this message translates to:
  /// **'Simple Dispatch'**
  String get simpleDispatch;

  /// No description provided for @dairyName.
  ///
  /// In en, this message translates to:
  /// **'Dairy Name'**
  String get dairyName;

  /// No description provided for @sampleNo.
  ///
  /// In en, this message translates to:
  /// **'Sample No'**
  String get sampleNo;

  /// No description provided for @milkType.
  ///
  /// In en, this message translates to:
  /// **'Milk Type'**
  String get milkType;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Do you want to save ?'**
  String get save;

  /// No description provided for @oK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get oK;

  /// No description provided for @cANCEL.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cANCEL;

  /// No description provided for @sUMMARY.
  ///
  /// In en, this message translates to:
  /// **'SUMMARY'**
  String get sUMMARY;

  /// No description provided for @litre.
  ///
  /// In en, this message translates to:
  /// **'Litre'**
  String get litre;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid data!'**
  String get invalid;

  /// No description provided for @can.
  ///
  /// In en, this message translates to:
  /// **'Can'**
  String get can;

  /// No description provided for @tankerNo.
  ///
  /// In en, this message translates to:
  /// **'Tanker No'**
  String get tankerNo;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @languagesettings.
  ///
  /// In en, this message translates to:
  /// **'Language settings'**
  String get languagesettings;

  /// No description provided for @milkSlip.
  ///
  /// In en, this message translates to:
  /// **'Milk Slip'**
  String get milkSlip;

  /// No description provided for @purchaseSummary.
  ///
  /// In en, this message translates to:
  /// **'Purchase Summary'**
  String get purchaseSummary;

  /// No description provided for @farmerMilkBill.
  ///
  /// In en, this message translates to:
  /// **'Farmer Milk Bill'**
  String get farmerMilkBill;

  /// No description provided for @dispatchSlip.
  ///
  /// In en, this message translates to:
  /// **'Dispatch Slip'**
  String get dispatchSlip;

  /// No description provided for @dispatchReport.
  ///
  /// In en, this message translates to:
  /// **'Dispatch Report'**
  String get dispatchReport;

  /// No description provided for @fromDate.
  ///
  /// In en, this message translates to:
  /// **'From Date'**
  String get fromDate;

  /// No description provided for @toDate.
  ///
  /// In en, this message translates to:
  /// **'To Date'**
  String get toDate;

  /// No description provided for @validtodate.
  ///
  /// In en, this message translates to:
  /// **'Please choose a valid to date!'**
  String get validtodate;

  /// No description provided for @tankerCan.
  ///
  /// In en, this message translates to:
  /// **'Tanker Can'**
  String get tankerCan;

  /// No description provided for @tankerQty.
  ///
  /// In en, this message translates to:
  /// **'Tanker Qty'**
  String get tankerQty;

  /// No description provided for @adminID.
  ///
  /// In en, this message translates to:
  /// **'Admin ID'**
  String get adminID;

  /// No description provided for @userUniId.
  ///
  /// In en, this message translates to:
  /// **'Admin ID'**
  String get userUniId;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @dairyShortName.
  ///
  /// In en, this message translates to:
  /// **'Dairy Short Name'**
  String get dairyShortName;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @village.
  ///
  /// In en, this message translates to:
  /// **'Village'**
  String get village;

  /// No description provided for @pinCode.
  ///
  /// In en, this message translates to:
  /// **'Pin Code'**
  String get pinCode;

  /// No description provided for @photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get photo;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @digitpincode.
  ///
  /// In en, this message translates to:
  /// **'Enter 6 digit pin code'**
  String get digitpincode;

  /// No description provided for @howtoaddafarmer.
  ///
  /// In en, this message translates to:
  /// **'How to add a farmer ?'**
  String get howtoaddafarmer;

  /// No description provided for @howtochangepassword.
  ///
  /// In en, this message translates to:
  /// **'How to change password ?'**
  String get howtochangepassword;

  /// No description provided for @howtochangepasswordAs.
  ///
  /// In en, this message translates to:
  /// **'Home ->Tap on Settings icon on top right side of the page -> click on \'Change Password\' -> enter old password, then enter new password -> click on submit button'**
  String get howtochangepasswordAs;

  /// No description provided for @howtochangeusername.
  ///
  /// In en, this message translates to:
  /// **'How to change user name ?'**
  String get howtochangeusername;

  /// No description provided for @howtologoutfromapp.
  ///
  /// In en, this message translates to:
  /// **'How to log out from app ?'**
  String get howtologoutfromapp;

  /// No description provided for @howtologoutfromappAs.
  ///
  /// In en, this message translates to:
  /// **'Home ->Tap on Settings icon on top right side of the page -> click on \'Log Out\' -> tap on yes.'**
  String get howtologoutfromappAs;

  /// No description provided for @howtochangeusernameAs.
  ///
  /// In en, this message translates to:
  /// **'Home ->Tap on Settings icon on top right side of the page -> click on earlier given username -> Click on Profile Edit icon on top right side of the page, then edit your name -> click on submit button'**
  String get howtochangeusernameAs;

  /// No description provided for @howtoaddafarmerAs.
  ///
  /// In en, this message translates to:
  /// **'Home -> master -> Farmer -> Click on + button on bottom right side of the page, fill details and click on submit button'**
  String get howtoaddafarmerAs;

  /// No description provided for @aboutList.
  ///
  /// In en, this message translates to:
  /// **'The purpose of the My dairy  Application is to streamline and modernize the process of collecting, quality testing, and payment processing for milk from various sources like PDC, DCS, BMC and Farmers. This system aims to replace manual and paper-based processes with efficient digital solutions, offering benefits to both dairy farmers and dairy processing organizations.'**
  String get aboutList;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @printerSetting.
  ///
  /// In en, this message translates to:
  /// **'printer settings'**
  String get printerSetting;

  /// No description provided for @rateParameters.
  ///
  /// In en, this message translates to:
  /// **'Rate Parameters'**
  String get rateParameters;

  /// No description provided for @rateCalculation.
  ///
  /// In en, this message translates to:
  /// **'Rate Calculation'**
  String get rateCalculation;

  /// No description provided for @securitySettings.
  ///
  /// In en, this message translates to:
  /// **'Security Settings'**
  String get securitySettings;

  /// No description provided for @hardwareSettings.
  ///
  /// In en, this message translates to:
  /// **'Hardware Settings'**
  String get hardwareSettings;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @doYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Do you Want to Logout?'**
  String get doYouWantToLogout;

  /// No description provided for @userLogoutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User Logout successfully'**
  String get userLogoutSuccessfully;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @machineOnt.
  ///
  /// In en, this message translates to:
  /// **'Machine On'**
  String get machineOnt;

  /// No description provided for @tareYesNo.
  ///
  /// In en, this message translates to:
  /// **'Tare Yes No'**
  String get tareYesNo;

  /// No description provided for @weightScale.
  ///
  /// In en, this message translates to:
  /// **'Weight Scale'**
  String get weightScale;

  /// No description provided for @fatMachine.
  ///
  /// In en, this message translates to:
  /// **'Fat Machine'**
  String get fatMachine;

  /// No description provided for @milkAnalyzer.
  ///
  /// In en, this message translates to:
  /// **'Milk Analyzer'**
  String get milkAnalyzer;

  /// No description provided for @bigDisplay.
  ///
  /// In en, this message translates to:
  /// **'Big Display'**
  String get bigDisplay;

  /// No description provided for @doyouwanttosave.
  ///
  /// In en, this message translates to:
  /// **'Do you want to save ?'**
  String get doyouwanttosave;

  /// No description provided for @milkSlipPrinterType.
  ///
  /// In en, this message translates to:
  /// **'Milk Slip Printer Type'**
  String get milkSlipPrinterType;

  /// No description provided for @noOfBlankLines.
  ///
  /// In en, this message translates to:
  /// **'No. of Blank Lines'**
  String get noOfBlankLines;

  /// No description provided for @printMilkSlipLang.
  ///
  /// In en, this message translates to:
  /// **'Print Milk Slip Lang.'**
  String get printMilkSlipLang;

  /// No description provided for @paymentDays.
  ///
  /// In en, this message translates to:
  /// **'Payment Days'**
  String get paymentDays;

  /// No description provided for @mustBerequirdPaymentDays.
  ///
  /// In en, this message translates to:
  /// **'Payment Days are required'**
  String get mustBerequirdPaymentDays;

  /// No description provided for @paymentTotalPrintOnSlip.
  ///
  /// In en, this message translates to:
  /// **'Payment Total Print On Slip'**
  String get paymentTotalPrintOnSlip;

  /// No description provided for @allowDeductiononMilkBill.
  ///
  /// In en, this message translates to:
  /// **'Allow Deduction on Milk Bill'**
  String get allowDeductiononMilkBill;

  /// No description provided for @allowDeductiononPaymentRegister.
  ///
  /// In en, this message translates to:
  /// **'Allow Deduction on Payment Register'**
  String get allowDeductiononPaymentRegister;

  /// No description provided for @printMilkSlip.
  ///
  /// In en, this message translates to:
  /// **'Print Milk Slip'**
  String get printMilkSlip;

  /// No description provided for @printPerliterRateonSlip.
  ///
  /// In en, this message translates to:
  /// **'Print Per liter Rate on Slip ?'**
  String get printPerliterRateonSlip;

  /// No description provided for @printFATKgRate.
  ///
  /// In en, this message translates to:
  /// **'Print FATKg Rate'**
  String get printFATKgRate;

  /// No description provided for @printUsernameDateTime.
  ///
  /// In en, this message translates to:
  /// **'Print Username & Date Time'**
  String get printUsernameDateTime;

  /// No description provided for @datasavedsuccessfuly.
  ///
  /// In en, this message translates to:
  /// **'Data saved successfully '**
  String get datasavedsuccessfuly;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @collectionType.
  ///
  /// In en, this message translates to:
  /// **'Collection Type'**
  String get collectionType;

  /// No description provided for @milkRateType.
  ///
  /// In en, this message translates to:
  /// **'Milk Rate Type'**
  String get milkRateType;

  /// No description provided for @calcSNFFromFormula.
  ///
  /// In en, this message translates to:
  /// **'Calc. SNF From Formula'**
  String get calcSNFFromFormula;

  /// No description provided for @sameFarmerinShift.
  ///
  /// In en, this message translates to:
  /// **'Same Farmer in Shift'**
  String get sameFarmerinShift;

  /// No description provided for @milkTypeIdentification.
  ///
  /// In en, this message translates to:
  /// **'Milk Type Identification'**
  String get milkTypeIdentification;

  /// No description provided for @baseFatValue.
  ///
  /// In en, this message translates to:
  /// **'Base Fat Value'**
  String get baseFatValue;

  /// No description provided for @mustBerequirdFatvalue.
  ///
  /// In en, this message translates to:
  /// **'Must Be requird Fat value'**
  String get mustBerequirdFatvalue;

  /// No description provided for @rateCalculationMethod.
  ///
  /// In en, this message translates to:
  /// **'Rate Calculation Method'**
  String get rateCalculationMethod;

  /// No description provided for @rateCalculationType.
  ///
  /// In en, this message translates to:
  /// **'Rate Calculation Type'**
  String get rateCalculationType;

  /// No description provided for @multipleRateforMultipleFarmers.
  ///
  /// In en, this message translates to:
  /// **'Multiple Rate for Multiple Farmers'**
  String get multipleRateforMultipleFarmers;

  /// No description provided for @considerMaxRate.
  ///
  /// In en, this message translates to:
  /// **'Consider Max. Rate'**
  String get considerMaxRate;

  /// No description provided for @dedLimitonMilkAmount.
  ///
  /// In en, this message translates to:
  /// **'Ded. Limit % on Milk Amount'**
  String get dedLimitonMilkAmount;

  /// No description provided for @mustberequirdmilkamount.
  ///
  /// In en, this message translates to:
  /// **'Must Be requird milk amount'**
  String get mustberequirdmilkamount;

  /// No description provided for @minFAT.
  ///
  /// In en, this message translates to:
  /// **'Min. FAT'**
  String get minFAT;

  /// No description provided for @maxFAT.
  ///
  /// In en, this message translates to:
  /// **'Max. FAT'**
  String get maxFAT;

  /// No description provided for @minSNF.
  ///
  /// In en, this message translates to:
  /// **'Min. SNF'**
  String get minSNF;

  /// No description provided for @maxSNF.
  ///
  /// In en, this message translates to:
  /// **'Max. SNF'**
  String get maxSNF;

  /// No description provided for @minLR.
  ///
  /// In en, this message translates to:
  /// **'Min. LR'**
  String get minLR;

  /// No description provided for @maxLR.
  ///
  /// In en, this message translates to:
  /// **'Max. LR'**
  String get maxLR;

  /// No description provided for @minSolid.
  ///
  /// In en, this message translates to:
  /// **'Min. Solid'**
  String get minSolid;

  /// No description provided for @maxSolid.
  ///
  /// In en, this message translates to:
  /// **'Max. Solid'**
  String get maxSolid;

  /// No description provided for @societyKiloConst.
  ///
  /// In en, this message translates to:
  /// **'Society Kilo Const.'**
  String get societyKiloConst;

  /// No description provided for @dairyKiloConst.
  ///
  /// In en, this message translates to:
  /// **'Dairy Kilo Const'**
  String get dairyKiloConst;

  /// No description provided for @allowEditInMilkEntry.
  ///
  /// In en, this message translates to:
  /// **'Allow Edit In Milk Entry'**
  String get allowEditInMilkEntry;

  /// No description provided for @milkParamsAllowedManual.
  ///
  /// In en, this message translates to:
  /// **'Milk Params Allowed Manual'**
  String get milkParamsAllowedManual;

  /// No description provided for @allowQtyManual.
  ///
  /// In en, this message translates to:
  /// **'Allow Qty. Manual'**
  String get allowQtyManual;

  /// No description provided for @allowFarmerCodeManual.
  ///
  /// In en, this message translates to:
  /// **'Allow Farmer Code Manual'**
  String get allowFarmerCodeManual;

  /// No description provided for @allowManualMilkEntry.
  ///
  /// In en, this message translates to:
  /// **'Allow Manual Milk Entry'**
  String get allowManualMilkEntry;

  /// No description provided for @allowDeduction.
  ///
  /// In en, this message translates to:
  /// **'Allow Deduction'**
  String get allowDeduction;

  /// No description provided for @allowdeductiononmilkamount.
  ///
  /// In en, this message translates to:
  /// **'Allow deduction on milk amount'**
  String get allowdeductiononmilkamount;

  /// No description provided for @allowPaymentcycle.
  ///
  /// In en, this message translates to:
  /// **'Allow Payment cycle'**
  String get allowPaymentcycle;

  /// No description provided for @logoutTime.
  ///
  /// In en, this message translates to:
  /// **'Logout Time(In Minutes)'**
  String get logoutTime;

  /// No description provided for @milkslipSMS.
  ///
  /// In en, this message translates to:
  /// **'Milk slip SMS'**
  String get milkslipSMS;

  /// No description provided for @localSaleSMS.
  ///
  /// In en, this message translates to:
  /// **'Local Sale SMS'**
  String get localSaleSMS;

  /// No description provided for @paymentSMS.
  ///
  /// In en, this message translates to:
  /// **'Payment SMS'**
  String get paymentSMS;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @passwordisrequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordisrequired;

  /// No description provided for @leastPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get leastPassword;

  /// No description provided for @letterPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must include at least one lowercase letter'**
  String get letterPassword;

  /// No description provided for @uppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must include at least one uppercase letter'**
  String get uppercase;

  /// No description provided for @oneDigitPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must include at least one digit'**
  String get oneDigitPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @newOldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password is same as new password'**
  String get newOldPassword;

  /// No description provided for @fATMACHINE.
  ///
  /// In en, this message translates to:
  /// **'FATMACHINE'**
  String get fATMACHINE;

  /// No description provided for @wEIGHINGSCALE.
  ///
  /// In en, this message translates to:
  /// **'WEIGHINGSCALE'**
  String get wEIGHINGSCALE;

  /// No description provided for @dISPLAYUNIT.
  ///
  /// In en, this message translates to:
  /// **'DISPLAYUNIT'**
  String get dISPLAYUNIT;

  /// No description provided for @tHERMALPRINTER.
  ///
  /// In en, this message translates to:
  /// **'THERMALPRINTER'**
  String get tHERMALPRINTER;

  /// No description provided for @lRMACHINE.
  ///
  /// In en, this message translates to:
  /// **'LRMACHINE'**
  String get lRMACHINE;

  /// No description provided for @pRMACHINE.
  ///
  /// In en, this message translates to:
  /// **'PRMACHINE'**
  String get pRMACHINE;

  /// No description provided for @odd.
  ///
  /// In en, this message translates to:
  /// **'Odd'**
  String get odd;

  /// No description provided for @even.
  ///
  /// In en, this message translates to:
  /// **'Even'**
  String get even;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @dotmatrix.
  ///
  /// In en, this message translates to:
  /// **'Dot matrix'**
  String get dotmatrix;

  /// No description provided for @serial.
  ///
  /// In en, this message translates to:
  /// **'Serial'**
  String get serial;

  /// No description provided for @inkjet.
  ///
  /// In en, this message translates to:
  /// **'Inkjet'**
  String get inkjet;

  /// No description provided for @lazer.
  ///
  /// In en, this message translates to:
  /// **'Lazer'**
  String get lazer;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get kg;

  /// No description provided for @fATSNF.
  ///
  /// In en, this message translates to:
  /// **'FATSNF'**
  String get fATSNF;

  /// No description provided for @fATLR.
  ///
  /// In en, this message translates to:
  /// **'FATLR'**
  String get fATLR;

  /// No description provided for @solid.
  ///
  /// In en, this message translates to:
  /// **'Solid'**
  String get solid;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @fatbase.
  ///
  /// In en, this message translates to:
  /// **'Fatbase'**
  String get fatbase;

  /// No description provided for @dateWise.
  ///
  /// In en, this message translates to:
  /// **'Fatbase'**
  String get dateWise;

  /// No description provided for @dateandshiftwise.
  ///
  /// In en, this message translates to:
  /// **'Date and \nshift wise'**
  String get dateandshiftwise;

  /// No description provided for @rateChart.
  ///
  /// In en, this message translates to:
  /// **'Rate Chart'**
  String get rateChart;

  /// No description provided for @formula.
  ///
  /// In en, this message translates to:
  /// **'Formula'**
  String get formula;

  /// No description provided for @printing.
  ///
  /// In en, this message translates to:
  /// **'Printing'**
  String get printing;

  /// No description provided for @choosePlan.
  ///
  /// In en, this message translates to:
  /// **'Choose Plan'**
  String get choosePlan;

  /// No description provided for @subscriptionForDailyItems.
  ///
  /// In en, this message translates to:
  /// **'Subscription for Daily Items'**
  String get subscriptionForDailyItems;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @everyday.
  ///
  /// In en, this message translates to:
  /// **'Everyday'**
  String get everyday;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'order'**
  String get order;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get freeDelivery;

  /// No description provided for @getCashbackUpto.
  ///
  /// In en, this message translates to:
  /// **'Get cashback Upto'**
  String get getCashbackUpto;

  /// No description provided for @onYourWallet.
  ///
  /// In en, this message translates to:
  /// **'on your wallet'**
  String get onYourWallet;

  /// No description provided for @addNewDriver.
  ///
  /// In en, this message translates to:
  /// **'Add New  Driver'**
  String get addNewDriver;

  /// No description provided for @editDriverProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Driver Profile'**
  String get editDriverProfile;

  /// No description provided for @driverProfile.
  ///
  /// In en, this message translates to:
  /// **'Driver Profile'**
  String get driverProfile;

  /// No description provided for @driverList.
  ///
  /// In en, this message translates to:
  /// **'Driver List'**
  String get driverList;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @uploadLicense.
  ///
  /// In en, this message translates to:
  /// **'Upload License'**
  String get uploadLicense;

  /// No description provided for @licenseExpDate.
  ///
  /// In en, this message translates to:
  /// **'License Exp Date'**
  String get licenseExpDate;

  /// No description provided for @licenseNo.
  ///
  /// In en, this message translates to:
  /// **'License no'**
  String get licenseNo;

  /// No description provided for @addharNumber.
  ///
  /// In en, this message translates to:
  /// **'Addhar Number'**
  String get addharNumber;

  /// No description provided for @chooseFile.
  ///
  /// In en, this message translates to:
  /// **'Choose File'**
  String get chooseFile;

  /// No description provided for @noFileChoose.
  ///
  /// In en, this message translates to:
  /// **'No File Choose'**
  String get noFileChoose;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
