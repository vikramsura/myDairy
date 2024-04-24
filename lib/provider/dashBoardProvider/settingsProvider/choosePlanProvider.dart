import 'package:http/http.dart' as http;
import 'package:milkdairy/Model/plansModel.dart';
import 'package:milkdairy/all_import.dart';

class ChoosePlanProvider extends ChangeNotifier {
  bool isLoading = false;
  void DataClean() {}

  List<PlansModelData> plansList = [];

  Future plans() async {
    try {
      isLoading = true;
      var apiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.plans);
      http.Response? response;
      response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        plansList.clear();
        isLoading = false;
        notifyListeners();
        var data = jsonDecode(response.body);
        PlansModel plansModel = PlansModel.fromJson(data);
        plansList.addAll(plansModel.data!);
        return plansList;
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
