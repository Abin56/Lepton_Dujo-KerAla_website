// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class AddNewAdminModel {
  String name;
  String employeeID;
  String username;
  String password;
  String email;
  String phoneNumber;
  AddNewAdminModel({
    required this.name,
    required this.employeeID,
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  AddNewAdminModel copyWith({
    String? name,
    String? employeeID,
    String? username,
    String? password,
    String? email,
    String? phoneNumber,
  }) {
    return AddNewAdminModel(
      name: name ?? this.name,
      employeeID: employeeID ?? this.employeeID,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'employeeID': employeeID,
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory AddNewAdminModel.fromMap(Map<String, dynamic> map) {
    return AddNewAdminModel(
      name: map['name'] as String,
      employeeID: map['employeeID'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNewAdminModel.fromJson(String source) =>
      AddNewAdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddNewAdminModel(name: $name, employeeID: $employeeID, username: $username, password: $password, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(covariant AddNewAdminModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.employeeID == employeeID &&
        other.username == username &&
        other.password == password &&
        other.email == email &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        employeeID.hashCode ^
        username.hashCode ^
        password.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode;
  }
}
// class AddAdminLoginDetailAddToFireBase {
//   Future adminLoginController(
//       AddNewAdminModel productModel, context,schoolID) async {
//     try {
//       final firebase = FirebaseFirestore.instance;
//       final doc = firebase
//           .collection("SchoolListCollection")
//           .doc(schoolID)
//           .set(productModel.toMap()).then((value) => {});
//     } on FirebaseException catch (e) {
//       print('Error ${e.message.toString()}');
//     }
//   }
// }