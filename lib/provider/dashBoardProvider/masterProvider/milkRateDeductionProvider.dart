import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class MilkRateDeductionProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  var enabled = '0';
  TextEditingController MorningFromTimeController = TextEditingController();
  TextEditingController MorningToTimeController = TextEditingController();
  TextEditingController PenaltyMorningValueController = TextEditingController();
  TextEditingController EveningFromTimeController = TextEditingController();
  TextEditingController EveningToTimeController = TextEditingController();
  TextEditingController PenaltyEveningValueController = TextEditingController();

  String? MorningpenaltyType;

  String? MorningpenaltyTypeEdit;

  String? MorningpenaltyTypeEn;

  String? EveningpenaltyType;

  String? EveningpenaltyTypeEdit;

  String? EveningpenaltyTypeEn;

  String convertToTimeFormat(String input) {
    List<String> parts = input.split(':');

    int hours = int.tryParse(parts[0]) ?? 0;
    if (hours < 0 || hours > 23) {
      return "Invalid hours. Must be between 0 and 23.";
    }

    int minutes = 0;
    if (parts.length >= 2) {
      minutes = int.tryParse(parts[1]) ?? 0;
      if (minutes < 0 || minutes > 59) {
        return "Invalid minutes. Must be between 0 and 59.";
      }
    }

    int seconds = 0;
    if (parts.length >= 3) {
      seconds = int.tryParse(parts[2]) ?? 0;
      if (seconds < 0 || seconds > 59) {
        return "Invalid seconds. Must be between 0 and 59.";
      }
    }
    DateTime dateTime = DateTime(1, 1, 1, hours, minutes, seconds);

    String formattedTime =
        "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";

    return formattedTime;
  }

  void cleanData() {
    MorningFromTimeController.clear();
    MorningToTimeController.clear();
    PenaltyMorningValueController.clear();
    EveningFromTimeController.clear();
    EveningToTimeController.clear();
    PenaltyEveningValueController.clear();
    MorningpenaltyType = null;
    MorningpenaltyTypeEn = null;
    MorningpenaltyTypeEdit = null;
    EveningpenaltyType = null;
    EveningpenaltyTypeEn = null;
    EveningpenaltyTypeEdit = null;
    enabled = '0';
    notifyListeners();
  }

  void changeValues(value) {
    enabled = value;
    notifyListeners();
  }

  void initData(context, MilkDeductionModeleData milkDeductiondetails) {
    MorningpenaltyTypeEdit == null
        ? MorningpenaltyTypeEdit =
            milkDeductiondetails.morningPenaltyType.toString()
        : MorningpenaltyTypeEdit = MorningpenaltyTypeEn;
    EveningpenaltyTypeEdit == null
        ? EveningpenaltyTypeEdit =
            milkDeductiondetails.eveningPenaltyType.toString()
        : MorningpenaltyTypeEdit = MorningpenaltyTypeEn;

    idFromList = milkDeductiondetails.id.toString();
    MorningFromTimeController.text =
        milkDeductiondetails.morningFromTime.toString();
    MorningpenaltyType = penaltyTypeInput(
            context)[milkDeductiondetails.morningPenaltyType.toString()] ??
        milkDeductiondetails.morningPenaltyType.toString();
    EveningpenaltyType = penaltyTypeInput(
            context)[milkDeductiondetails.eveningPenaltyType.toString()] ??
        milkDeductiondetails.eveningPenaltyType.toString();
    MorningToTimeController.text =
        milkDeductiondetails.morningToTime.toString();
    PenaltyMorningValueController.text =
        milkDeductiondetails.morningPenaltyValue.toString();
    EveningFromTimeController.text =
        milkDeductiondetails.eveningFromTime.toString();
    EveningToTimeController.text =
        milkDeductiondetails.eveningToTime.toString();
    PenaltyEveningValueController.text =
        milkDeductiondetails.eveningPenaltyValue.toString();
  }

  DropdownButton<String> getMorningPenalty(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in penaltyType(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: MorningpenaltyType ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        MorningpenaltyType = value;
        MorningpenaltyTypeEn = parityOutput(context)[value] ?? value;
        MorningpenaltyTypeEdit=MorningpenaltyTypeEn;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getEveningPenalty(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in penaltyType(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: EveningpenaltyType ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        EveningpenaltyType = value;
        EveningpenaltyTypeEn = parityOutput(context)[value] ?? value;
        EveningpenaltyTypeEdit=EveningpenaltyTypeEn;
        notifyListeners();
      },
    );
  }

  Future addMilkDeduction(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.addMilkRateDeductionList);
      http.Response

        response =
            await http.post(ApiUrl, body: {
              'morning_from_time':
              convertToTimeFormat(MorningFromTimeController.text.toString()),
              'morning_to_time':
              convertToTimeFormat(MorningToTimeController.text.toString()),
              'morning_penalty_type': MorningpenaltyTypeEn.toString(),
              'morning_penalty_value': PenaltyMorningValueController.text.toString(),
              'evening_from_time':
              convertToTimeFormat(EveningFromTimeController.text.toString()),
              'evening_to_time':
              convertToTimeFormat(EveningToTimeController.text.toString()),
              'evening_penalty_type': EveningpenaltyTypeEn.toString(),
              'evening_penalty_value': PenaltyEveningValueController.text.toString(),
            }, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
         cleanData();
         GetMilkDeduction();
         Navigator.pop(context);
         snackMessage(context, data['message'],no: 2);
        } else if (data['success'] == false) {
          snackMessage(context, data['message']);

        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  String? idFromList;

  Future editMilkDeduction(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.addMilkRateDeductionList);
      http.Response
        response =
            await http.post(ApiUrl, body: {
              'morning_from_time':
              convertToTimeFormat(MorningFromTimeController.text.toString()),
              'morning_to_time':
              convertToTimeFormat(MorningToTimeController.text.toString()),
              'morning_penalty_type': MorningpenaltyTypeEdit.toString(),
              'morning_penalty_value': PenaltyMorningValueController.text.toString(),
              'evening_from_time':
              convertToTimeFormat(EveningFromTimeController.text.toString()),
              'evening_to_time':
              convertToTimeFormat(EveningToTimeController.text.toString()),
              'evening_penalty_type': EveningpenaltyTypeEdit.toString(),
              'evening_penalty_value': PenaltyEveningValueController.text.toString(),
              'id': idFromList.toString(),
            }, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          cleanData();
          GetMilkDeduction();
          Navigator.pop(context);
          snackMessage(context, data['message'],no: 2);

        } else if (data['success'] == false) {
          snackMessage(context, data['message']);

        }
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> GetMilkDeduction() async {
    isLoading = true;
    MilkDeductionList = await MilkDeduction();
    isLoading = false;
    notifyListeners();
  }
  List<MilkDeductionModeleData> MilkDeductionList = [];

  Future MilkDeduction() async {
    try {
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.milkRateDeductionList);
      http.Response
      response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        MilkDeductionList.clear();
        var jsonResponse = jsonDecode(response.body);
        MilkDeductionModele newModel =
            MilkDeductionModele.fromJson(jsonResponse);
        List<MilkDeductionModeleData> data = [];
        data = newModel.data!;
        MilkDeductionList.addAll(data);
        return MilkDeductionList;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
