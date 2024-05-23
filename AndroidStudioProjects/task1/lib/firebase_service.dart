import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  static Future<FirebaseApp> initializeFirebase() async {
    await Firebase.initializeApp();
    return Firebase.app();
  }

  static Future<Reference> getStorageReference() async {
    final app = await initializeFirebase();
    final storage = FirebaseStorage.instanceFor(app: app);
    return storage.ref();
  }
}
