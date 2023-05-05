// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



class GuardianModel {
  String? guardianName;
  String? docid;
  String? createdate;
  String? guardianPhoneNumber;
  String? parentEmail;
  String? studentID;
  String? houseName;
  String? place;
  String? state;
  String? pincode;
  String? district;
  String? gender;
  String? profileImageID;
  String? profileImageURL;
  String userRole;
  GuardianModel({
    this.guardianName,
    this.docid,
    this.createdate,
    this.guardianPhoneNumber,
    this.parentEmail,
    this.studentID,
    this.houseName,
    this.place,
    this.state,
    this.pincode,
    this.district,
    this.gender,
    this.profileImageID,
    this.profileImageURL,
     this.userRole='parent',
  });

  GuardianModel copyWith({
    String? guardianName,
    String? docid,
    String? createdate,
    String? guardianPhoneNumber,
    String? parentEmail,
    String? studentID,
    String? houseName,
    String? place,
    String? state,
    String? pincode,
    String? district,
    String? gender,
    String? profileImageID,
    String? profileImageURL,
    String? userRole,
  }) {
    return GuardianModel(
      guardianName: guardianName ?? this.guardianName,
      docid: docid ?? this.docid,
      createdate: createdate ?? this.createdate,
      guardianPhoneNumber: guardianPhoneNumber ?? this.guardianPhoneNumber,
      parentEmail: parentEmail ?? this.parentEmail,
      studentID: studentID ?? this.studentID,
      houseName: houseName ?? this.houseName,
      place: place ?? this.place,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      district: district ?? this.district,
      gender: gender ?? this.gender,
      profileImageID: profileImageID ?? this.profileImageID,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      userRole: userRole ?? this.userRole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'guardianName': guardianName ?? '',
      'docid': docid ?? '',
      'createdate': createdate ?? '',
      'guardianPhoneNumber': guardianPhoneNumber ?? '',
      'parentEmail': parentEmail ?? '',
      'studentID': studentID ?? '',
      'houseName': houseName ?? '',
      'place': place ?? '',
      'state': state ?? '',
      'pincode': pincode ?? '',
      'district': district ?? '',
      'gender': gender ?? '',
      'profileImageID': profileImageID ?? '',
      'profileImageURL': profileImageURL ?? '',
      'userRole': userRole,
    };
  }

  factory GuardianModel.fromMap(Map<String, dynamic> map) {
    return GuardianModel(
      guardianName: map['guardianName'] != null ? map['guardianName'] as String : '',
      docid: map['docid'] != null ? map['docid'] as String : '',
      createdate: map['createdate'] != null ? map['createdate'] as String : '',
      guardianPhoneNumber: map['guardianPhoneNumber'] != null
          ? map['guardianPhoneNumber'] as String
          : '',
      parentEmail:
          map['parentEmail'] != null ? map['parentEmail'] as String : '',
      studentID: map['studentID'] != null ? map['studentID'] as String : '',
      houseName: map['houseName'] != null ? map['houseName'] as String : '',
      place: map['place'] != null ? map['place'] as String : '',
      state: map['state'] != null ? map['state'] as String : '',
      pincode: map['pincode'] != null ? map['pincode'] as String : '',
      district: map['district'] != null ? map['district'] as String : '',
      gender: map['gender'] != null ? map['gender'] as String : '',
      profileImageID:
          map['profileImageID'] != null ? map['profileImageID'] as String : '',
      profileImageURL: map['profileImageURL'] != null
          ? map['profileImageURL'] as String
          : '',
      userRole: map['userRole'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuardianModel.fromJson(String source) =>
      GuardianModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GuardianModel(guardianName: $guardianName, docid: $docid, createdate: $createdate, guardianPhoneNumber: $guardianPhoneNumber, parentEmail: $parentEmail, studentID: $studentID, houseName: $houseName, place: $place, state: $state, pincode: $pincode, district: $district, gender: $gender, profileImageID: $profileImageID, profileImageURL: $profileImageURL, userRole: $userRole)';
  }

  @override
  bool operator ==(covariant GuardianModel other) {
    if (identical(this, other)) return true;

    return other.guardianName == guardianName &&
        other.docid == docid &&
        other.createdate == createdate &&
        other.guardianPhoneNumber == guardianPhoneNumber &&
        other.parentEmail == parentEmail &&
        other.studentID == studentID &&
        other.houseName == houseName &&
        other.place == place &&
        other.state == state &&
        other.pincode == pincode &&
        other.district == district &&
        other.gender == gender &&
        other.profileImageID == profileImageID &&
        other.profileImageURL == profileImageURL &&
        other.userRole == userRole;
  }

  @override
  int get hashCode {
    return guardianName.hashCode ^
        docid.hashCode ^
        createdate.hashCode ^
        guardianPhoneNumber.hashCode ^
        parentEmail.hashCode ^
        studentID.hashCode ^
        houseName.hashCode ^
        place.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        district.hashCode ^
        gender.hashCode ^
        profileImageID.hashCode ^
        profileImageURL.hashCode ^
        userRole.hashCode;
  }
}

