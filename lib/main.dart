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
  final GlobalKey<FormState> _secondFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController instragramController = TextEditingController();

  String firstName = "";

  bool submitIsVisible = true;
  bool secondFormIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       submitIsVisible = !submitIsVisible;
          //     });
          //   },
          //   child: const Text('Toggle Visibility'),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Form(
                    key: _formKey,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Primeiro nome',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Faltou seu nome aqui !';
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
                              "e o seu sobrenome também né",
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Sobrenome',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'E o sobrenome ?';
                            }
                            return null;
                          },
                          controller: lastNameController,
                        ),
                        SizedBox(height: 12),
                        Visibility(
                          visible: submitIsVisible,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  submitIsVisible = false;
                                });

                                Future.delayed(Duration(milliseconds: 500), () {
                                  firstName = firstNameController.text.trim();

                                  String completeName = firstNameController.text.trim() + ' ' + lastNameController.text.trim();

                                  setState(() {
                                    secondFormIsVisible = !secondFormIsVisible;
                                  });
                                });
                              }
                            },
                            child: const Text('É isso'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: secondFormIsVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Form(
                      key: _secondFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Prazer em te conhecer $firstName",
                                  style: TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Você pode me falar qual o seu Instagram, \n\n"
                                "para eu ver como você é ?",
                                style: TextStyle(
                                    fontSize: 18,
                                    height: 0.5,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "(Se você quiser é claro kkk !)",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 15,
                                    height: 1,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(color: Colors.blue)),
                                hintText: 'Ex: @caiofumiya',
                              ),
                              controller: instragramController,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();

                                  Future.delayed(Duration(milliseconds: 500), () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Seu insta é " + instragramController.text)),
                                    );
                                  });
                                }
                              },
                              child: const Text('Seguir'),
                            ),
                          ]),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
