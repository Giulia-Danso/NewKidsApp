import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatefulWidget {
  ThemeSettingsPage({Key? key}) : super(key: key);

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Theme Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Theme:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
                title: const Text('Dark Mode'),
                value: _isDarkMode,
                onChanged: (value) {
                  setState(() {
                    _isDarkMode = value;
                    _applyTheme();
                  });
                })
          ],
        ),
      ),
    );
  }

  void _applyTheme() {
    final ThemeData newTheme = _isDarkMode
        ? ThemeData.dark().copyWith(
            // Customize dark theme if needed
            primaryColor: Colors.blue,
            secondaryHeaderColor: Colors.orange,
          )
        : ThemeData.light().copyWith(
            //Customize light theme if needed
            primaryColor: Colors.green,
            secondaryHeaderColor: Colors.purple,
          );
    //apply the new theme
    (context as Element).markNeedsBuild();
  }

  //function to toggle between light and dark themes
  void _toggleTheme() {
    _isDarkMode = !_isDarkMode;

    // apply the new theme
    _applyTheme();
  }
}
