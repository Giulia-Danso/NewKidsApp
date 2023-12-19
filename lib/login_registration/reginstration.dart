import 'package:flutter/material.dart';
import 'package:newkidsapp/profile/Profile_page.dart';
import 'package:newkidsapp/login_registration/login.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Register to KidsApp  🙃'),
        ),
        body: const RegistrationScreen(),
      ),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // registration logic
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Enter Email 📧 and Password 🔐 to join KidsApp:',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 55),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Enter Email📧',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'What´s your name?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'enter Password🔐',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _repeatpasswordController,
            decoration: InputDecoration(
              labelText: 'Repeat Password🔐',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              //registration logic
              String username = _usernameController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          username: username,
                        )),
              );
            },
            child: const Text('Register'),
          ),
          TextButton(
            onPressed: () {
              //back to login logic

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
