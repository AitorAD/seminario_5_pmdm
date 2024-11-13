import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seminario_5/screens/home_screen.dart';

class UserPreferences {
  // La instancia privada y única de la clase (Lazy Initialization)
  static final UserPreferences _instance = UserPreferences._internal();

  // Factory constructor que retorna la única instancia
  factory UserPreferences() {
    return _instance;
  }

  // Constructor interno privado
  UserPreferences._internal();

  // Instancia de FlutterSecureStorage que se inicializa cuando se necesite
  late FlutterSecureStorage _prefs;

  set lastPage(String lastPage) {}

  // Método para inicializar las preferencias (se llama solo una vez)
  Future<void> initPrefs() async {
    _prefs = FlutterSecureStorage();
  }

  // Métodos getter y setter asíncronos
  Future<int> getGenero() async {
    final generoString = await _prefs.read(key: 'genero');
    return generoString != null ? int.parse(generoString) : 1;
  }

  Future<void> setGenero(int value) async {
    await _prefs.write(key: 'genero', value: value.toString());
  }

  Future<bool> getColorSecundario() async {
    final colorSecundarioString = await _prefs.read(key: 'colorSecundario');
    return colorSecundarioString != null ? colorSecundarioString == 'true' : false;
  }

  Future<void> setColorSecundario(bool value) async {
    await _prefs.write(key: 'colorSecundario', value: value.toString());
  }

  Future<String> getNombre() async {
    final nombre = await _prefs.read(key: 'nombre');
    return nombre ?? '';
  }

  Future<void> setNombre(String value) async {
    await _prefs.write(key: 'nombre', value: value);
  }

  Future<String> getLastPage() async {
    final lastPage = await _prefs.read(key: 'lastPage');
    return lastPage ?? HomeScreen.routeName;
  }

  Future<void> setLastPage(String value) async {
    await _prefs.write(key: 'lastPage', value: value);
  }
}
