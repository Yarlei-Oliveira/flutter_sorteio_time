/* import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sorteio_time/model/person.dart';
import 'package:flutter_sorteio_time/provider/person_provider.dart';
import 'package:provider/provider.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final selectedPersons =
        Provider.of<PersonProvider>(context).selectedPersons;
    final teams = _findBestTeams(selectedPersons);

    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.deepOrange),
        title: const Text(
          'Times Sorteados',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff202124),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/bf_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff732318),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time 1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ...teams[0].map((person) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff212528).withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${person.name} ',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        '${person.score}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ))),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Color(0xff27789c),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time 2',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ...teams[1].map((person) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff212528).withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${person.name} ',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        '${person.score}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ))),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<List<Person>> _findBestTeams(List<Person> persons) {
    int n = persons.length;
    int totalCombinations = pow(2, n).toInt();
    double minDifference = double.maxFinite;
    List<List<Person>> bestTeams = List.filled(2, []);

    persons.sort((a, b) => b.score.compareTo(a.score));

    // Encontra os 2 jogadores com a maior pontuação
    List<Person> topPlayers = persons.sublist(0, 2);

    // Melhores times com a menor diferença de pontuação
    for (int i = 0; i < totalCombinations; i++) {
      List<Person> team1 = [];
      List<Person> team2 = [];
      double team1Score = 0;
      double team2Score = 0;

      for (int j = 0; j < n; j++) {
        if ((i & (1 << j)) != 0) {
          team1.add(persons[j]);
          team1Score += persons[j].score;
        } else {
          team2.add(persons[j]);
          team2Score += persons[j].score;
        }
      }

      // Garante que os 2 jogadores com a maior pontuação estão em times diferentes
      if (team1.contains(topPlayers[0]) && team2.contains(topPlayers[1]) ||
          team2.contains(topPlayers[0]) && team1.contains(topPlayers[1])) {
        if ((team1.length - team2.length).abs() <= 1) {
          double difference = (team1Score - team2Score).abs();
          if (difference < minDifference) {
            minDifference = difference;
            bestTeams[0] = List.from(team1);
            bestTeams[1] = List.from(team2);
          }
        }
      }
    }

    return bestTeams;
  }
}
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sorteio_time/model/person.dart';
import 'package:flutter_sorteio_time/provider/person_provider.dart';
import 'package:provider/provider.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final selectedPersons =
        Provider.of<PersonProvider>(context).selectedPersons;
    final teams = _findBestTeams(selectedPersons);

    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.deepOrange),
        title: const Text(
          'Times Sorteados',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff202124),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('img/bf_background.jpg'),
            fit:  BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black,
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff732318),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time 1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ...teams[0].map((person) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff212528).withOpacity(0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${person.name} ',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        '${person.score}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ))),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Color(0xff27789c),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time 2',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ...teams[1].map((person) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff212528).withOpacity(0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${person.name} ',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        '${person.score}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ))),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<List<Person>> _findBestTeams(List<Person> persons) {
    int n = persons.length;
    int totalCombinations = pow(2, n).toInt();
    double minDifference = double.maxFinite;
    List<Person> bestTeam1 = [];
    List<Person> bestTeam2 = [];

    for (int i = 0; i < totalCombinations; i++) {
      List<Person> team1 = [];
      List<Person> team2 = [];
      double team1Score = 0;
      double team2Score = 0;

      for (int j = 0; j < n; j++) {
        if ((i & (1 << j)) != 0) {
          team1.add(persons[j]);
          team1Score += persons[j].score;
        } else {
          team2.add(persons[j]);
          team2Score += persons[j].score;
        }
      }

      double difference = (team1Score - team2Score).abs();
      if (difference < minDifference) {
        minDifference = difference;
        bestTeam1 = List.from(team1);
        bestTeam2 = List.from(team2);
      }
    }

    return [bestTeam1, bestTeam2];
  }

  List<Widget> _buildTeamWidgets(List<Person> team) {
    return team
        .map((person) => Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              width: double.infinity,
              color: const Color(0xff212528).withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${person.name} ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  Text(
                    '${person.score}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
