import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../model/get_classwise_subject.dart';
import '../../../../../colors/colors.dart';


class ClassWiseSubject extends StatefulWidget {
  final String schoolID;
  final String classID;
  final String teacherID;
  const ClassWiseSubject(
      {required this.schoolID,
      required this.classID,
      required this.teacherID,
      super.key});

  @override
  State<ClassWiseSubject> createState() => _ClassWiseSubjectState();
}

class _ClassWiseSubjectState extends State<ClassWiseSubject> {
  String fetchingClass = "";
  Map<String, dynamic> subjectMap = <String, dynamic>{};
  @override
  void initState() {
    getClassName();
    getMapData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseFirestore = FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Teachers")
        .doc(widget.teacherID)
        .collection('teacherClasses')
        .doc(widget.classID);
    firebaseFirestore.set({'className': fetchingClass, 'id': widget.classID});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class subjects'),backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("SchoolListCollection")
              .doc(widget.schoolID)
              .collection("Classes")
              .doc(widget.classID)
              .collection("Subjects")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = GetClassWiseSubjectModel.fromJson(
                              snapshot.data!.docs[index].data());

                          return GestureDetector(
                            onTap: () async {},
                            child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: ListTile(
                                  title: Text(data.subject),
                                  trailing: TextButton.icon(
                                    onPressed: () async {
                                      if (subjectMap
                                          .containsKey(data.subject)) {
                                        subjectMap.remove(data.subject);
                                        await firebaseFirestore
                                            .collection('subjects')
                                            .doc(data.subject)
                                            .delete();
                                        await getMapData();
                                      } else {
                                        subjectMap.putIfAbsent(
                                            data.subject, () => data.subject);
                                        firebaseFirestore
                                            .collection('subjects')
                                            .doc(data.subject)
                                            .set(
                                          <String, dynamic>{
                                            'SubjectName': data.subject,
                                          },
                                        );
                                        await getMapData();
                                      }
                                      setState(() {});
                                    },
                                    icon: subjectMap.containsKey(data.subject)
                                        ? const Icon(Icons.delete)
                                        : const Icon(Icons.add),
                                    label: subjectMap.containsKey(data.subject)
                                        ? const Text('remove')
                                        : const Text('add'),
                                  ),
                                )),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: snapshot.data!.docs.length),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> getMapData() async {
    subjectMap.clear();

    ///init state this function will call and update [subjectMap].
    QuerySnapshot<Map<String, dynamic>> firebaseFirestore =
        await FirebaseFirestore.instance
            .collection("SchoolListCollection")
            .doc(widget.schoolID)
            .collection("Teachers")
            .doc(widget.teacherID)
            .collection('teacherClasses')
            .doc(widget.classID)
            .collection('subjects')
            .get();
    for (var element in firebaseFirestore.docs) {
      subjectMap.putIfAbsent(element.id, () => element.data()[element.id]);
    }

    setState(() {
      print(subjectMap);
    });
  }

  getClassName() async {
    var vari = await FirebaseFirestore.instance
        .collection("SchoolListCollection")
        .doc(widget.schoolID)
        .collection("Classes")
        .doc(widget.classID)
        .get();
    setState(() {
      fetchingClass = vari.data()!['className'];
    });
  }
}
