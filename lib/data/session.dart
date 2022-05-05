class Session {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  Session(this.id, this.date, this.description, this.duration);

  Session.fromJson(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    date = map['date'] ?? '';
    description = map['description'] ?? '';
    duration = map['duration'] ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}
