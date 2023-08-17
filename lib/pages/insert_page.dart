import 'package:app_list_members/repositorys/color_repositori.dart';
import 'package:app_list_members/repositorys/persons_repositor.dart';
import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final _form = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _sobrenome = TextEditingController();
  final _cargo = TextEditingController();
  final _email = TextEditingController();
  final _telefone = TextEditingController();
  late MembersRepository membros;

  final ColorRepository cores =ColorRepository();

  adicionar() async{
    if (_form.currentState!.validate()){
      await membros.adicionar(_nome.text, _sobrenome.text, _email.text, _telefone.text, _cargo.text);
      Navigator.pop(context);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    membros = context.watch<MembersRepository>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cores.corPrincipal,
        title: const Text('Adicionar Membro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(child: const Icon(Icons.person_add, size: 136,)),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nome,
                    decoration: const InputDecoration(label: Text('Nome')),
                  ),
                  TextFormField(
                    controller: _sobrenome,
                    decoration: const InputDecoration(label: Text('Sobrenome')),
                  ),
                  TextFormField(
                    controller: _cargo,
                    decoration: const InputDecoration(label: Text('Cargo')),
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(label: Text('E-mail'),hintText:  'example@example.com'),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um endereço de e-mail válido';
                        }
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                          return 'Por favor, insira um endereço de e-mail válido';
                        }
                        return null;
                    },
                  ),
                  TextFormField(
                    controller: _telefone,
                    decoration: const InputDecoration(label: Text('Telefone'), hintText: '(99) 99999-9999'),
                    inputFormatters: [MaskTextInputFormatter(mask: '(##) #####-####')],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 36),
              child: ElevatedButton(onPressed: adicionar, child: const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, weight: 48, size: 24,),
                    Text(' Adicionar', style: TextStyle(fontSize: 18),)
                  ],
                ),
              )),
            )
          ],
        )
        ),
    );
  }
}