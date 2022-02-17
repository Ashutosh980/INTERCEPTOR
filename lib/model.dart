
import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  Test({
    required this.errorMessage,
    this.result,
    required this.status,
    required this.errorCode,
  });

  String errorMessage;
  dynamic result;
  int status;
  int errorCode;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    errorMessage: json["errorMessage"],
    result: json["result"],
    status: json["status"],
    errorCode: json["errorCode"],
  );

  Map<String, dynamic> toJson() => {
    "errorMessage": errorMessage,
    "result": result,
    "status": status,
    "errorCode": errorCode,
  };
}

Verify verifyFromJson(String str) => Verify.fromJson(json.decode(str));

String verifyToJson(Verify data) => json.encode(data.toJson());

class Verify {
  Verify({
    required this.errorMessage,
    required this.result,
    required this.status,
    required this.errorCode,
  });

  String errorMessage;
  Result result;
  int status;
  int errorCode;

  factory Verify.fromJson(Map<String, dynamic> json) => Verify(
    errorMessage: json["errorMessage"],
    result: Result.fromJson(json["result"]),
    status: json["status"],
    errorCode: json["errorCode"],
  );

  Map<String, dynamic> toJson() => {
    "errorMessage": errorMessage,
    "result": result.toJson(),
    "status": status,
    "errorCode": errorCode,
  };
}
class Result {
  Result({
    required this.access,
    required this.refresh,
    required this.userCode,
    required this.role,
  });
  String access;
  String refresh;
  int userCode;
  int role;
  factory Result.fromJson(Map<String, dynamic> json) => Result(
    access: json["access"],
    refresh: json["refresh"],
    userCode: json["userCode"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "access": access,
    "refresh": refresh,
    "userCode": userCode,
    "role": role,
  };
}
