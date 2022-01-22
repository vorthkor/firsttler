

//import 'dart:html';

import 'package:exemplo/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/index.jpg'),
              ),
              Container(
                height: 20,
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder()
                        ),
                      ),

                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if(email == 'user@mock.com' && password == 'mockpass') {
                            print('correto');
                            //navegando
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print('login invalido');
                          }
                        },
                        child: Container(
                          width: double.infinity,
                            child: Text('Entrar',
                            textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.blue.withOpacity(0.7)),
          _body(),
        ],
      )
    );
  }
}
