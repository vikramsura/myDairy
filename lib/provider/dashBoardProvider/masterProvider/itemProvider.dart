import 'package:milkdairy/all_import.dart';
import 'package:http/http.dart' as http;

class ItemProvider with ChangeNotifier {
  bool isLoading = false;
  Future<void> GetItemData()async {
    isLoading=true;
    itemList= await GetItemList();
    isLoading=false;
    notifyListeners();
  }
  List<IteamModeleData> itemList = [];

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
        var jsonResponse = jsonDecode(response.body);
        IteamModele rateChatModel = IteamModele.fromJson(jsonResponse);
        List<IteamModeleData> data = [];
        data = rateChatModel.data!;
        itemList.addAll(data);
        return itemList;
      }else{
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
}
