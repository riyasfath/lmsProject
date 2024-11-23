import 'package:get/get.dart';

import '../model/video.dart';
import '../service/api_service.dart';

class VideoController extends GetxController {
  var videos = <Video>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  Future<void> loadVideos(int moduleId) async {
    isLoading.value = true;
    try {
      final fetchedVideos = await ApiService().getVideos(moduleId);
      videos.assignAll(fetchedVideos);
      error.value = '';
    } catch (e) {
      error.value = 'Failed to load videos: $e';
    }
    isLoading.value = false;
  }
}
