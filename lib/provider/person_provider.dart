import 'package:flutter/material.dart';
import 'package:flutter_sorteio_time/model/person.dart';
import 'package:flutter_sorteio_time/model/times.dart';
import 'package:flutter_sorteio_time/service/team_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PersonProvider with ChangeNotifier {
  final teamService = TeamService();

  List<Person> _persons = [];
  Times? _times = null;
  final List<Person> _selectedPersons = [];

  PersonProvider() {
    _loadPersons();
  }

  List<Person> get persons => _persons;
  Times? get times => _times;
  List<Person> get selectedPersons => _selectedPersons;

  void addPerson(Person person) {
    _persons.add(person);
    _savePersons();
    notifyListeners();
  }

  void removePerson(Person person) {
    _persons.remove(person);
    _savePersons();
    notifyListeners();
  }

  void updatePersonScore(Person person, int newScore) {
    person.spm = newScore;
    _savePersons();
    notifyListeners();
  }

  void selectPerson(Person person) {
    person.enabled = !person.enabled;
    notifyListeners();
  }

  void getTeams(List<Person> users) async {
    _times = await teamService.sorteioTimes(users);
    notifyListeners();
  }

  bool isSelected(Person person) {
    return _selectedPersons.contains(person);
  }

  void _savePersons() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> personStrings =
        _persons.map((person) => json.encode(person.toJson())).toList();
    await prefs.setStringList('persons', personStrings);
  }

  void _loadPersons() async {
    final users = await teamService.getUsers() ?? [];
    if (users.isNotEmpty) {
      _persons = users;
      notifyListeners();
    }
  }
}
