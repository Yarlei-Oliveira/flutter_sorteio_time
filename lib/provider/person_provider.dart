import 'package:flutter/material.dart';
import 'package:flutter_sorteio_time/model/person.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PersonProvider with ChangeNotifier {
  List<Person> _persons = [];
  final List<Person> _selectedPersons = [];

  PersonProvider() {
    _loadPersons();
  }

  List<Person> get persons => _persons;
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

  void updatePersonScore(Person person, double newScore) {
    person.score = newScore;
    _savePersons();
    notifyListeners();
  }

  void selectPerson(Person person) {
    if (_selectedPersons.contains(person)) {
      _selectedPersons.remove(person);
    } else {
      _selectedPersons.add(person);
    }
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? personStrings = prefs.getStringList('persons');
    if (personStrings != null) {
      _persons = personStrings
          .map((string) => Person.fromJson(json.decode(string)))
          .toList();
      notifyListeners();
    }
  }
}
