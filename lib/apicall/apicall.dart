import 'dart:convert';

//api class method
CallModel callModelFromJson(String str) => CallModel.fromJson(json.decode(str));

String callModelToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
  DateTime apiVersion;
  String status;

  CallModel({
    required this.apiVersion,
    required this.status,
  });

  factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        apiVersion: DateTime.parse(json["api_version"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "api_version":
            "${apiVersion.year.toString().padLeft(4, '0')}-${apiVersion.month.toString().padLeft(2, '0')}-${apiVersion.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}
