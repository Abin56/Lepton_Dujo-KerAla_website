// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class CreatedSchoolAddModel {
//   String schoolName;
//   String docid;
//   String uid;
//   String district;
//   String place;
//   String adminUserName;
//   String password;
//   String postedDate;
//   String email;
//   String phoneNumber;
//   String schoolCode;
//   CreatedSchoolAddModel({
//     required this.schoolName,
//     required this.docid,
//     required this.uid,
//     required this.district,
//     required this.place,
//     required this.adminUserName,
//     required this.password,
//     required this.postedDate,
//     required this.email,
//     required this.phoneNumber,
//     required this.schoolCode,
//   });


//   CreatedSchoolAddModel copyWith({
//     String? schoolName,
//     String? docid,
//     String? uid,
//     String? district,
//     String? place,
//     String? adminUserName,
//     String? password,
//     String? postedDate,
//     String? email,
//     String? phoneNumber,
//     String? schoolCode,
//   }) {
//     return CreatedSchoolAddModel(
//       schoolName: schoolName ?? this.schoolName,
//       docid: docid ?? this.docid,
//       uid: uid ?? this.uid,
//       district: district ?? this.district,
//       place: place ?? this.place,
//       adminUserName: adminUserName ?? this.adminUserName,
//       password: password ?? this.password,
//       postedDate: postedDate ?? this.postedDate,
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       schoolCode: schoolCode ?? this.schoolCode,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'schoolName': schoolName,
//       'docid': docid,
//       'uid': uid,
//       'district': district,
//       'place': place,
//       'adminUserName': adminUserName,
//       'password': password,
//       'postedDate': postedDate,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'schoolCode': schoolCode,
//     };
//   }

//   factory CreatedSchoolAddModel.fromMap(Map<String, dynamic> map) {
//     return CreatedSchoolAddModel(
//       schoolName: map['schoolName'] as String,
//       docid: map['docid'] as String,
//       uid: map['uid'] as String,
//       district: map['district'] as String,
//       place: map['place'] as String,
//       adminUserName: map['adminUserName'] as String,
//       password: map['password'] as String,
//       postedDate: map['postedDate'] as String,
//       email: map['email'] as String,
//       phoneNumber: map['phoneNumber'] as String,
//       schoolCode: map['schoolCode'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CreatedSchoolAddModel.fromJson(String source) => CreatedSchoolAddModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'CreatedSchoolAddModel(schoolName: $schoolName, docid: $docid, uid: $uid, district: $district, place: $place, adminUserName: $adminUserName, password: $password, postedDate: $postedDate, email: $email, phoneNumber: $phoneNumber, schoolCode: $schoolCode)';
//   }

//   @override
//   bool operator ==(covariant CreatedSchoolAddModel other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.schoolName == schoolName &&
//       other.docid == docid &&
//       other.uid == uid &&
//       other.district == district &&
//       other.place == place &&
//       other.adminUserName == adminUserName &&
//       other.password == password &&
//       other.postedDate == postedDate &&
//       other.email == email &&
//       other.phoneNumber == phoneNumber &&
//       other.schoolCode == schoolCode;
//   }

//   @override
//   int get hashCode {
//     return schoolName.hashCode ^
//       docid.hashCode ^
//       uid.hashCode ^
//       district.hashCode ^
//       place.hashCode ^
//       adminUserName.hashCode ^
//       password.hashCode ^
//       postedDate.hashCode ^
//       email.hashCode ^
//       phoneNumber.hashCode ^
//       schoolCode.hashCode;
//   }
// }


