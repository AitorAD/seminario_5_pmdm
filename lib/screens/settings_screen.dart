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

  @override
  void initState() {
    super.initState();
    UserPreferences.instance.lastPage = SettingsScreen.routeName;
    _textController = new TextEditingController(text: UserPreferences.instance.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes', style: TextStyle(color: Colors.white)),
          backgroundColor: (UserPreferences.instance.colorSecundario) ? Colors.teal : Colors.blue,
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
                value: UserPreferences.instance.colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) => {
                      setState(() {
                        UserPreferences.instance.colorSecundario = value;
                      })
                    }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: UserPreferences.instance.genero,
                onChanged: (value) => {
                      setState(() {
                        UserPreferences.instance.genero = value!;
                      })
                    }),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: UserPreferences.instance.genero,
                onChanged: (value) => {
                      setState(() {
                        UserPreferences.instance.genero = value!;
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
                    UserPreferences.instance.nombre = value;
                  });
                },
              ),
            )
          ],
        ));
  }
}
