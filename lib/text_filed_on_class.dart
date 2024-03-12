import 'package:date_format/date_format.dart';
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

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

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
              const DropdownOnClassWidget(),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () async {
                  // await showDatePicker(context: context);
                  final result = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050, 12, 31),
                    initialDate: selectedDate, // current selected date
                    // builder: (context, child) {
                    //   return Theme(
                    //     data: ThemeData(
                    //       datePickerTheme: DatePickerThemeData(
                    //         backgroundColor: Colors.red,
                    //         headerBackgroundColor: Colors.amber,
                    //         todayBackgroundColor:
                    //             MaterialStateProperty.resolveWith<Color>(
                    //                 (states) {
                    //           if (states.contains(MaterialState.selected)) {
                    //             return Colors.red;
                    //           } else {
                    //             return Colors.green;
                    //           }
                    //         }),
                    //       ),
                    //     ),
                    //     child: child ?? const SizedBox(),
                    //   );
                    // },
                  );
                  print(result);
                  if (result != null) {
                    setState(() {
                      selectedDate = result;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formatDate(selectedDate, [dd, '/', mm, '/', yyyy]),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
