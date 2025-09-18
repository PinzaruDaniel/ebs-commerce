import '../objectbox.g.dart';

class ObjectBoxStore {
  static Store? _store;

  static Future<Store> getStore() async {
    _store ??= await openStore();
    return _store!;
  }

  static void closeStore() {
    _store?.close();
    _store = null;
  }
}
