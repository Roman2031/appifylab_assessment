class CalendarModel {
  int id;
  String event_name;
  String event_time;
  String start_date;
  String short_desc;

  CalendarModel({
    required this.id,
    required this.event_name,
    required this.event_time,
    required this.start_date,
    required this.short_desc,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      id: json['id'] ?? '',
      event_name: json['event_name'],
      event_time: json['event_time'] ?? '',
      start_date: json['start_date'] ?? '',
      short_desc: json['short_desc'] ?? '',
    );
  }
}
