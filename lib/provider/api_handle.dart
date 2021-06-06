import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testriver/api/dummy_data.dart';
import 'package:testriver/model/user/user.dart';

class UserProvider extends StateNotifier<List<User>> {
  UserProvider(List<User> state) : super(state);

  Future<List> getAllUserWR() async {
    var userDataList = await GetData.getAllUser();
    state = userDataList;
    return state;
  }

  void getAllUser() async {
    var userDataList = await GetData.getAllUser();
    state = userDataList;
  }

  void getAllUserFavColor(Color favColor) async {
    var userDataList = await GetData.getUserByColor(favColor);
    state = userDataList;
    print("================userDataList =================");
    print(state);
    print("===============userDataList - END ==================");
  }
}
