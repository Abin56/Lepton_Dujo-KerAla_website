// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherModel {
  String? teacherName;
  String? teacherEmail;
  String? houseName;
  String? houseNumber;
  String? place;
  String? gender;
  String? district;
  String? altPhoneNo;
  String? employeeID;
  String? createdAt;
  String? teacherPhNo;
  String? docid;
  String userRole;
  String? imageId;
  String? imageUrl;
  String? classID;
  TeacherModel({
    this.teacherName,
    this.teacherEmail,
    this.houseName,
    this.houseNumber,
    this.place,
    this.gender,
    this.district,
    this.altPhoneNo,
    this.employeeID,
    this.createdAt,
    this.teacherPhNo,
    this.docid,
    this.userRole = 'teacher',
    this.imageId,
    this.imageUrl,
    this.classID,
  });

  TeacherModel copyWith({
    String? teacherName,
    String? teacherEmail,
    String? houseName,
    String? houseNumber,
    String? place,
    String? gender,
    String? district,
    String? altPhoneNo,
    String? employeeID,
    String? createdAt,
    String? teacherPhNo,
    String? docid,
    String? userRole,
    String? imageId,
    String? imageUrl,
    String? classID,
  }) {
    return TeacherModel(
      teacherName: teacherName ?? this.teacherName,
      teacherEmail: teacherEmail ?? this.teacherEmail,
      houseName: houseName ?? this.houseName,
      houseNumber: houseNumber ?? this.houseNumber,
      place: place ?? this.place,
      gender: gender ?? this.gender,
      district: district ?? this.district,
      altPhoneNo: altPhoneNo ?? this.altPhoneNo,
      employeeID: employeeID ?? this.employeeID,
      createdAt: createdAt ?? this.createdAt,
      teacherPhNo: teacherPhNo ?? this.teacherPhNo,
      docid: docid ?? this.docid,
      userRole: userRole ?? this.userRole,
      imageId: imageId ?? this.imageId,
      imageUrl: imageUrl ?? this.imageUrl,
      classID: classID ?? this.classID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teacherName': teacherName ?? "",
      'teacherEmail': teacherEmail ?? "",
      'houseName': houseName ?? "",
      'houseNumber': houseNumber ?? "",
      'place': place ?? "",
      'gender': gender ?? "",
      'district': district ?? "",
      'altPhoneNo': altPhoneNo ?? "",
      'employeeID': employeeID ?? "",
      'createdAt': createdAt ?? "",
      'teacherPhNo': teacherPhNo ?? "",
      'docid': docid ?? "",
      'userRole': userRole,
      'imageId': imageId ?? "",
      'imageUrl': imageUrl ?? "",
      'classID': classID ?? "",
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      teacherName:
          map['teacherName'] != null ? map['teacherName'] as String : null,
      teacherEmail:
          map['teacherEmail'] != null ? map['teacherEmail'] as String : null,
      houseName: map['houseName'] != null ? map['houseName'] as String : null,
      houseNumber:
          map['houseNumber'] != null ? map['houseNumber'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      altPhoneNo:
          map['altPhoneNo'] != null ? map['altPhoneNo'] as String : null,
      employeeID:
          map['employeeID'] != null ? map['employeeID'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      teacherPhNo:
          map['teacherPhNo'] != null ? map['teacherPhNo'] as String : null,
      docid: map['docid'] != null ? map['docid'] as String : null,
      userRole: map['userRole'] as String,
      imageId: map['imageId'] != null ? map['imageId'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      classID: map['classID'] != null ? map['classID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(teacherName: $teacherName, teacherEmail: $teacherEmail, houseName: $houseName, houseNumber: $houseNumber, place: $place, gender: $gender, district: $district, altPhoneNo: $altPhoneNo, employeeID: $employeeID, createdAt: $createdAt, teacherPhNo: $teacherPhNo, docid: $docid, userRole: $userRole, imageId: $imageId, imageUrl: $imageUrl, classID: $classID)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.teacherName == teacherName &&
        other.teacherEmail == teacherEmail &&
        other.houseName == houseName &&
        other.houseNumber == houseNumber &&
        other.place == place &&
        other.gender == gender &&
        other.district == district &&
        other.altPhoneNo == altPhoneNo &&
        other.employeeID == employeeID &&
        other.createdAt == createdAt &&
        other.teacherPhNo == teacherPhNo &&
        other.docid == docid &&
        other.userRole == userRole &&
        other.imageId == imageId &&
        other.imageUrl == imageUrl &&
        other.classID == classID;
  }

  @override
  int get hashCode {
    return teacherName.hashCode ^
        teacherEmail.hashCode ^
        houseName.hashCode ^
        houseNumber.hashCode ^
        place.hashCode ^
        gender.hashCode ^
        district.hashCode ^
        altPhoneNo.hashCode ^
        employeeID.hashCode ^
        createdAt.hashCode ^
        teacherPhNo.hashCode ^
        docid.hashCode ^
        userRole.hashCode ^
        imageId.hashCode ^
        imageUrl.hashCode ^
        classID.hashCode;
  }
}
