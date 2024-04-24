import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:milkdairy/allData/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:milkdairy/allData/SharedPreferences.dart';


class SittingProvider with ChangeNotifier{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oPasswordController = TextEditingController();
  TextEditingController nPasswordController = TextEditingController();
  bool isLoading =false;
  List AdminList = [];
  bool isPasswordVisible = true;
  bool isPasswordVisibles = true;

void changeShow(){
  isPasswordVisible=!isPasswordVisible;
  notifyListeners();
}
void changeShows(){
  isPasswordVisibles=!isPasswordVisibles;
  notifyListeners();
}

  Future ResetPassword() async {
try{
    var ApiUrl =
    Uri.parse(ApiConstant.baseurl + ApiConstant.changePassword);
    Map resetPassword = {
      'old_password': oPasswordController.text.toString(),
      'password': nPasswordController.text.toString(),
    };

    http.Response response = await http.post(ApiUrl, body: resetPassword,headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken!}',
      // 'Content-Type': 'application/json',
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }}catch(e){
  isLoading = false;
  notifyListeners();
}
  }

  void DataClean() {
    nPasswordController.clear();
    oPasswordController.clear();
    notifyListeners();

  }


  Future UsersLogout() async {
    try{
    isLoading=true;
    notifyListeners();

    var apiUrl = Uri.parse(ApiConstant.baseurl + ApiConstant.logout);
    http.Response? response;

    response = await http.post(apiUrl, headers: {
      'Authorization': 'Bearer ${UserDetails.userAuthToken}',
      'Content-Type': 'application/json',
      'Accept-Language': '${UserDetails.userLang}'
    });
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      isLoading=false;
      notifyListeners();
      return data;
    } else {
      isLoading=false;
      notifyListeners();
    }}catch(e){
      isLoading = false;
      notifyListeners();
    }
  }
}