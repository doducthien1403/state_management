import 'package:drawerflutter/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextFormField _buildTextFormField(
      String hintText, TextEditingController controller,
      {required String? Function(String? valueValidator) validatorFunc}) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
      ),
      validator: validatorFunc,
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    "username",
                    _usernameController,
                    validatorFunc: (String? usernameValue) {
                      if (usernameValue == "") {
                        return "Enter username";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildTextFormField(
                    "password",
                    _passwordController,
                    validatorFunc: (String? passwordValue) {
                      if (passwordValue!.length <= 6 ||
                          passwordValue.length >= 15) {
                        return "Enter password";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Thành công");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const HomeScreen())));
                      }
                    },
                    child: const Text("Đăng nhập"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
