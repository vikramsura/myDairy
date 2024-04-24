import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milkdairy/allData/ApiConstant.dart';
import 'package:milkdairy/allData/SharedPreferences.dart';

class RateCalculateProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fatValueController = TextEditingController();
  TextEditingController dedLimitController = TextEditingController();
  String ?option ;
  String ?snf ;
  String? shift ;
  String ?multi ;
  String ?max ;
  String ?collType ;
  String ?milkRate ;
  String ?typeIdentification;
  String ?calMethod ;
  String? calType ;

  void DataClean(){
    fatValueController.clear();
    dedLimitController.clear();
    option=null;
    snf=null;
    shift=null;
    multi=null;
    max=null;
    collType=null;
    milkRate=null;
    typeIdentification=null;
    calMethod=null;
    calType=null;
  }

  List options (BuildContext context) {
    return [
      AppLocalizations.of(context)!.yes,
      AppLocalizations.of(context)!.no,
      ];}

  List collTypes (BuildContext context) {
    return [
      AppLocalizations.of(context)!.kg,
    AppLocalizations.of(context)!.litre,
      ];}
  List milkRates (BuildContext context) {
    return [
    AppLocalizations.of(context)!.fat,
    AppLocalizations.of(context)!.fATSNF,
    AppLocalizations.of(context)!.fATLR,
    AppLocalizations.of(context)!.litre,
    AppLocalizations.of(context)!.solid,
      ];}
  List typeIdentifications (BuildContext context) {
    return [
    AppLocalizations.of(context)!.manual,
    AppLocalizations.of(context)!.fatbase,
    AppLocalizations.of(context)!.cow,
    AppLocalizations.of(context)!.buffalo,
    AppLocalizations.of(context)!.mix,
    ];}
  List calTypes (BuildContext context) {
    return [
    AppLocalizations.of(context)!.dateWise,
    AppLocalizations.of(context)!.dateandshiftwise,
  ];}
  List calMethods (BuildContext context) {
    return [
      AppLocalizations.of(context)!.select,
      AppLocalizations.of(context)!.rateChart,
      AppLocalizations.of(context)!.formula,
      AppLocalizations.of(context)!.litre,
      ];}

  DropdownButton<String> getCollType(context) {
    TextStyle(fontSize: 14);

    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in collTypes(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: collType??AppLocalizations.of(context)!.litre,
      onChanged: (value) {
        collType = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getMilkRate(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in milkRates(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: milkRate??AppLocalizations.of(context)!.fat,
      onChanged: (value) {
        milkRate = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getTypeIdentification(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in typeIdentifications(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: typeIdentification??AppLocalizations.of(context)!.manual,
      onChanged: (value) {
        typeIdentification = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getCalType(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in calTypes(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: calType??AppLocalizations.of(context)!.dateWise,
      onChanged: (value) {
        calType = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getCalMrthod(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String ops in calMethods(context)) {
      var item = DropdownMenuItem(
        child: Text(ops),
        value: ops,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: calMethod??AppLocalizations.of(context)!.formula,
      onChanged: (value) {
        calMethod = value;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getSNF(context) {
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
      value: snf??AppLocalizations.of(context)!.yes,
      onChanged: (value) {
        snf = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getShift(context) {
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
      value: shift??AppLocalizations.of(context)!.yes,
      onChanged: (value) {
        shift = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getMultiRate(context) {
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
      value: multi??AppLocalizations.of(context)!.yes,
      onChanged: (value) {
        multi = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getMaxRate(context) {
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
      value: max??AppLocalizations.of(context)!.yes,
      onChanged: (value) {
        max = value!;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getOptions(context) {
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
      value: option??AppLocalizations.of(context)!.yes,
      onChanged: (value) {
        option = value!;
        notifyListeners();
      },
    );
  }

  Future addRateCalculations() async {
    try{
    var ApiUrl = Uri.parse(
      ApiConstant.baseurl + ApiConstant.rateCalculation,
    );
    Map Addcalculation = {
      'collection_type': collType.toString(),
      'milk_rate_type': milkRate.toString(),
      'calc_snf': snf.toString(),
      'famer_shift': shift.toString(),
      'milk_type': typeIdentification.toString(),
      'fat_value': fatValueController.text.toString(),
      'rate_calc_method': calMethod.toString(),
      'rate_calc_type': calType.toString(),
      'multi_far_rate': multi.toString(),
      'max_rate': max.toString(),
      'milk_amount': dedLimitController.text.toString(),
    };

    http.Response? response;

    if (Addcalculation.isNotEmpty) {
      response = await http.post(ApiUrl, body: Addcalculation, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      });
    }

    if (response?.statusCode == 200) {
      var data = jsonDecode(response!.body);
      return data;
    }}catch(e){}
  }
}
