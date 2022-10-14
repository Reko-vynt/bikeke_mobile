import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> logoUrl() async {
    String logoUrl = await storage.ref('image/BikeSVG.png').getDownloadURL();

    return logoUrl;
  }
}
