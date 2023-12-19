import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newkidsapp/profile/change_username.dart';

class ProfileScreen extends StatefulWidget {
  String username;

  ProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileImagePath = 'assets/images/propic.jpg';
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _usernameController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        profileImagePath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('My Profile📱'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(profileImagePath),
            ),
          ),

          const SizedBox(height: 16.0),
          Text(
            'Welcome to KidsApp ${widget.username}!',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Username: ${widget.username}',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // show QR
          const SizedBox(height: 16.0),
          ListTile(
            title: const Text('Change Username'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangeUsername(),
                ),
              );
            },

            // more information details as neede here
          ),
        ],
      ),
    );
  }
}
