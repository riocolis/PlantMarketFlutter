part of 'models.dart';

class MetaClass {
  MetaClass({
    this.code,
    this.status,
    this.message,
  });

  int code;
  String status;
  String message;

  factory MetaClass.fromJson(Map<String, dynamic> json) => MetaClass(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
