
import 'package:milkdairy/all_import.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
class ReportProvider with ChangeNotifier{
  TextEditingController dateController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController searchControler = TextEditingController();
  bool isLoading=false;
  List searchMilkSlipList=[];
  List searchFarmerMilkBillList=[];
  List searchDipatchSliplList=[];
  List searchDipatchReportList=[];
  List searchPurchaseSummaryList=[];
  String? myItemList;
  String ?myFarmerList;
  String ?shift;
  String ?shiftEn;

void changeItem(value){
  myItemList=value;
  notifyListeners();
}void changeFarmer(value){
    myFarmerList=value;
  notifyListeners();
}
  void DataClean(){
    dateController.clear();
    fromDateController.clear();
    searchControler.clear();
    shift=null;
    shiftEn=null;
    milkSlip.clear();
    myItemList=null;
    myFarmerList=null;
    searchMilkSlipList.clear();
    searchFarmerMilkBillList.clear();
    searchDipatchSliplList.clear();
    searchDipatchReportList.clear();
    searchPurchaseSummaryList.clear();

  }

  void getInitDate(){
    final dateTime=DateTime.now();
    final initDate= DateFormat("yyyy-MM-dd").format(dateTime).toString();
    dateController=TextEditingController(text: initDate);
    fromDateController=TextEditingController(text: initDate);

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
      items: dropDownItems,
      value: shift??AppLocalizations.of(context)!.select,
      onChanged: (value) {
        shift = value;
        shiftEn=shiftsOutput(context)[value]??value;
        notifyListeners();
      },
    );
  }


  List<MilkSlipModelData> milkSlip =[];
  Future GetMilkSlipList() async {
    try{
      isLoading=true;
      notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.milkSlip);
    http.Response? response;
    response = await http.post(ApiUrl,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Accept-Language': '${UserDetails.userLang}'
    },body: {
      "shift":shiftEn.toString(),
          "date_field":dateController.text.toString()
    });


    if (response.statusCode == 200) {
      milkSlip.clear();
      isLoading = false;
      notifyListeners();
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }else{
      isLoading = false;
      notifyListeners();
    }
    }catch(e){
      isLoading = false;
      notifyListeners();
    }
  }


  List searchNames(String query){
    query=query.toLowerCase();
    notifyListeners();
    return milkSlip.where((name) {
      final fullName ='${name.userUniId}  ${name.registrationCode}'.toLowerCase();
      return fullName.contains(query);
    },).toList();
  }

  List searchFarmerMilkbill(String query){
    query=query.toLowerCase();
    notifyListeners();
    return farmerMilkBill.where((name) {
      final fullName ='${name.userUniId}  ${name.registrationCode}'.toLowerCase();
      return fullName.contains(query);
    },).toList();
  }
  List searchDispatchSlip(String query){
    query=query.toLowerCase();
    notifyListeners();
    return dispatchSlip.where((name) {
      final fullName ='${name.id}'.toLowerCase();
      return fullName.contains(query);
    },).toList();
  }
  List searchDispatchReport(String query){
    query=query.toLowerCase();
    notifyListeners();
    return dispatchReport.where((name) {
      final fullName ='${name.id}'.toLowerCase();
      return fullName.contains(query);
    },).toList();
  }
 List searchPurchaseSummary(String query){
    query=query.toLowerCase();
    notifyListeners();
    return purchaseSummary.where((name) {
      final fullName ='${name.id}'.toLowerCase();
      return fullName.contains(query);
    },).toList();
  }


  List<FarmerMilkBillModelData> farmerMilkBill =[];
  Future GetFarmerMilkBillList() async {
    try{
      isLoading = true;
      notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.farmerMilkBillReport);
    http.Response? response;
    response = await http.post(ApiUrl,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Accept-Language': '${UserDetails.userLang}'
    },body: {
      "to_date":dateController.text.toString(),
      "from_date":fromDateController.text.toString(),
      "milk_type":myItemList.toString(),
      "farmer_id":myFarmerList.toString(),
    });


    if (response.statusCode == 200) {
      farmerMilkBill.clear();
      isLoading = false;
      notifyListeners();
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }else{
      isLoading = false;
      notifyListeners();
    } }catch(e){
      isLoading = false;
      notifyListeners();
    }
  }

  List<DispatchModelData> dispatchSlip =[];
  Future GetDispatchSlipList() async {
    try{
      isLoading = true;
      notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.dispatchSlip);
    http.Response? response;
    response = await http.post(ApiUrl,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Accept-Language': '${UserDetails.userLang}'
    },body: {
      "date":dateController.text.toString(),
      "shift":shiftEn.toString()
    });

    if (response.statusCode == 200) {
      dispatchSlip.clear();
      isLoading = false;
      notifyListeners();
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }else{
      isLoading = false;
      notifyListeners();
    }}catch(e){
      isLoading = false;
      notifyListeners();
    }
  }

  List<DispatchReportModelData> dispatchReport =[];
  Future GetDispatchReportList() async {
    try{
      isLoading = true;
      notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.dispatchReport);
    http.Response? response;
    response = await http.post(ApiUrl,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Accept-Language': '${UserDetails.userLang}'
    },body: {
      "from_date":fromDateController.text.toString(),
      "to_date":dateController.text.toString(),
      "shift":shiftEn.toString(),
      "milk_type":myItemList.toString(),
    });


    if (response.statusCode == 200) {
      dispatchReport.clear();
      isLoading = false;
      notifyListeners();
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }else{
      isLoading = false;
      notifyListeners();
    } }catch(e){
      isLoading = false;
      notifyListeners();
    }
  }

  List<PurchaseSummaryModelData> purchaseSummary =[];
  Future GetPurchaseSummaryList() async {
    try{
      isLoading = true;
      notifyListeners();
    var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.purchaseSummary);
    http.Response? response;
    response = await http.post(ApiUrl,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Accept-Language': '${UserDetails.userLang}'
    },body: {
      "from_date":fromDateController.text.toString(),
      "to_date":dateController.text.toString(),
      "shift":shiftEn.toString(),
      "milk_type":myItemList.toString(),
    });


    if (response.statusCode == 200) {
      purchaseSummary.clear();
      isLoading = false;
      notifyListeners();
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }else{
      isLoading = false;
      notifyListeners();
    }}catch(e){
      isLoading = false;
      notifyListeners();
    }
  }
}