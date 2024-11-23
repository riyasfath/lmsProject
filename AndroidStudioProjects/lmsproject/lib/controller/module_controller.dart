import 'package:get/get.dart';

import '../model/module.dart';
import '../service/api_service.dart';

class ModuleController extends GetxController {
  var modules = <Module>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  Future<void> loadModules(int subjectId) async {
    isLoading.value = true;
    try {
      final fetchedModules = await ApiService().getModules(subjectId);
      modules.assignAll(fetchedModules);
      error.value = '';
    } catch (e) {
      error.value = 'Failed to load modules: $e';
    }
    isLoading.value = false;
  }
}
