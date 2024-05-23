import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/device_details_controller.dart';
import '../controllers/photo_capture_controller.dart';
import '../controllers/voice_recording_contoller.dart';
class HomeView extends StatelessWidget {
  final VoiceRecordingController voiceRecordingController = Get.put(VoiceRecordingController());
  final PhotoCaptureController photoCaptureController = Get.put(PhotoCaptureController());
  final DeviceDetailsController deviceDetailsController = Get.put(DeviceDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => voiceRecordingController.captureAndUploadVoiceRecording(),
              child: Text('Capture Voice Recording'),
            ),
            ElevatedButton(
              onPressed: () => photoCaptureController.captureAndUploadPhoto(),
              child: Text('Capture Photo'),
            ),
            ElevatedButton(
              onPressed: () => deviceDetailsController.gatherAndShareDeviceDetails(),
              child: Text('Gather Device Details'),
            ),
          ],
        ),
      ),
    );
  }
}
