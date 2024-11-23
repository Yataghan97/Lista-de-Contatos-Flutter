import 'package:flutter/material.dart';
import 'contact.dart'; 

class ContactsFormScreen extends StatefulWidget {
  const ContactsFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactsFormScreenState createState() => _ContactsFormScreenState();
}

class _ContactsFormScreenState extends State<ContactsFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _salvarContact() {
    if (_formKey.currentState!.validate()) {
      final newContact = Contact(
        name: nameController.text,
        numero: numeroController.text,
        email: emailController.text,
      );
      Navigator.pop(context, newContact); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Contato'),
      ),
      body: Container(
        color: Colors.white, 
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor, Insira o nome.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: numeroController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor, Insira um telefone.';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Insira um número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor, Insira um Email.';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                    return 'Insira um email válido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: _salvarContact,
                  style: ElevatedButton.styleFrom(),
                  child: const Text('Adicionar Contato',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
