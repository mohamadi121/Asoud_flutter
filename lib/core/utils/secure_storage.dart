import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureStorage(String key) async {
    String value = await storage.read(key: key) ?? 'ND';
    return value;
  }

  deleteSecureStorage(String key) async {
    await storage.delete(key: key);
  }

}