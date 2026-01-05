import 'package:flutter/material.dart';
import 'package:vkaps_it_solution_project_tijori/services/models/rest_client.dart';

class GetSubcategoryByCategoryIdProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _subcategories = [];
  bool _isLoading = false;
  String? _error;

  List<Map<String, dynamic>> get subcategories => _subcategories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Call this method to fetch subcategories
  Future<void> fetchSubcategories(String categoryId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await RestClient.GetSubCategoryByCategoryId([], categoryId);

      if (response['success'] == true && response['data'] != null) {
        List<dynamic> dataList = response['data'];
        _subcategories.clear(); // Clear existing data

        for (var subcategoryData in dataList) { // CHANGED VARIABLE NAME
          String name = subcategoryData['name']?.toString() ?? '';

          if (name.isNotEmpty) {
            _subcategories.add({ // Now calling add() on the class field, not loop variable
              'name': name,
              'id': subcategoryData['_id']?.toString() ?? '',
              'description': subcategoryData['description']?.toString() ?? '',
              'hasSubCategories': subcategoryData['hasSubCategories']?.toString() ?? 'false',
              'categoryId': subcategoryData['categoryId']?.toString() ?? '',
              'status': subcategoryData['status']?.toString() ?? 'active',
            });
          }
        }
      } else {
        _error = response['message'] ?? 'Failed to fetch subcategories';
      }
    } catch (e) {
      _error = e.toString();
      print('Error fetching subcategories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear subcategories
  void clearSubcategories() {
    _subcategories.clear();
    notifyListeners();
  }

  // Get subcategory by ID
  Map<String, dynamic>? getSubcategoryById(String id) {
    return _subcategories.firstWhere(
          (subcat) => subcat['id'] == id,
      orElse: () => {},
    );
  }

  // Filter subcategories by name
  List<Map<String, dynamic>> filterSubcategories(String query) {
    if (query.isEmpty) return _subcategories;

    return _subcategories.where((subcat) {
      final name = subcat['name']?.toString().toLowerCase() ?? '';
      final description = subcat['description']?.toString().toLowerCase() ?? '';
      return name.contains(query.toLowerCase()) ||
          description.contains(query.toLowerCase());
    }).toList();
  }
}