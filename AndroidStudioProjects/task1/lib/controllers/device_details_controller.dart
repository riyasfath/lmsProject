import 'package:get/get.dart';
import 'package:device_info/device_info.dart';

class DeviceDetailsController extends GetxController {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<void> gatherAndShareDeviceDetails() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // Gather device details
    String deviceModel = androidInfo.model;
    String deviceManufacturer = androidInfo.manufacturer;
    String deviceOSVersion = androidInfo.version.release;

    // Share device details to Firebase
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('device_details');
    databaseReference.push().set({
      'model': deviceModel,
      'manufacturer': deviceManufacturer,
      'os_version': deviceOSVersion,
    });
  }
}
