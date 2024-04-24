import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;
class ExportProvider with ChangeNotifier {
  TextEditingController qtyController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController clrController = TextEditingController();
  TextEditingController snfController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  void dataClear() {
    amountController.clear();
    qtyController.clear();
    fatController.clear();
    clrController.clear();
    snfController.clear();
    rateController.clear();
    shift = null;
    shiftEn = null;
    myRoute = null;
    myItemList = null;
  }

  bool isLoading = false;
  List RouteList = [];
  String ?myRoute;

  List itemList = [];
  String? myItemList;

  String ?shift;
  String ?shiftEn;
void changeRoute(value){
  myRoute=value;
  notifyListeners();
}void changeItem(value){
    myItemList=value;
  notifyListeners();
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
      items: dropDownItems,
      value: shift ?? AppLocalizations.of(context)!.select,
      onChanged: (value) {
        shift = value!;
        shiftEn=shiftsOutput(context)[value]??value;
        notifyListeners();
      },
    );
  }

  Future GetRouteList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.ROUTELIST);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        // ' Accept-Language': '${UserDetails.userLang}'
      });
      if (response.statusCode == 200) {
        RouteList.clear();
        notifyListeners();
        Map data = jsonDecode(response.body);
        RouteList.addAll(data['data']);
        notifyListeners();
      }
    } catch (e) {

    }
  }

  Future GetItemList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.itemList);
      http.Response
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

    }
  }

  Future AddExport(context) async {

    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.addexport);

      http.Response
        response = await http.post(ApiUrl, body: {
        "admin_id": UserDetails.parentId.toString(),
        'shift': shiftEn.toString(),
        'milk_type': myItemList.toString(),
        'qty': qtyController.text.toString(),
        'fat': fatController.text.toString(),
        'snf': snfController.text.toString(),
        'clr': clrController.text.toString(),
        'route': myRoute.toString(),
        'bmc_id': UserDetails.userUniId.toString(),
        "rate": rateController.text.toString(),
        "amount": amountController.text.toString(),
      }, headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Accept-Language': '${UserDetails.userLang}'
        });

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        if (data["success"] == true) {
          dataClear();
          GetExportListsData();
          snackMessage(context, data['message'],no: 2);
          Navigator.pop(context);
        }
      else if (data["success"] == false) {
          snackMessage( context, data['message']);
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
  Future<void> GetExportListsData() async {
    isLoading=true;
    exportData = await GetExportList();
    isLoading=false;
    notifyListeners();
  }

  List<ExportModelData> exportData = [];

  Future GetExportList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.export);
      http.Response response = await http.post(ApiUrl, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}'
      }, body: {
        "admin_id": UserDetails.parentId.toString(),
      });
      if (response.statusCode == 200) {
        exportData.clear();
        var jsonResponse = jsonDecode(response.body);
        ExportModel newsModel = ExportModel.fromJson(jsonResponse);
        exportData.addAll(newsModel.data!);
        return exportData;
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