import 'package:data/modules/products/models/local/product_box.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

//TODO: de declarat toate boxurile si pe urma de creat store-ul
class ObjectBoxStore {
  late final Store _store;
  late final Box<ProductBox> productBox;
  ObjectBoxStore._create(this._store){
    productBox=Box<ProductBox>(_store);
  }
  static Future<ObjectBoxStore> create() async {
    final store = await openStore(
        directory:
        p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBoxStore._create(store);
  }


}
