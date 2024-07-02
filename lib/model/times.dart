import 'package:flutter_sorteio_time/model/person.dart';

class Times {
  List<Person> time1;
  List<Person> time2;
  int spmTime1;
  int spmTime2;

  Times({
    required this.time1,
    required this.time2,
    required this.spmTime1,
    required this.spmTime2,
  });

  Map<String, dynamic> toJson() {
    return {
      'time1': time1.map((person) => person.toJson()).toList(),
      'time2': time2.map((person) => person.toJson()).toList(),
      'spmTime1': spmTime1,
      'spmTime2': spmTime2,
    };
  }

  factory Times.fromJson(Map<String, dynamic> json) {
    return Times(
      time1:
          (json['team1'] as List).map((item) => Person.fromJson(item)).toList(),
      time2:
          (json['team2'] as List).map((item) => Person.fromJson(item)).toList(),
      spmTime1: json['total_spm_team_1'],
      spmTime2: json['total_spm_team_2'],
    );
  }
}
