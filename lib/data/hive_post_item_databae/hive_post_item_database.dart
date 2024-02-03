import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/data/hive_post_item_databae/hive_post_item_model.dart';
import 'package:api_mock/data/post_item_database.dart';
import 'package:hive/hive.dart';

final class HivePostItemDatabase implements PostItemDatabase {
  final String _boxLabel = 'postItems';
  Box<PostItemHive>? _box;
  @override
  Future<List<PostItem>> get() async {
    final itemBox = await _openBox();
    return itemBox.values.toList();
  }

  @override
  Future<void> create(PostItem item) async {
    final itemBox = await _openBox();
    return itemBox.put(item.id, PostItemHive.fromPostItem(item));
  }

  @override
  Future<void> update(PostItem item) async {
    final itemBox = await _openBox();
    final hiveList = itemBox.values.toList();
    final hiveItem = hiveList.firstWhere((element) => element.id == item.id);
    final hiveItemIndex = itemBox.values.toList().indexOf(hiveItem);
    return itemBox.putAt(hiveItemIndex, PostItemHive.fromPostItem(item));
  }

  @override
  Future<void> delete(String id) async {
    final itemBox = await _openBox();
    return itemBox.delete(id);
  }

  Future<Box<PostItemHive>> _openBox() async {
    if (_box == null) {
      final isOpen = Hive.isBoxOpen(_boxLabel);
      _box = isOpen ? Hive.box(_boxLabel) : await Hive.openBox(_boxLabel);
    }
    return _box!;
  }
}
