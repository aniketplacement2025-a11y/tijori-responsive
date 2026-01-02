import 'package:shared_preferences/shared_preferences.dart';

class StorageAreaOfAccessToken {
  StorageAreaOfAccessToken._();
  static final StorageAreaOfAccessToken _instance = StorageAreaOfAccessToken._();
  static StorageAreaOfAccessToken get instance => _instance;

  late SharedPreferences _sp;

  Future<void> init() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await _sp.clear();
  }

  Future<void> logout() async {
    await _sp.remove('access_token');
  }

  Future<void> setToken(String token) async {
    await _sp.setString('access_token', token);
  }

  String getToken() {
    return _sp.getString('access_token') ?? "";
  }

  Future<void> setRole(String role) async {
    await _sp.setString('name', role);
  }

  String getRole() {
    return _sp.getString('name') ?? "";
  }
  
  Future<void> setName(String name) async {
    await _sp.setString('fullName', name);
  }

  String getName() {
    return _sp.getString('fullName') ?? "";
  }

  // Phone methods
  Future<void> setPhone(List<String> phone) async {
    if (phone.length >= 2) {
      await _sp.setStringList('phone', phone);
    } else {
      throw ArgumentError('Phone list must contain at least country_code and number');
    }
  }

  List<String> getPhone() {
    return _sp.getStringList('phone') ?? [];
  }

  Future<void> setEmail(String email) async {
    await _sp.setString('email', email);
  }

  String getEmail(){
    return _sp.getString('email') ?? "";
  }
}