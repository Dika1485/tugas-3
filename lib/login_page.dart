import 'package:tugas_3/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var namauser;
  _buatInput(namacontroller, String hint) {
    return TextFormField(
      controller: namacontroller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      validator: (String? value) {
        return (value == null || value.isEmpty)
            ? "Please enter some text"
            : null;
      },
    );
  }

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buatInput(_usernameController, 'Insert Username'),
                  _buatInput(_passwordController, 'Insert Password'),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_usernameController.text == 'admin' &&
                            _passwordController.text == 'admin') {
                          _saveUsername();
                          _loadUsername();
                          showDialog(
                              context: context,
                              builder: (context) {
                                var namauser2 = namauser;
                                namauser2 = (namauser == null) ? "" : namauser2;
                                return AlertDialog(
                                  title: const Text('Login Successed'),
                                  // content: Text(namauser2),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Login Failed'),
                                  content: const Text(
                                      'Username or Password is Wrong'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
