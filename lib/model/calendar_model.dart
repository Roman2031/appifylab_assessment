class AppointmentModel {
  int id;
  String event_name;
  String event_time;
  String start_date;
  String short_desc;

  AppointmentModel({
    required this.id,
    required this.event_name,
    required this.event_time,
    required this.start_date,
    required this.short_desc,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      event_name: json['event_name'],
      event_time: json['event_time'] ?? '',
      start_date: json['start_date'] ?? '',
      short_desc: json['short_desc'] ?? '',
    );
  }
}
