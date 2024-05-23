import 'dart:html';

import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VoiceRecordingController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> captureAndUploadVoiceRecording() async {
    String filePath = 'path/to/save/voice_recording.mp3';
    int result = await audioPlayer.record(filePath, duration: Duration(seconds: 30));
    if (result == 1) {
      // Recording successful, upload to Firebase Storage
      File audioFile = File(filePath);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('voice_recordings/$fileName.mp3');
      await ref.putFile(audioFile);
    }
  }
}
