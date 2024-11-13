import 'package:flutter/material.dart';
import 'package:seminario_5/shared_prefs/user_preferences.dart';
import 'package:seminario_5/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserPreferences.instance.lastPage = HomeScreen.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario',
            style: TextStyle(color: Colors.white)),
        backgroundColor: (UserPreferences.instance.colorSecundario) ? Colors.teal : Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${UserPreferences.instance.colorSecundario ? 'si' : 'no'}'),
          Divider(),
          Text('Género: ${UserPreferences.instance.genero}'),
          Divider(),
          Text('Nombre usuario: ${UserPreferences.instance.nombre}'),
        ],
      ),
    );
  }
}
