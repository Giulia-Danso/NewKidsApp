import 'package:flutter/material.dart';
import 'package:newkidsapp/login_registration/login.dart';
import 'package:newkidsapp/profile/settings/settings_page.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
            onPressed: () {
              // back to login
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ChatAppScreen(),
      ),
    );
  }
}

class ChatAppScreen extends StatefulWidget {
  ChatAppScreen({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatAppScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    LoginScreen(),
  ];

  void openSettingsPage(BuildContext context) {
    //navigate to settings
    // Navigator.of(context).push(
    // MaterialPageRoute(
    //builder: (context) => ),);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KidsApp'),
          backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                //setting page navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: _selectedIndex < _screens.length
            ? _screens[_selectedIndex]
            : Container(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.lightBlue,
              icon: Icon(Icons.login),
              label: 'Login',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Friends👥',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat📧',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
