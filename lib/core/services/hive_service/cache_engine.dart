import 'dart:convert';
import 'package:hive/hive.dart';

class CacheEngine {
  Future<T?> load<T>({
    required String boxName,
    required String cacheKey,
    required Future<Map<String, dynamic>> Function() dataManager,
    required T Function(Map<String, dynamic> json) fromJson,
    required Function(T value) onUpdate,
  }) async {

    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }

    final box = Hive.box(boxName);

    // 1. cache
    final cachedData = box.get(cacheKey);

    if (cachedData != null) {
      final decoded = jsonDecode(cachedData);
      final cachedObject = fromJson(decoded);
      onUpdate(cachedObject);
    }

    // 2. API call
    final apiJson = await dataManager();
    final apiEncoded = jsonEncode(apiJson);

    // 3. compare
    if (cachedData != apiEncoded) {
      await box.put(cacheKey, apiEncoded);

      final apiObject = fromJson(apiJson);
      onUpdate(apiObject);
    }

    return fromJson(apiJson);
  }
}

///how to use:

// await cacheEngine.load<User>(
// boxName: "user_box",
// cacheKey: "user",
//
// dataManager: () async {
// return await api.getUser(); // returns Map<String,dynamic>
// },
//
// fromJson: (json) => User.fromJson(json),
//
// onUpdate: (user) {
// print(user.name);
// },
// );