// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
//import 'dart:html';
import 'dart:ui';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/src/providers/Modelo/Usuario.dart';
import 'package:flutter_application_1/src/providers/Modelo/apiservice.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/providers/Modelo/Usuario.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController txtusuario = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                    Color.fromARGB(255, 251, 255, 35),
                    Color.fromARGB(255, 140, 233, 64),
                    Color.fromARGB(255, 242, 127, 33),
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset('images/logo1.png'),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 5,
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'RADIO TAXIS "IBARRA"',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 275,
                    width: 325,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('HOLA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ingrese usuario',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          // ignore: prefer_const_constructors
                          child: TextField(
                            controller: txtusuario,
                            decoration: InputDecoration(
                              labelText: 'usuario',
                            ),
                            onChanged: (value) {
                              value = txtusuario.text;
                            }, //funcion al cambiar de valos
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 200,
                          // ignore: prefer_const_constructors
                          child: TextField(
                            controller: txtpass,
                            onChanged: (value) {
                              value = txtpass.text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'contraseña',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Has olvidado tu contraseña',
                            style: TextStyle(
                              color: Colors.orangeAccent[700],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            getLogin();
                          },
                          child: Text('Login'))
                    ],
                  ))
                ],
              )),
        ));
  }

  Future<void> getLogin() async {
    Map<dynamic, dynamic> u;
    final response = await http
        .get(Uri.parse('http://pablotesisservice.azurewebsites.net/Usuario/' +
            txtusuario.text +
            '/' +
            txtpass.text))
        .then((response) {
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        Usuario u = Usuario.fromJson(jsonData);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home_screen()),
        );
      }
    });
  }
}
