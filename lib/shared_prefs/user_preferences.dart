import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seminario_5/screens/home_screen.dart';

class UserPreferences {
  // Constructor privado
  UserPreferences._internal();

  // Crea la unica instancia (Singleton)
  static final UserPreferences _instance = UserPreferences._internal();

  // Getter de la unica instancia / diferencias con factory?
  static UserPreferences get instance => _instance;

  final FlutterSecureStorage _prefs = FlutterSecureStorage();

  Future<void> writeData(String key, String value) async {
    await _prefs.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await _prefs.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await _prefs.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await _prefs.deleteAll();
  }

  ///////////////////////////////////////////////////////////////////////////////////

  int? _genero;
  bool? _colorSecundario;
  String? _nombre;
  String? _lastPage;

  Future<void> initPrefs() async {
    _genero = int.tryParse(await _prefs.read(key: 'genero') ?? '1') ?? 1;
    _colorSecundario = bool.tryParse(await _prefs.read(key: 'colorSecundario') ?? 'false') ?? false;
    _nombre = await _prefs.read(key: 'nombre') ?? '';
    _lastPage = await _prefs.read(key: 'lastPage') ?? HomeScreen.routeName;
  }

  int get genero {
    return _genero ?? 1;
  }

  set genero(int value) {
    _genero = value;
    _prefs.write(key: 'genero', value: value.toString());
  }

  bool get colorSecundario {
    return _colorSecundario ?? false;
  }

  set colorSecundario(bool value) {
    _colorSecundario = value;
    _prefs.write(key: 'colorSecundario', value: value.toString());
  }

  String get nombre {
    return _nombre ?? 'prueba';
  }

  set nombre(String value) {
    _nombre = value;
    _prefs.write(key: 'nombre', value: value);
  }

  String get lastPage {
    return _lastPage ?? HomeScreen.routeName;
  }

  set lastPage(String value) {
    _lastPage = value;
    _prefs.write(key: 'lastPage', value: value);
  }
}
