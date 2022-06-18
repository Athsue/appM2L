import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Livre {
  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static Future<List> getAllLivre() async {
    try {
      var res = await http.get(Uri.parse(baseUrl + '/posts'));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Login(BuildContext context, username, password) async {
    try {
      var apiURL = "http://192.168.56.1:45380/api/auth/login/";
      var connection = {"username": username, "password": password};
      var bodyEncoded = json.encode(connection);
      var res = await http.post(Uri.parse(apiURL),
          body: bodyEncoded, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },);
      log("${res.reasonPhrase}");   
      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static ajout(BuildContext context, title, body) async {
    try {
      Map<String, dynamic> data = {"title": title, "body": body};
      var res = await http.post(Uri.parse(baseUrl + '/posts'), body: data);
      if (res.statusCode == 201) {
        Navigator.pushNamed(context, '/liste', arguments: res.body);
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}
