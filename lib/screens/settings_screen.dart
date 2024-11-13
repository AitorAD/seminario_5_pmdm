import 'package:flutter/material.dart';
import 'package:seminario_5/shared_prefs/user_preferences.dart';
import 'package:seminario_5/widgets/drawer_menu.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _textController;
  final prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsScreen.routeName;
    _textController = new TextEditingController(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes', style: TextStyle(color: Colors.white)),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
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
                onChanged: (value) => {
                      setState(() {
                        prefs.colorSecundario = value;
                      })
                    }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: prefs.genero,
                onChanged: (value) => {
                      setState(() {
                        prefs.genero = value!;
                      })
                    }),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: prefs.genero,
                onChanged: (value) => {
                      setState(() {
                        prefs.genero = value!;
                      })
                    }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la peresona usando el teléfono'),
                onChanged: (value) {
                  setState(() {
                    prefs.nombre = value;
                  });
                },
              ),
            )
          ],
        ));
  }
}
