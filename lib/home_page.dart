
//import 'dart:html';

import 'package:flutter/material.dart';

import 'app_controller.dart';

// modificaveis - com estado, podem ser alterados
// cria a classe e estende para stateful
class HomePage extends StatefulWidget {
  @override
  // inves de build ele pede um estado que vai ser modificado
  State<HomePage> createState() {
    return HomePageState();
  }
}

// classe de estado para modificar o stateful
//referenciado pelo HomePage
//esse herda apenas do stateful widget
class HomePageState extends State<HomePage> {

  int counter = 0;

  @override
  //build do satateful aparece aqui
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: 
              ClipOval(child: Image.asset('assets/images/index.jpg')),
                accountName: Text('user'),
                accountEmail: Text('user@mock.com'),
            ),
            Container(height: 20,),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              subtitle: Text('Tela de inicio'),
              onTap: () {
                print('home');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Logout'),
              subtitle: Text('Finaliza sessao'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitch(),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!'),
            Container(height: 50),
            Text('Counter: $counter'),
            Container(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() { //tudo que for modificado das variaveis colocar no setstate para modificar globalmente
            counter++;
          });
        },),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
