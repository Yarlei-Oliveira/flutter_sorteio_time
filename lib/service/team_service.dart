import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_sorteio_time/model/person.dart';
import 'package:flutter_sorteio_time/model/times.dart';

class TeamService {
  final dio = Dio();

  final baseUrl = 'http://localhost:8000';

  Future<void> updateUsers() async {
    try {
      final response = await dio.post('$baseUrl/updateUsers');
      if (response.statusCode != 201) {}
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Person>?> getUsers() async {
    final users = <Person>[];
    try {
      final response = await dio.get('$baseUrl/getUsers');
      for (var person in response.data) {
        users.add(Person.fromJson(person));
      }
    } catch (e) {
      log(e.toString());
    }
    return users;
  }

  Future<Times?> sorteioTimes(List<Person> users) async {
    final userToJson = [];

    for (var user in users) {
      userToJson.add(user.toJson());
    }

    try {
      final response = await dio.post(
        '$baseUrl/createTeams',
        data: userToJson,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return Times.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
