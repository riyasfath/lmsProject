import 'package:get/get.dart';

import '../model/subject.dart';
import '../service/api_service.dart';

class SubjectController extends GetxController {
  var subjects = <Subject>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSubjects();
  }

  Future<void> loadSubjects() async {
    isLoading.value = true;
    try {
      final fetchedSubjects = await ApiService().getSubjects();
      subjects.assignAll(fetchedSubjects);
      error.value = '';
    } catch (e) {
      error.value = 'Failed to load subjects: $e';
    }
    isLoading.value = false;
  }
}
