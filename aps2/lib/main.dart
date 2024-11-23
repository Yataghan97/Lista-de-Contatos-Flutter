import 'package:flutter/material.dart';
import 'formulario.dart'; 
import 'contatos.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => const Contatos(), 
        '/addContacts': (context) => const ContactsFormScreen(), 
        '/contacts': (context) => const Contatos(), 
        '/formulario': (context) => const ContactsFormScreen(), 
      },
    );
  }
}
