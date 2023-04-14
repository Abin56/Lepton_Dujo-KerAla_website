// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentModel {
  String studentName; 
  String className; 
  String dateCreated; 
  String classTeacher; 
  String studentId; 

  StudentModel({
    required this.studentName,
    required this.className,
    required this.dateCreated,
    required this.classTeacher,
    required this.studentId,
  }); 

    factory StudentModel.fromJson(Map<String, dynamic> json) =>
      StudentModel(
        studentName: json["studentName"] ?? '',
        className: json["className"] ?? '',
        dateCreated: json["dateCreated"] ?? '',
        classTeacher: json["classTeacher"] ?? '',
        studentId: json["studentId"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "studentName": studentName,
        "className": className,
        "dateCreated": dateCreated,
        "classTeacher": classTeacher,
        "studentId": studentId,
      };

}
