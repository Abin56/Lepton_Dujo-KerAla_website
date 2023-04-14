// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class AdminLoginDetailHistoryModel {
  String loginTime;
  String adminuser;
  String? logOutTime;
  AdminLoginDetailHistoryModel({
    required this.loginTime,
    required this.adminuser,
    this.logOutTime,
  });


  AdminLoginDetailHistoryModel copyWith({
    String? loginTime,
    String? adminuser,
    String? logOutTime,
  }) {
    return AdminLoginDetailHistoryModel(
      loginTime: loginTime ?? this.loginTime,
      adminuser: adminuser ?? this.adminuser,
      logOutTime: logOutTime ?? this.logOutTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginTime': loginTime,
      'adminuser': adminuser,
      'logOutTime': logOutTime,
    };
  }

  factory AdminLoginDetailHistoryModel.fromMap(Map<String, dynamic> map) {
    return AdminLoginDetailHistoryModel(
      loginTime: map['loginTime'] as String,
      adminuser: map['adminuser'] as String,
      logOutTime: map['logOutTime'] != null ? map['logOutTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminLoginDetailHistoryModel.fromJson(String source) => AdminLoginDetailHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminLoginDetailHistoryModel(loginTime: $loginTime, adminuser: $adminuser, logOutTime: $logOutTime)';

  @override
  bool operator ==(covariant AdminLoginDetailHistoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.loginTime == loginTime &&
      other.adminuser == adminuser &&
      other.logOutTime == logOutTime;
  }

  @override
  int get hashCode => loginTime.hashCode ^ adminuser.hashCode ^ logOutTime.hashCode;
}


class LoginTimeIDSavingClass {
  static String id = '';
}
