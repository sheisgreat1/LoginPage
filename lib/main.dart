// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

bool isSecured = true;

Map<String, User> users = {
  "Jana@gmail.com": User(email: 'Jana@gmail.com', password: '2000'),
  "Hashplus@yahoo.com": User(email: 'Hashplus@yahoo.com', password: '2024'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 167, 189),
        title:
         Text(
          "Login Page",
          
          style: TextStyle(fontSize: 23, color: Colors.white
         ,fontWeight: FontWeight.bold), 
          )
      ),
        body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(padding: EdgeInsets.only(top:20)),
            Image.asset(
              'assets/classic-log-classic-ef.gif',
              width: 250,
              height: 250,
              
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  
                  Container(
                    decoration: BoxDecoration(  
                     borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                      boxShadow: [BoxShadow(
                       blurRadius: 5,
                          color: const Color.fromARGB(206, 0, 0, 0),
                          offset: Offset(1,9)

                    )]),
                    child: TextFormField(
                      
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('Enter Email'),
                        prefixIcon: Icon(Icons.person),
                        
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(  
                     borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                      boxShadow: [BoxShadow(
                       blurRadius: 5,
                          color: const Color.fromARGB(206, 0, 0, 0),
                          offset: Offset(1,9)

                    )]),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: isSecured,
                      decoration: InputDecoration(
                        label: Text('Enter password'),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      User user = users[emailController.text]!;
                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print('logged');
                      } else {
                        print('email or password is wrong');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 234, 167, 189),
                        boxShadow: [   BoxShadow(
                          blurRadius: 5,
                          color: const Color.fromARGB(206, 0, 0, 0),
                          offset: Offset(1,9)
                        )]

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
