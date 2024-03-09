import 'package:flutter/material.dart';

import 'dropdrop_on_class_widget.dart';
import 'favorite_movie_widget.dart';

class TextFieldOnClassWidget extends StatefulWidget {
  const TextFieldOnClassWidget({super.key});

  @override
  State<TextFieldOnClassWidget> createState() => _TextFieldOnClassWidgetState();
}

class _TextFieldOnClassWidgetState extends State<TextFieldOnClassWidget> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  String? errorPassword;

  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 700,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  label: Text('Username'),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true, //toggle
                onChanged: (currentText) {
                  setState(() {
                    errorPassword = null;
                  });
                },
                decoration: InputDecoration(
                  label: const Text('Password'),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 10),
                  errorText: errorPassword,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    onChanged: (isSelected) {
                      setState(() {
                        isRememberMe = isSelected ?? false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print(_usernameController.text);
                  print(_passwordController.text);
                  setState(() {
                    errorPassword = 'Sai mật khẩu';
                  });
                },
                child: const Text('Login'),
              ),
              const FavoriteMovieWidget(),
              const SizedBox(
                height: 24,
              ),
              DropdownOnClassWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
