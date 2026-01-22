import 'package:get_storage/get_storage.dart';

class YLocalStorage {
  late final GetStorage _storage;

  // Singleton instance
  static YLocalStorage? _instance;

  YLocalStorage._internal();

  factory YLocalStorage.instance() {
    _instance ??= YLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = YLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  Future<void> saveData<Y>(String key, Y value) async {
    await _storage.write(key, value);
  }

  Y? readData<Y>(String key) {
    return _storage.read<Y>(key);
  }

  //Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // clear all data
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
