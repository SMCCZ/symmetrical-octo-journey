import 'dart:convert';

import 'package:http/http.dart';
import 'package:symmetrical_octo_journey/api/api.dart';

import '../../models/user.dart';

var headersList = {
  'Accept': '*/*',
};
Future<dynamic> getAPICall({required String api}) async {
  var url = Uri.parse(api);
  var req = Request('GET', url);
  req.headers.addAll(headersList);
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    return resBody;
  } else {
    print(res.reasonPhrase);
    return res.reasonPhrase;
  }
}

Future<User?> getUser() async {
  try {
    var data = await getAPICall(api: localUserGetAPI);
    print(data);
    var userJson = jsonDecode(data);
    var user = User.fromJson(userJson);
    return user;
  } catch (e) {
    print(e);
    return null;
  }
}
