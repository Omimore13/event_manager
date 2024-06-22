
class EventDetails {
  int? id;
  String description;
  String title;
  DateTime date;

  EventDetails({
    this.id,
    required this.description,
    required this.title,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'date': date.toIso8601String(),
    };
  }

  factory EventDetails.fromMap(Map<String, dynamic> map) {
    return EventDetails(
      id: map['id'],
      description: map['description'],
      title: map['title'],
      date: DateTime.parse(map['date']),
    );
  }
}
