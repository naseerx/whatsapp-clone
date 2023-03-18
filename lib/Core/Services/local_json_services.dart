import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_whatsapp_clone/Core/Models/users_model.dart';

class LocalJsonServices {
  Future<List<UserModel>> getAllData(
      BuildContext context, String searchQuery) async {
    var myData = <UserModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data.json');
    var jsonData = json.decode(data);
    var jsonSchedule = jsonData['users'];

    for (var jsonMatch in jsonSchedule) {
      UserModel match = UserModel.fromJSON(jsonMatch);
      myData.add(match);
      if (searchQuery.isNotEmpty) {
        myData = myData
            .where((item) => item.name.toLowerCase().contains(searchQuery))
            .toList();
      }
    }

    return myData;
  }
}
