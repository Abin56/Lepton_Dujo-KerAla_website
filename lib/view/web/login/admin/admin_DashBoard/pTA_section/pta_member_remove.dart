import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../../../../../../model/pTA_section/add_PTAMemberModel.dart';
import '../../../../../colors/colors.dart';


class RemovePtaMembers extends StatelessWidget {
  const RemovePtaMembers({
    super.key,
    required this.schoolId,
  });
  final String schoolId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Remove Members'),backgroundColor: adminePrimayColor,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SchoolListCollection')
                .doc(schoolId)
                .collection('PTAMembersCollection')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final data = AddPTAMemberModel.fromJson(
                          snapshot.data!.docs[index].data());
                      return ListTile(
                        title: Text(data.userName),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Remove'),
                                  content: const Text(
                                      'Are you sure you want to remove this member'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        try {
                                          FirebaseFirestore.instance
                                              .collection(
                                                  'SchoolListCollection')
                                              .doc(schoolId)
                                              .collection(
                                                  'PTAMembersCollection')
                                              .doc(data.id)
                                              .delete();
                                          Navigator.of(context).pop();
                                        } catch (e) {
                                          log(e.toString());
                                        }
                                      },
                                      child: const Text('Remove'),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
