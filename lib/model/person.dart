class Person {
  String user;
  int spm;
  bool enabled;

  Person({
    required this.user,
    required this.spm,
    required this.enabled,
  });

  Map<String, dynamic> toJson() {
    return {
      "user": user,
      "spm": spm,
      "enabled": enabled,
    };
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      user: json['user'],
      spm: json['spm'],
      enabled: json['enabled'],
    );
  }
}
