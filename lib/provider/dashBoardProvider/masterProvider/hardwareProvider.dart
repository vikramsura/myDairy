import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class HardwareProvider with ChangeNotifier {
  bool isLoading = false;
  var enabled = '1';
  String? hardwareType;
  String? hardwareTypeEdit;
  String? hardwareTypeEn;

  String? parityName;
  String? parityNameEdit;
  String? parityNameEn;

  String? continuousStr;
  String? continuousStrEdit;
  String? continuousStrEn;
  String? flowControl;
  String? flowControlEn;
  String? flowControlEdit;

  TextEditingController hwname = TextEditingController();
  TextEditingController broudrate = TextEditingController();
  TextEditingController databits = TextEditingController();
  TextEditingController stopbits = TextEditingController();
  TextEditingController noofstring = TextEditingController();
  TextEditingController stringlength = TextEditingController();
  TextEditingController startingchar = TextEditingController();
  TextEditingController tarechart = TextEditingController();

  void cleanData(context) {
    hwname.clear();
    broudrate.clear();
    databits.clear();
    stopbits.clear();
    noofstring.clear();
    stringlength.clear();
    startingchar.clear();
    tarechart.clear();
    hardwareType = null;
    parityName = null;
    parityNameEdit = null;
    parityNameEn = null;
    continuousStr = null;
    continuousStrEdit = null;
    continuousStrEn = null;
    flowControl = null;
    flowControlEn = null;
    flowControlEdit = null;
    hardwareTypeEn = null;
    hardwareTypeEdit = null;
    enabled = '1';
    notifyListeners();
  }

  void changeValues(value) {
    enabled = value;
    notifyListeners();
  }

  DropdownButton<String> getHardware(context, {hardwareData}) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in hardwarename(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: hardwareType ?? AppLocalizations.of(context)?.select,
      onChanged: (value) {
        hardwareType = value;
        hardwareTypeEn = hardwareOutput(context)[value] ?? value;
        hardwareTypeEdit=hardwareTypeEn;
        notifyListeners();
      },
    );
  }

  void initData(context, HardwareModeleData hardwaredetails) {
    flowControlEdit == null
        ? flowControlEdit = hardwaredetails.flowControl.toString()
        : flowControlEdit = flowControlEn;
    continuousStrEdit == null
        ? continuousStrEdit = hardwaredetails.contStr.toString()
        : continuousStrEdit = continuousStrEn;
    hardwareTypeEdit == null
        ? hardwareTypeEdit = hardwaredetails.hwType.toString()
        : hardwareTypeEdit = hardwareTypeEn;
    parityNameEdit == null
        ? parityNameEdit = hardwaredetails.parity.toString()
        : parityNameEdit = parityNameEn;
    flowControl =
        flowControlInput(context)[hardwaredetails.flowControl.toString()] ??
            hardwaredetails.flowControl.toString();
    hardwareType = hardwareInput(context)[hardwaredetails.hwType.toString()] ??
        hardwaredetails.hwType.toString();
    parityName = parityInput(context)[hardwaredetails.parity.toString()] ??
        hardwaredetails.parity.toString();
    continuousStr =
        continuousStrInput(context)[hardwaredetails.contStr.toString()] ??
            hardwaredetails.contStr.toString();
    stopbits.text = hardwaredetails.stopBits.toString();
    hardData = hardwaredetails.id.toString();
    hwname.text = hardwaredetails.hwName.toString();
    broudrate.text = hardwaredetails.baudRate.toString();
    databits.text = hardwaredetails.dataBits.toString();
    noofstring.text = hardwaredetails.noStr.toString();
    stringlength.text = hardwaredetails.strLen.toString();
    startingchar.text = hardwaredetails.strChar.toString();
    tarechart.text = hardwaredetails.tarChar.toString();
  }

  DropdownButton<String> getParity(context, {hardWredetail}) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in parity(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: parityName ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        parityName = value;
        parityNameEn = parityOutput(context)[value] ?? value;
        parityNameEdit=parityNameEn;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getContinuousstr(context) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in continuousStrList(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: continuousStr ?? AppLocalizations.of(context)!.no,
      onChanged: (value) {
        continuousStr = value;
        continuousStrEn = continuousStrOutput(context)[value] ?? value;
        continuousStrEdit=continuousStrEn;
        notifyListeners();
      },
    );
  }

  DropdownButton<String> getFlowControl(
    context,
  ) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in flowControlList(context)) {
      var item = DropdownMenuItem(
        child: Text(des),
        value: des,
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: flowControl ?? AppLocalizations.of(context)!.no,
      onChanged: (value) {
        flowControl = value;
        flowControlEn = flowControlOutput(context)[value] ?? value;
        flowControlEdit=flowControlEn;
        notifyListeners();
      },
    );
  }

  Future AddHardware(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.addHardwareList);

      http.Response
        response = await http.post(ApiUrl, body: {
        'hw_type': hardwareTypeEn.toString(),
        'hw_name': hwname.text.toString(),
        'baud_rate': broudrate.text.toString(),
        'data_bits': databits.text.toString(),
        'stop_bits': stopbits.text.toString(),
        'parity': parityNameEn.toString(),
        'no_str': noofstring.text.toString(),
        'cont_str': continuousStrEn == null ?continuousStrEn = "No" : continuousStrEn.toString(),
        'flow_control': flowControlEn == null ?flowControlEn = "No" : flowControlEn.toString(),
        'str_len': stringlength.text.toString(),
        'str_char': startingchar.text.toString(),
        'tar_char': tarechart.text.toString(),
      }, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);

        if (data['success'] == true) {
          cleanData(context);
         GetHardwareListData();
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

  String? hardData;

  Future editHardwareDetail(context) async {
    print("ee...$hardwareTypeEdit");
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.addHardwareList);

      http.Response

        response = await http.post(ApiUrl, body:  {
        'hw_type': hardwareTypeEdit.toString(),
        'hw_name': hwname.text.toString(),
        'baud_rate': broudrate.text.toString(),
        'data_bits': databits.text.toString(),
        'stop_bits': stopbits.text.toString(),
        'parity': parityNameEdit.toString(),
        'no_str': noofstring.text.toString(),
        'cont_str': continuousStrEdit.toString(),
        'flow_control': flowControlEdit.toString(),
        'str_len': stringlength.text.toString(),
        'str_char': startingchar.text.toString(),
        'tar_char': tarechart.text.toString(),
        'id': hardData.toString(),
      }, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          cleanData(context);
          GetHardwareListData();
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


  Future<void> GetHardwareListData() async {
    isLoading = true;
    HardwareList = await GetHardwareList();
    isLoading = false;
    notifyListeners();
  }
  List<HardwareModeleData> HardwareList = [];

  Future GetHardwareList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.hardwareList);
      http.Response
      response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
        'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        HardwareList.clear();
        var jsonResponse = jsonDecode(response.body);
        HardwareModele rateChatModel = HardwareModele.fromJson(jsonResponse);
        List<HardwareModeleData> data = [];
        data = rateChatModel.data!;
        HardwareList.addAll(data);
        return HardwareList;
      }else{
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future DeleteHardware(userId) async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.deleteHardware);
      http.Response
      response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      }, body: {
        "id": userId
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }else{}
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
