import 'package:get_storage/get_storage.dart';

class YStorageUtility {
  static final YStorageUtility _instance = YStorageUtility._internal();

  factory YStorageUtility() => _instance;

  YStorageUtility._internal();

  final GetStorage _storage = GetStorage();

  // Make sure to call `await GetStorage.init();` in `main()` before using this.

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
