import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/services/models/rest_client.dart';

class MyCategoriesProvider extends ChangeNotifier{
  List<Map<String, dynamic>> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<Map<String, dynamic>> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Call this method to fetch categories
  Future<void> fetchCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await RestClient.MyCategories([]);
      if(response['success'] == true && response['data'] != null){
        List<dynamic> dataList = response['data'];
        for(var category in dataList){
          String name = category['name']?.toString() ?? '';
          String iconUrl = category['categoryIcon']?.toString() ?? '';

          if (name.isNotEmpty) {
            _categories.add({
              'name': name,
              'icon': iconUrl,
              'id': category['_id']?.toString() ?? '', // Optional: keep ID for future use
              'description': category['description']?.toString() ?? '', // Optional
              'hasSubCategories': category['hasSubCategories']?.toString() ?? 'false',
            });
          }
        }
      }
       // Pass empty
    }catch(e){
      _error = e.toString();
      print('Error fetching categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear categories
  void clearCategories() {
    _categories.clear();
    notifyListeners();
  }
}