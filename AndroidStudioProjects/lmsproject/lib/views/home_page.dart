import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/subject_controller.dart';
import 'modules_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SubjectController controller = Get.put(SubjectController());

    return Scaffold(
      appBar: AppBar(title: Text('Subjects')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error.value}'));
        }

        return ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            final subject = controller.subjects[index];
            return ListTile(
              title: Text(subject.name),
              onTap: () => Get.to(ModulesPage(subjectId: subject.id)),
            );
          },
        );
      }),
    );
  }
}
