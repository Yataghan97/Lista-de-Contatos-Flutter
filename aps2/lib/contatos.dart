import 'package:flutter/material.dart';
import 'contact.dart';

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  ContatosState createState() => ContatosState();
}

class ContatosState extends State<Contatos> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    _contatos();
  }

  void _contatos() {
    setState(() {
      contacts = [
        Contact(name: 'Alice', numero: '123456789', email: 'alice@hotmail.com'),
        Contact(name: 'Maria', numero: '987654321', email: 'maria@gmail.com'),
        Contact(name: 'Jose', numero: '555555555', email: 'jose@outlook.com'),
      ];
    });
  }

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);      
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Contato adicionado com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _removeContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Contato removido com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void addcontato() async {
    final newContact = await Navigator.pushNamed(context, '/formulario');
    if (newContact != null && newContact is Contact) {
      _addContact(newContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.numero),
                Text(contact.email),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _removeContact(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addcontato,
        child: Icon(Icons.add),
      ),
    );
  }
}