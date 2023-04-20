import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/category.model.dart';

class CategoryRepository extends ChangeNotifier {
  List<Category> categories = [];
  CategoryRepository() {
    getAllCategories();
  }

  final Box<Category> _categoryBox = Hive.box<Category>('categories');

  Future<void> addCategory(Category category) async {
    await _categoryBox.add(category);
  }

  Future<void> deleteCategory(int index) async {
    await _categoryBox.deleteAt(index);
  }

  Future<void> updateCategory(int index, Category category) async {
    await _categoryBox.putAt(index, category);
  }

  Future<List<Category>> getAllCategories() async {
    final List<Category> categories = _categoryBox.values.toList();
    this.categories = categories;
    return categories;
  }
}
