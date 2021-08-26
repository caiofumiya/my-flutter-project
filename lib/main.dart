import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool submitIsVisible = true;

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "E ai, Bom Dia !",
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Me conta seu primeiro nome \n\n"
                          "pra eu saber quem é você.",
                      style: TextStyle(
                          fontSize: 18,
                          height: 0.5,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Primeiro nome',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: firstNameController,
                ),
                SizedBox(height: 16),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Agora me fala o seu sobrenome",
                      style: TextStyle(
                          fontSize: 18,
                          height: 0.5,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Sobrenome',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: lastNameController,
                ),
                SizedBox(height: 16),
                Visibility(
                    visible: submitIsVisible,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {

                          setState(() {
                            submitIsVisible = false;
                          });

                          String completeName = firstNameController.text.trim() + ' ' + lastNameController.text.trim();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Olá " + completeName)),
                          );

                        }
                      },
                      child: const Text('Submit'),
                    ),
                ),
                SizedBox(height: 16),
              ],
            )),
      ),
    );
  }
}
