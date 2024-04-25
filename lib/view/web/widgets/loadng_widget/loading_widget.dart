import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      ignoreContainers: true,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  'Item number $index as title'),
              subtitle:
                  const Text('Subtitle here'),
              trailing: const Icon(Icons.ac_unit),
            ),
          );
        },
      ),
    );
  }
}
