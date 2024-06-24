class Person {
  String name;
  double score;

  Person({required this.name, required this.score});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'score': score,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      score: json['score'].toDouble(), // Convert score to double
    );
  }
}
