import 'dart:convert';

import 'package:assignment/app/datatable_source/user_data_source.dart';
import 'package:assignment/app/models/UserListModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getUsersList();
  }

  RxBool isLoading = false.obs;
  RxList usersList = RxList.empty();
  Rxn<UsersDataSource> usersListDataSource = Rxn();

  Future<void> getUsersList() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse('https://dummyjson.com/users'),
    );
    if (response.body.isNotEmpty) {
      print(response.body);
      var responseModel = jsonDecode(response.body);
      print(responseModel);
      usersList.assignAll(responseModel['users']!);
      usersListDataSource.value = UsersDataSource(userData: usersList);
    }
    isLoading.value = false;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
