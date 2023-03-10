import 'dart:convert';

import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import '../models/journal.dart';

class JournalService {
  static const String url = "http://ip:3000/";
  static const String resource = "journals/";

  http.Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()]
  );

  String getURL() {
    return "$url$resource";
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<bool> register(Journal journal) async {
    String jsonJournal = json.encode(journal.toMap());

    http.Response response =
        await client.post(
            getUri(),
            headers: {'Content-Type': 'application/json'},
            body: jsonJournal);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(getUri());
    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Journal> result = [];
    List<dynamic> jsonList = json.decode(response.body);

    for (var jsonMap in jsonList) {
      result.add(Journal.fromMap(jsonMap));
    }

    return result;
  }





}
