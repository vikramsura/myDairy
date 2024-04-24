import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:milkdairy/all_import.dart';

class RateChartProvider with ChangeNotifier {
  String? shift;
  String? shiftEn;
  String? shiftEdit;
  var enabled = '1';
  bool isLoading = true;

  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController effeShiftController = TextEditingController();
  TextEditingController ratecodeController = TextEditingController();
  TextEditingController registrationCodeController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController faterateCowController = TextEditingController();
  TextEditingController faterateBuffaloController = TextEditingController();
  TextEditingController faterateMixController = TextEditingController();
  TextEditingController faterateOtherController = TextEditingController();
  TextEditingController clrCowController = TextEditingController();
  TextEditingController clrBuffaloController = TextEditingController();
  TextEditingController clrRateMixController = TextEditingController();
  TextEditingController clrOtherController = TextEditingController();
  TextEditingController snfCowController = TextEditingController();
  TextEditingController snfBuffaloController = TextEditingController();
  TextEditingController snfRateMixController = TextEditingController();
  TextEditingController snfOtherController = TextEditingController();

  void getInitDate() {
    final dateTime = DateTime.now();
    final initDate = DateFormat("yyyy-MM-dd").format(dateTime).toString();
    dateController = TextEditingController(text: initDate);
  }

  void changeValues(value) {
    enabled = value;
    notifyListeners();
  }

  void initData(context, RateChatModelDate rateChatModelList) {
    shift = rateChatModelList.shift.toString();
    shiftEdit == null
        ? shiftEdit = rateChatModelList.shift.toString()
        : shiftEdit = shiftEn;
    id = rateChatModelList.id.toString();
    dateController.text = rateChatModelList.shDate.toString();
    effeShiftController.text =
        shiftsInput(context)[rateChatModelList.shift.toString()] ??
            rateChatModelList.shift.toString();
    ratecodeController.text = rateChatModelList.rateCode.toString();
    registrationCodeController.text =
        rateChatModelList.registrationCode.toString();
    remarkController.text = rateChatModelList.remark.toString();
    faterateCowController.text = rateChatModelList.fateCow.toString();
    faterateBuffaloController.text = rateChatModelList.fateBuffalo.toString();
    faterateMixController.text = rateChatModelList.fateRateMix.toString();
    faterateOtherController.text = rateChatModelList.fateOther.toString();
    clrCowController.text = rateChatModelList.clrCow.toString();
    clrBuffaloController.text = rateChatModelList.clrBuffalo.toString();
    clrRateMixController.text = rateChatModelList.clrRateMix.toString();
    clrOtherController.text = rateChatModelList.clrOther.toString();
    snfCowController.text = rateChatModelList.snfCow.toString();
    snfRateMixController.text = rateChatModelList.snfRateMix.toString();
    snfOtherController.text = rateChatModelList.snfOther.toString();
    snfBuffaloController.text = rateChatModelList.snfBuffalo.toString();
  }

  DropdownButton<String> getShift(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in shifts(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      style: TextStyle(
          fontSize: 14.w, color: AppColor.black, fontWeight: FontWeight.w400),
      items: dropDownItems,
      value: shift ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        shift = value;
        shiftEn = shiftsOutput(context)[value] ?? value;
        shiftEdit = shiftEn;
        notifyListeners();
      },
    );
  }

  Future GetRateChartData() async {
    isLoading = true;
    rateChatModelList = await GetRateChartList();
    isLoading = false;
    notifyListeners();
  }

  List<RateChatModelDate> rateChatModelList = [];

  Future GetRateChartList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.rateChartList);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        rateChatModelList.clear();
        var jsonResponse = jsonDecode(response.body);
        RateChatModel rateChatModel = RateChatModel.fromJson(jsonResponse);
        List<RateChatModelDate> data = [];
        data = rateChatModel.data!;
        rateChatModelList.addAll(data);
        return rateChatModelList;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future addRateChart(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.addRateChartList);
      http.Response response = await http.post(ApiUrl, body: {
        "sh_date": dateController.text,
        "shift": shiftEn,
        "rate_code": ratecodeController.text,
        "remark": remarkController.text.toString(),
        "fate_cow": faterateCowController.text,
        "fate_buffalo": faterateBuffaloController.text,
        "fate_rate_mix": faterateMixController.text,
        "fate_other": faterateOtherController.text,
        "clr_cow": clrCowController.text,
        "clr_buffalo": clrBuffaloController.text,
        "clr_rate_mix": clrRateMixController.text,
        "clr_other": clrOtherController.text,
        "snf_cow": snfCowController.text,
        "snf_buffalo": snfBuffaloController.text,
        "snf_rate_mix": snfRateMixController.text,
        "snf_other": snfOtherController.text,
        "registration_code": registrationCodeController.text,
      }, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      });
      if (response.statusCode == 200) {
        isLoading = true;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          dataClear();
          GetRateChartData();
          Navigator.pop(context);
          snackMessage(context, data['message'], no: 2);
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

  String? id;

  Future editRatechartList(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.addRateChartList);
      http.Response response = await http.post(ApiUrl, body: {
        "sh_date": dateController.text.toString(),
        "shift": shiftEdit.toString(),
        "rate_code": ratecodeController.text.toString(),
        "remark": remarkController.text.toString(),
        "fate_cow": faterateCowController.text.toString(),
        "fate_buffalo": faterateBuffaloController.text.toString(),
        "fate_rate_mix": faterateMixController.text.toString(),
        "fate_other": faterateOtherController.text.toString(),
        "clr_cow": clrCowController.text.toString(),
        "clr_buffalo": clrBuffaloController.text.toString(),
        "clr_rate_mix": clrRateMixController.text.toString(),
        "clr_other": clrOtherController.text.toString(),
        "snf_cow": snfCowController.text.toString(),
        "snf_buffalo": snfBuffaloController.text.toString(),
        "snf_rate_mix": snfRateMixController.text.toString(),
        "snf_other": snfOtherController.text.toString(),
        'id': id.toString(),
      }, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
        // 'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        isLoading = false;
        notifyListeners();
        notifyListeners();
        if (data['success'] == true) {
          dataClear();
          GetRateChartData();
          Navigator.pop(context);
          snackMessage(context, data['message'], no: 2);
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

  void dataClear() {
    dateController.clear();
    clrBuffaloController.clear();
    clrCowController.clear();
    clrOtherController.clear();
    clrRateMixController.clear();
    snfBuffaloController.clear();
    snfCowController.clear();
    snfOtherController.clear();
    snfRateMixController.clear();
    ratecodeController.clear();
    registrationCodeController.clear();
    remarkController.clear();
    effeShiftController.clear();
    faterateBuffaloController.clear();
    faterateCowController.clear();
    faterateMixController.clear();
    faterateOtherController.clear();
    shift = null;
    shiftEn = null;
    shiftEdit = null;
    enabled = '1';
    notifyListeners();
  }

  Future DeleteRateChart(userId) async {
    try {
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.deleteRateChartList);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      }, body: {
        "id": userId
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        notifyListeners();
        return data;
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
