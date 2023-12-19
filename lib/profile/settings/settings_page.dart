import 'package:flutter/material.dart';
import 'package:newkidsapp/profile/settings/notification_settings_page.dart';

import 'theme_settings_page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme'),
            leading: const Icon(Icons.color_lens),
            onTap: () {
              // handle theme settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThemeSettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            leading: const Icon(Icons.notifications),
            onTap: () {
              //notification settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationSettings(),
                ),
              );
            },
          )
          // more settings here
        ],
      ),
    );
  }
}
