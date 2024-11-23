import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsproject/views/video_page.dart';

import '../controller/module_controller.dart';

class ModulesPage extends StatelessWidget {
  final int subjectId;

  ModulesPage({required this.subjectId});

  @override
  Widget build(BuildContext context) {
    final ModuleController controller = Get.put(ModuleController());

    return Scaffold(
      appBar: AppBar(title: Text('Modules')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error.value}'));
        }

        return ListView.builder(
          itemCount: controller.modules.length,
          itemBuilder: (context, index) {
            final module = controller.modules[index];
            return ListTile(
              title: Text(module.name),
              onTap: () => Get.to(VideoPage(moduleId: module.id)),
            );
          },
        );
      }),
    );
  }
}
