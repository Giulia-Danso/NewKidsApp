import 'package:flutter/material.dart';
import 'package:newkidsapp/profile/Profile_page.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _showChangeUsernameDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Change Username ✍️'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'New Username',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String newUsername = _usernameController.text;
                    print('New Username: $newUsername');

                    //close the dialog
                    Navigator.pop(context, newUsername);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          username: '',
                        ),
                      ),
                    );
                  },
                  child: const Text('Done 👍'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Change Username'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showChangeUsernameDialog();
            },
            child: const Text('Change Username'),
          ),
        ),
      ),
    );
  }
}
