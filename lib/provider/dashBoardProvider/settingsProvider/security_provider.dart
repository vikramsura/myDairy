import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:milkdairy/allData/ApiConstant.dart';
import 'package:milkdairy/allData/SharedPreferences.dart';

class SecProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List options(BuildContext context) {
    return [
      AppLocalizations.of(context)!.select,
      AppLocalizations.of(context)!.yes,
      AppLocalizations.of(context)!.no,
    ];
  }

  Map<String, String> optionsInput(BuildContext context) {
    return {
      "Select": AppLocalizations.of(context)!.select,
      "No": AppLocalizations.of(context)!.no,
      "Yes": AppLocalizations.of(context)!.yes,
    };
  }

  Map<String, String> optionsOutput(BuildContext context) {
    return {
      AppLocalizations.of(context)!.select: 'Select',
      AppLocalizations.of(context)!.no: 'No',
      AppLocalizations.of(context)!.yes: 'Yes',
    };
  }

  List logoutTimes(BuildContext context) {
    return [AppLocalizations.of(context)!.select, "10", "30", "60"];
  }

  String? entry;
  String? entryEn;
  String? allowedManual;
  String? allowedManualEn;
  String? qntManual;

  String? qntManualEn;

  String? farCodeManual;

  String? farCodeManualEn;

  String? manualMilkEntry;

  String? manualMilkEntryEn;

  String? deduction;

  String? deductionEn;

  String? milkAmount;
  String? milkAmountEn;
  String? paymentCycle;

  String? paymentCycleEn;

  String? logoutTimeEn;
  String? milkSlipSMSEn;
  String? paymentSMS;
  String? paymentSMSEn;
  String? saleSMS;
  String? saleSMSEn;
  String? smsSendModeEn;
  String? smsSendMode;
  String? time;

  String? logoutTime;

  String? milkSlipSMS;

  void DataClean() {
    entry = null;
    entryEn = null;
    allowedManual = null;
    allowedManualEn = null;
    qntManual = null;
    qntManualEn = null;
    farCodeManual = null;
    farCodeManualEn = null;
    manualMilkEntry = null;
    deduction = null;
    deductionEn = null;
    milkAmount = null;
    milkAmountEn = null;
    paymentCycle = null;
    paymentCycleEn = null;
    logoutTime = null;
    logoutTimeEn = null;
    milkSlipSMS = null;
    milkSlipSMSEn = null;
    paymentSMS = null;
    paymentSMSEn = null;
    saleSMS = null;
    saleSMSEn = null;
    smsSendMode = null;
    smsSendModeEn = null;
    time = null;
  }

  Future addSecuritySettings() async {
    try {
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.securitySettings);
      Map Addprinter = {
        'milk_params_allowed': allowedManualEn,
        'allow_qty_manual': qntManualEn,
        'allow_edit_milk': entryEn,
        'allow_farmer_code_manual': farCodeManualEn,
        'allow_manual_milk_entry': manualMilkEntryEn,
        'allow_deduction': deductionEn,
        'allow_deduction_on_milk_amount': milkAmountEn,
        'allow_payment_cycle': paymentCycleEn,
        'logout_time': time,
        'sms_send_mode': "sim",
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
        // isLoading = false;
        notifyListeners();
        return data;
      } else {
        // isLoading = false;
        notifyListeners();
        return "";
      }
    } catch (e) {}
  }

  DropdownButton<String> getmilkEntry(context) {
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
      value: entry ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        entry = value;
        entryEn = optionsOutput(context)[value] ?? value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getallowedManual(context) {
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
      value: allowedManual ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        allowedManual = value;
        allowedManualEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getQntManual(context) {
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
      value: qntManual ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        qntManual = value;
        qntManualEn = optionsOutput(context)[value] ?? value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getFarCodeManual(context) {
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
      value: farCodeManual ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        farCodeManual = value;
        farCodeManualEn = optionsOutput(context)[value] ?? value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getManualMilkEntry(context) {
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
      value: manualMilkEntry ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        manualMilkEntry = value;
        manualMilkEntryEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getDeduction(context) {
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
      value: deduction ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        deduction = value;
        deductionEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getmilkAmount(context) {
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
      value: milkAmount ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        milkAmount = value;
        milkAmountEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getPaymentCycle(context) {
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
      value: paymentCycle ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        paymentCycle = value;
        paymentCycleEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getLogoutTime(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in logoutTimes(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: time ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        time = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getmilkSlipSMS(context) {
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
      value: milkSlipSMS ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        milkSlipSMS = value;
        milkSlipSMSEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getLocalSaleSMS(context) {
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
      value: saleSMS ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        saleSMS = value;
        saleSMSEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }

  DropdownButton<String> getPaymentSMS(context) {
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
      value: paymentSMS ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        paymentSMS = value;
        paymentSMSEn = optionsOutput(context)[value] ?? value;

        notifyListeners();
      },
    );
  }
}
