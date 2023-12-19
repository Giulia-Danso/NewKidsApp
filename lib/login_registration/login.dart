import 'package:flutter/material.dart';
import 'package:newkidsapp/profile/Profile_page.dart';
import 'package:newkidsapp/login_registration/forgot_password.dart';
import 'package:newkidsapp/login_registration/reginstration.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          title: const Text(' Welcome to Login'),
        ),
        body: const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> handleLogin(BuildContext context) async {
    const String hardcodedUsername = 'User';
    const hardcodedPassword = 'Password';

    String enteredUsername = _emailController.text;
    String enteredPassword = _passwordController.text;

    if (enteredUsername == hardcodedUsername &&
        enteredPassword == hardcodedPassword) {
      print('Login successful');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content:
                const Text('Incorrect username or password. Please try again'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.key),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              handleLogin(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                          username: '',
                        )),
              );
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              //forgot password? reset
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPassword()),
              );
            },
            child: const Text('Password Forgotten? Reset here'),
          ),
          TextButton(
              onPressed: () {
                //navigate to registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
              child: const Text('No Account yet? Dont worry, REGISTER Here!'))
        ],
      ),
    );
  }
}
