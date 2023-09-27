import 'package:dio/dio.dart';
import 'dart:convert';

Future<List<Map<String, dynamic>>> getTodoItems() async {
  var dio = Dio();
  var response = await dio.get(
    'http://zeyaddiaa-001-site1.ftempurl.com/api/Todo/get-items',
  );

  //print(response);
  if (response.statusCode == 200) {
    final responseData = response.data as List<dynamic>;
    final items =
        responseData.map((item) => item as Map<String, dynamic>).toList();
    //print(json.encode(items));
    return items;
  }

  return [];
}

Future<List<Map<String, dynamic>>> getTodoItem(String id) async {
  var dio = Dio();
  var response = await dio.get(
    'http://zeyaddiaa-001-site1.ftempurl.com/api/Todo/get-item/$id',
  );

  //print(response);
  if (response.statusCode == 200) {
    final responseData = response.data as List<dynamic>;
    final items =
        responseData.map((item) => item as Map<String, dynamic>).toList();
    //print(json.encode(items));
    return items;
  }

  return [];
}

Future<void> AddTodoItem(String title, String des) async {
  var headers = {'Content-Type': 'application/json'};
  var data =
      json.encode({"title": title, "description": des, "isCompleted": false});
  var dio = Dio();
  var response = await dio.request(
    'http://zeyaddiaa-001-site1.ftempurl.com/api/Todo/add-item',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  } else {
    print(response.statusMessage);
  }
}

Future<void> deleteTodoItem(String id) async {
  var dio = Dio();
  var response = await dio.request(
    'http://zeyaddiaa-001-site1.ftempurl.com/api/Todo/delete-item/$id',
    options: Options(
      method: 'DELETE',
    ),
  );

  if (response.statusCode == 200) {
    print("Deleted item $id successfully");
  } else {
    print(response.statusMessage);
  }
}

Future<void> EditTodoItem(String id, String title, String des) async {
  var headers = {'Content-Type': 'application/json'};
  var data = json.encode(
      {"id": id, "title": title, "description": des, "isCompleted": false});
  var dio = Dio();
  var response = await dio.request(
    'http://zeyaddiaa-001-site1.ftempurl.com/api/Todo/edit-item',
    options: Options(
      method: 'PUT',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  } else {
    print(response.statusMessage);
  }
}
