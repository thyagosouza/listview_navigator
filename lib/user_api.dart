import 'dart:convert';

import 'package:flutter/material.dart';

import 'user_model.dart';

class UsersApi {
  // static Future<List<User>> getUsers() async {
  //   const url =
  //       'https://firebasestorage.googleapis.com/v0/b/web-johannesmilke.appspot.com/o/other%2Fvideo126%2Fusers.json?alt=media';
  //   final response = await http.get(Uri.parse(url));
  //   final body = json.decode(response.body);

  //   return body.map<User>(User.fromJson).toList();
  // }

  static Future<List<UserModel>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/sample_users.json');
    final body = json.decode(data);

    return body.map<UserModel>(UserModel.fromJson).toList();
  }
}
