import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class FarmerProvier with ChangeNotifier {
  bool isenable = true;
  bool isPress = false;
  bool isLoading = false;
  var enable = '1';

  TextEditingController dateControler = TextEditingController();
  TextEditingController searchControler = TextEditingController();
  TextEditingController RegCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController BankNameController = TextEditingController();
  TextEditingController BankHolderNameController = TextEditingController();
  TextEditingController BankAccountNoController = TextEditingController();
  TextEditingController IFSCController = TextEditingController();
  TextEditingController BranchNameController = TextEditingController();
  String? id;
  List searchFarmerList = [];

  void changeBack() {
    searchFarmerList.clear();
    enable = "1";
    searchControler.clear();
    cleanData();
  }

  void changeTap(no) {
    searchFarmerList.clear();
    searchControler.clear();
    enable = no;
    notifyListeners();
  }

  Future addFarmer(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.addFarmer);
      http.Response response = await http.post(ApiUrl, body: {
        'name': nameController.text,
        'phone': PhoneController.text,
        'registration_code': RegCodeController.text,
        'address': AddressController.text,
        'birth_date': dateControler.text,
        'acc_holder_name': BankHolderNameController.text,
        'bank_acc_no': BankAccountNoController.text,
        'bank_name': BankNameController.text,
        'branch_name': BranchNameController.text,
        'ifsc_code': IFSCController.text,
      }, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        'Accept-Language': '${UserDetails.userLang}',
      });
      print("rr...${response.body}");
      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          cleanData();
          GetFarmerListsData();
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

  void intadd(farmerData) {
    id = farmerData.id.toString();
    nameController = TextEditingController(text: farmerData.name.toString());
    RegCodeController =
        TextEditingController(text: farmerData.registrationCode.toString());
    AddressController =
        TextEditingController(text: farmerData.userProfile?.address.toString());
    dateControler = TextEditingController(
        text: farmerData.userProfile?.birthDate.toString());
    PhoneController = TextEditingController(text: farmerData.phone.toString());
    BankNameController =
        TextEditingController(text: farmerData.bankDetail?.bankName.toString());
    BankHolderNameController = TextEditingController(
        text: farmerData.bankDetail?.accHolderName.toString());
    BankAccountNoController = TextEditingController(
        text: farmerData.bankDetail?.bankAccNo.toString());
    IFSCController =
        TextEditingController(text: farmerData.bankDetail?.ifscCode.toString());
    BranchNameController = TextEditingController(
        text: farmerData.bankDetail?.branchName.toString());
  }

  Future EditFarmerList(context) async {
    try {
      isLoading = true;
      notifyListeners();
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.editFarmer);

      http.Response response = await http.post(ApiUrl, body: {
        'name': nameController.text.toString(),
        'address': AddressController.text.toString(),
        'birth_date': dateControler.text.toString(),
        'bank_name': BankNameController.text.toString(),
        'acc_holder_name': BankHolderNameController.text.toString(),
        'bank_acc_no': BankAccountNoController.text.toString(),
        'ifsc_code': IFSCController.text.toString(),
        'branch_name': BranchNameController.text.toString(),
        'id': id.toString(),
      }, headers: {
        'Authorization': 'Bearer ${UserDetails.userAuthToken}',
        // 'Content-Type': 'application/json',
        'Accept-Language': '${UserDetails.userLang}'
      });

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        if (data['success'] == true || data['success'] != null) {
          cleanData();
          GetFarmerListsData();
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

  Future<void> GetFarmerListsData() async {
    isLoading = true;
    FarmerList = await GetFarmerList();
    isLoading = false;
    notifyListeners();
  }

  List<FarmerModeleData> FarmerList = [];

  Future GetFarmerList() async {
    try {
      var ApiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.farmerList);
      http.Response response = await http.post(
        ApiUrl,
        headers: {
          'Authorization': 'Bearer ${UserDetails.userAuthToken}',
          'Content-Type': 'application/json',
          'Accept-Language': '${UserDetails.userLang}'
        },
      );
      if (response.statusCode == 200) {
        FarmerList.clear();
        var jsonResponse = jsonDecode(response.body);
        FarmerModele rateChatModel = FarmerModele.fromJson(jsonResponse);
        List<FarmerModeleData> data = [];
        data = rateChatModel.data!;
        FarmerList.addAll(data);
        return FarmerList;
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  void cleanData() {
    dateControler.clear();
    nameController.clear();
    PhoneController.clear();
    BankAccountNoController.clear();
    BankHolderNameController.clear();
    BankNameController.clear();
    BranchNameController.clear();
    AddressController.clear();
    RegCodeController.clear();
    IFSCController.clear();
    enable = '1';
    notifyListeners();
  }

  List searchNames(String query) {
    query = query.toLowerCase();
    notifyListeners();
    return FarmerList.where(
      (name) {
        final fullName = '${name.name}  ${name.registrationCode}'.toLowerCase();
        return fullName.contains(query);
      },
    ).toList();
  }
}
