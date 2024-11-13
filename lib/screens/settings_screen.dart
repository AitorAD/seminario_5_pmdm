import 'package:flutter/material.dart';
import 'package:seminario_5/shared_prefs/user_preferences.dart';
import 'package:seminario_5/widgets/drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _textController;
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: DrawerMenu(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
                value: prefs.colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) => prefs.colorSecundario = value),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: prefs.genero,
                onChanged: (value) => prefs.genero = value!),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: prefs.genero,
                onChanged: (value) => prefs.genero = value!),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la peresona usando el teléfono'),
                onChanged: (value) {},
              ),
            )
          ],
        ));
  }
}
