import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
//part "category.model.g.dart";

@HiveType(typeId: 1)
class Category {
  @HiveField(1)
  late String id;
  @HiveField(2)
  late String name;

  Category({String? id, required this.name}) : id = id ?? const Uuid().v4();
}
