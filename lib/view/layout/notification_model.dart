class NotificationMoel {
  bool? success;
  String? message;
  Data? data;

  NotificationMoel({this.success, this.message, this.data});

  NotificationMoel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? temp;
  String? tempUpdatedAt;
  String? humidity;
  String? humidityUpdatedAt;
  String? moisture;
  String? moistureUpdatedAt;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.temp,
      this.tempUpdatedAt,
      this.humidity,
      this.humidityUpdatedAt,
      this.moisture,
      this.moistureUpdatedAt,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    temp = json['temp'];
    tempUpdatedAt = json['temp_updated_at'];
    humidity = json['humidity'];
    humidityUpdatedAt = json['humidity_updated_at'];
    moisture = json['moisture'];
    moistureUpdatedAt = json['moisture_updated_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['temp'] = this.temp;
    data['temp_updated_at'] = this.tempUpdatedAt;
    data['humidity'] = this.humidity;
    data['humidity_updated_at'] = this.humidityUpdatedAt;
    data['moisture'] = this.moisture;
    data['moisture_updated_at'] = this.moistureUpdatedAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}