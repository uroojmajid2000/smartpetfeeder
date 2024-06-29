class ReadingModel {
  final bool success;
  final String message;
  final Data data;

  ReadingModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ReadingModel.fromJson(Map<String, dynamic> json) {
    return ReadingModel(
      success: json['success'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int id;
  final int userId;
  final String temperature;
  final String humidity;
  final String moisture;
  final String status;
  final String petStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.userId,
    required this.temperature,
    required this.humidity,
    required this.moisture,
    required this.status,
    required this.petStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      userId: json['user_id'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      moisture: json['moisture'],
      status: json['status'],
      petStatus: json['pet_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
