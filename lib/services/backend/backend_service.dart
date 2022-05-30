import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:blooddonation/misc/env.dart' as env;

export './requests/get_free_appointments.dart';

class BackendService {
  //Singleton
  static final BackendService _instance = BackendService._private();
  factory BackendService() => _instance;
  BackendService._private() {
    print("Starting Backend Service");
  }

  Future<http.Response> getRequest({
    required String path,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(env.API_ADDRESS + path);
    Map<String, String> newHeaders = headers ?? {};
    newHeaders["signature"] = _genSignature(body: "", method: "GET", path: path);

    return http.get(uri, headers: newHeaders);
  }

  Future<http.Response> postRequest({
    required String path,
    required String body,
    Map<String, String>? headers,
  }) {
    Uri uri = Uri.parse(env.API_ADDRESS + path);
    Map<String, String> newHeaders = headers ?? {};

    newHeaders["Content-Type"] = "application/json";
    newHeaders["signature"] = _genSignature(body: body, method: "POST", path: path);

    return http.post(uri, body: body, headers: newHeaders);
  }
}

String genParam({required String key, required String value}) => "$key=$value";

String _genSignature({
  required String body,
  required String method,
  required String path,
}) {
  print(path);
  // ignore: parameter_assignments
  path = path.split("?")[0];
  print(path);

  var secret = env.API_TOKEN;
  var secretEnc = utf8.encode(secret);

  var bytes = utf8.encode("$secret-$method-$path-$body");

  print("bytes: $secret-$method-$path-$body");

  var hmac = Hmac(sha256, secretEnc);
  var hash = hmac.convert(bytes);

  var signature = base64Encode(hash.bytes);

  print("signature: $signature");

  return signature;
}
