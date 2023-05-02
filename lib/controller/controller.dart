import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:technical_test/model/datamodel.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    fetchDataFromAPI();
  }

  var isloading = true.obs;
  DataModel? dataFromAPI;

  fetchDataFromAPI() async {
    try {
      String url = "https://api.npoint.io/30bd2c680d812dd23df1";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(jsonDecode(res.body)).obs();
        update();
        isloading.value = false;
      } else {
        Get.snackbar("Ok", "ok");
      }
    } catch (e) {
      print("Error Fetching Data");
    }
  }
}
