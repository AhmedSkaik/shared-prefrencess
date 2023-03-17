import 'package:flutter/material.dart';
import 'package:sherd_pref_app/Modals/User.dart';
import 'package:sherd_pref_app/Shared_pref/Shared_pref_controller.dart';

class LoginScrean extends StatefulWidget {
  LoginScrean({Key? key}) : super(key: key);

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  late TextEditingController _emailTextController;
  late TextEditingController _passTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passTextController = TextEditingController();
//
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    super.dispose();
//
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Login Screan',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome back...'),
              const SizedBox(height: 15),
              const Text(
                'Write your password and email',
                style: TextStyle(height: 0.5),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passTextController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => performedlogin(),
                child: const Text('login'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              )
            ],
          ),
        ));
  }

  void performedlogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Eror Data!!'),
      backgroundColor: Colors.red,
      dismissDirection: DismissDirection.horizontal,
    ));
    return false;
  }

  Future<void> login() async {
    await SharedPrefController().save(user);
    Navigator.pushReplacementNamed(context, 'home_Screan');
  }

  User get user {
    return User(name: 'User Name', email: _emailTextController.text);
  }
}
