import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:milkdairy/Model/summaryModele.dart';
import 'package:milkdairy/all_import.dart';

class AutomaticProvider with ChangeNotifier {
  void intadd(context) {
    if (dataList.isNotEmpty) {
      shiftEdit == null
          ? shiftEdit = dataList[0].shift.toString()
          : shiftEdit = shiftEn;
      dateControler =
          TextEditingController(text: dataList[0].shDate.toString());
      sampleControler =
          TextEditingController(text: dataList[0].sampleNo.toString());
      farmerControler =
          TextEditingController(text: dataList[0].userUniId.toString());
      qtyControler = TextEditingController(text: dataList[0].qty.toString());
      fatControler = TextEditingController(text: dataList[0].fat.toString());
      amountControler =
          TextEditingController(text: dataList[0].totalAmount.toString());
      rateControler = TextEditingController(text: dataList[0].amt.toString());
      clrController = TextEditingController(text: dataList[0].clr.toString());
      snfController = TextEditingController(text: dataList[0].snf.toString());

      milkController =
          TextEditingController(text: dataList[0].milkType.toString());
      shift = shiftsInput(context)[dataList[0].shift.toString()] ??
          dataList[0].shift.toString();
    }
  }

  TextEditingController dateControler = TextEditingController();
  TextEditingController nameControler =
      TextEditingController(text: UserDetails.userDairyName.toString());
  TextEditingController sampleControler = TextEditingController();
  TextEditingController farmerControler = TextEditingController();
  TextEditingController qtyControler = TextEditingController();
  TextEditingController fatControler = TextEditingController();
  TextEditingController amountControler = TextEditingController();
  TextEditingController rateControler = TextEditingController();
  TextEditingController clrController = TextEditingController();
  TextEditingController snfController = TextEditingController();
  TextEditingController milkController = TextEditingController();
  TextEditingController totalCanController = TextEditingController();
  TextEditingController totalQtyController = TextEditingController();
  TextEditingController tankerNoController = TextEditingController();

  String? myItemList;
  String? myFarmerList;
  bool isLoading = false;
  bool isEdit = true;

  void changeItem(value) {
    myItemList = value;
    milkController.text = value;
    notifyListeners();
  }

  void changeFarmer(value) {
    myFarmerList = value;
    farmerControler.text = value;
    notifyListeners();
  }

  void changeEdit(value) {
    isEdit = value;
    notifyListeners();
  }

  void dataclean() {
    totalCanController.clear();
    totalQtyController.clear();
    tankerNoController.clear();
    milkController.clear();
    clrController.clear();
    snfController.clear();
    sampleControler.clear();
    farmerControler.clear();
    qtyControler.clear();
    fatControler.clear();
    amountControler.clear();
    rateControler.clear();
    myFarmerList = null;
    myItemList = null;
    shift = null;
    shiftEn = null;
    shiftEdit = null;
    printSlip = null;
    buff = null;
    collMethod = null;
    notifyListeners();
  }

  String? shift;
  String? shiftEn;
  String? shiftEdit;

  String? printSlip;
  String? collMethod;
  String? buff;

  void getInitDate() {
    final dateTime = DateTime.now();
    final initDate = DateFormat("yyyy-MM-dd").format(dateTime).toString();
    dateControler = TextEditingController(text: initDate);
  }

  DropdownButton<String> GetShift(context) {
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
        notifyListeners();
      },
    );
  }

  Future AddMilkCollection() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.addMilkCollection);
      Map AddMilkParameters = {
        "sh_date": dateControler.text.toString(),
        'shift': shiftEn.toString(),
        'milk_type': myItemList.toString(),
        'qty': qtyControler.text.toString(),
        'fat': fatControler.text.toString(),
        'clr': clrController.text.toString(),
        'snf': snfController.text.toString(),
        'amt': rateControler.text.toString(),
        'total_amount': amountControler.text.toString(),
        'sample_no': sampleControler.text.toString(),
        'farmer_id': myFarmerList
      };

      http.Response? response;

      if (AddMilkParameters.isNotEmpty) {
        response = await http.post(ApiUrl, body: AddMilkParameters, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
          // 'Content-Type': 'application/json',
        });
      }
      var data = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        isLoading = false;
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

  Future EditMilkCollection() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.editMilkCollection);
      Map AddMilkParameters = {
        "sh_date": dateControler.text.toString(),
        'shift': shiftEdit.toString(),
        'milk_type': myItemList.toString(),
        'qty': qtyControler.text.toString(),
        'fat': fatControler.text.toString(),
        'clr': clrController.text.toString(),
        'snf': snfController.text.toString(),
        'amt': rateControler.text.toString(),
        'total_amount': amountControler.text.toString(),
        'sample_no': sampleControler.text.toString(),
        'farmer_id': myFarmerList.toString()
      };

      http.Response? response;

      if (AddMilkParameters.isNotEmpty) {
        response = await http.post(ApiUrl, body: AddMilkParameters, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });
      }
      var data = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        isLoading = false;
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

  Future<void> GetItemData() async {
    itemList = await GetItemList();
    notifyListeners();
  }

  List<IteamModeleData> itemList = [];

  Future GetItemList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.itemList);

      http.Response? response;

      response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        itemList.clear();
        notifyListeners();
        var jsonResponse = jsonDecode(response.body);
        IteamModele rateChatModel = IteamModele.fromJson(jsonResponse);
        List<IteamModeleData> data = [];
        data = rateChatModel.data!;
        itemList.addAll(data);
        return itemList;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> GetFarmerListsData() async {
    FarmerList = await GetFarmerList();
    notifyListeners();
  }

  List<FarmerModeleData> FarmerList = [];

  Future GetFarmerList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.farmerList);

      http.Response? response;

      response = await http.post(
        ApiUrl,
        headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Content-Type': 'application/json',
          'Accept-Language': '${UserDetails.userLang}'
        },
      );

      if (response.statusCode == 200) {
        FarmerList.clear();
        notifyListeners();
        var jsonResponse = jsonDecode(response.body);
        FarmerModele rateChatModel = FarmerModele.fromJson(jsonResponse);
        List<FarmerModeleData> data = [];
        data = rateChatModel.data!;
        FarmerList.addAll(data);
        return FarmerList;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  List<MilkCollectionModleData> dataList = [];

  Future GetMilkCollectionList() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl =
          Uri.parse(ApiConstant.baseurl + ApiConstant.getMilkCollection);
      http.Response? response;
      response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      }, body: {
        "farmer_id": myFarmerList.toString(),
        "shift": shiftEn.toString(),
        "sample_no": sampleControler.text.toString(),
        "sh_date": dateControler.text.toString(),
      });

      if (response.statusCode == 200) {
        isLoading = false;
        dataList.clear();
        notifyListeners();
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future AddSimpleDispatch() async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.simpledispatch);
      Map AddMilkParameters = {
        "sh_date": dateControler.text.toString(),
        "total_can": totalCanController.text.toString(),
        "total_qty": totalQtyController.text.toString(),
        "fat": fatControler.text.toString(),
        "tanker_no": tankerNoController.text.toString(),
        'shift': shiftEn.toString(),
        'milk_type': myItemList.toString(),
      };

      http.Response? response;

      if (AddMilkParameters.isNotEmpty) {
        response = await http.post(ApiUrl, body: AddMilkParameters, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
          // 'Content-Type': 'application/json',
        });
      }
      var data = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        isLoading = false;
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

  SummaryModeleData data = SummaryModeleData();

  Future GetSummaryList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.milksummary);
      http.Response? response;
      response = await http.post(
        ApiUrl,
        headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Content-Type': 'application/json',
          'Accept-Language': '${UserDetails.userLang}'
        },
      );
      if (response.statusCode == 200) {
        data.summary?.clear();
        data.overallTotals = null;
        notifyListeners();
        var jsonResponse = jsonDecode(response.body);
        SummaryModele rateChatModel = SummaryModele.fromJson(jsonResponse);
        data = rateChatModel.data!;
        return data;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
