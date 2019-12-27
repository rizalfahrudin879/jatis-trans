import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  static final baseURL = "http://adityo.xyz/jatis_trans";
  static final loginURL = baseURL + "/login.php";
  static final regisURL = baseURL + "/registrasi.php";
  static final poolURL = baseURL + "/get_pool.php";
  static final searchPoolURL = baseURL + '/pencarian.php';
  static final routeURL = baseURL + '/cari_bus.php';
  static UserRepository _instance = UserRepository.internal();
  UserRepository.internal();
  factory UserRepository() => _instance;

  Future<dynamic> login({String email, String password}) async {
    var statusError;
    Map<String, String> body = {
      "email": email,
      "password": password,
    };

    await http
        .post(
      loginURL,
      headers: {"Accept": "application/json"},
      body: body,
    )
        .then(
      (response) {
        statusError = response.body;
      },
    );
    return Response.fromJson(json.decode(statusError));
  }

  Future<dynamic> regis(
      {String userName, String phonoNo, String email, String password}) async {
    var statusError;
    Map<String, String> body = {
      "user_name": userName,
      "phone_no": phonoNo,
      "email": email,
      "password": password,
    };

    await http
        .post(
      regisURL,
      headers: {"Accept": "application/json"},
      body: body,
    )
        .then(
      (response) {
        statusError = response.body;
      },
    );
    return Response.fromJson(json.decode(statusError));
  }

  Future<List> getPool() async {
    var statusList;
    await http.get(poolURL).then((response) {
      statusList = response.body;
    });
    return json.decode(statusList);
  }

  Future<dynamic> searchPool({String filter}) async {
    String sult = filter;
    var res;
    await http.get(searchPoolURL + '?pool_name=$sult').then((response) {
      res = response.body;
    });
    return json.decode(res);
  }

  Future<dynamic> searchRoute({String dariId, String keId, String date}) async {
    var res;
    await http.get(routeURL + '?dari_id=' + dariId + '&ke_id=' + keId+' & time_dari=' + date).then((response){
      res = response.body;
    });
    return json.decode(res);
  }
}



class Response {
  final String status;
  final String userName;
  Response({this.status, this.userName});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      userName: json['user_name'],
    );
  }
}
