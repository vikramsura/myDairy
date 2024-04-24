import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milkdairy/allData/ApiConstant.dart';
import 'package:milkdairy/allData/SharedPreferences.dart';

class printerProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController paymentController = TextEditingController();
  String ?paymentSlip;
  String ?milkBill ;
  String ?register ;
  String ?milkSlip ;
  String? rateSlip ;
  String ?FatKg ;
  String ?usernameDate ;
  String line = "1";
  String language ="English";
  String ?printer ;


  void DataClean(){
    paymentController.clear();
    paymentSlip=null;
    milkBill=null;
    register=null;
    milkSlip==null;
    rateSlip=null;
    FatKg=null;
    usernameDate=null;
    printer=null;
    line="1";
    language="English";
  }

  List<String> options (BuildContext context) {
    return
  [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.yes,
    AppLocalizations.of(context)!.no,
  ];}
  List languages = ["English","हिंदी" ];
  List lines = ["1", "2", '3', "4", '5', '6', '7', '8', '9'];
  List <String>printers (BuildContext context) {
    return
  [
    AppLocalizations.of(context)!.select,
    AppLocalizations.of(context)!.dotmatrix,
    AppLocalizations.of(context)!.serial,
    AppLocalizations.of(context)!.inkjet,
    AppLocalizations.of(context)!.lazer,
    ];}

  DropdownButton<String> GetprintSlip(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: paymentSlip??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        paymentSlip = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetmilkBill(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: milkBill??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        milkBill = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> Getregister(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: register??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        register = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetmilkSlip(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: milkSlip??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        milkSlip = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetrateOnSlip(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: rateSlip??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        rateSlip = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetFatKg(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: FatKg??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        FatKg = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetusernameDate(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in options(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: usernameDate??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        usernameDate = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> Getlanguage() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in languages) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: language,
      onChanged: (value) {
        language = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetPrinters(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in printers(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: printer??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        printer = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> GetLines() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in lines) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: line,
      onChanged: (value) {
        line = value!;
        notifyListeners();
      },
    );
  }

  Future addPrinterSettings() async {
    try{
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.PRINTERSETTING);
    Map Addprinter = {
      'printer_type': printer.toString(),
      'blank_lines': line.toString(),
      'print_lang': language.toString(),
      'payment_day': paymentController.text.toString(),
      'payment_slip': paymentSlip.toString(),
      'dedution_milk': milkBill.toString(),
      'dedution_pay_register': register.toString(),
      'print_milk_slip': milkSlip.toString(),
      'print_rate_slip': rateSlip.toString(),
      'print_fat_rate': FatKg.toString(),
      'print_date': usernameDate.toString(),
    };

    http.Response? response;

    if (Addprinter.isNotEmpty) {
      response = await http.post(ApiUrl, body: Addprinter, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      });
    }

    var data = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      return data;
    }}catch(e){}
  }
}
