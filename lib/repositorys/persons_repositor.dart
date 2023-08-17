import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:app_list_members/models/membros.dart';

import '../database/db.dart';

class MembersRepository extends ChangeNotifier{
  late Database db;
  List<Membros> tabela = [];

  MembersRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getMembros();
  }

  adicionar(String nome, String sobrenome, String email, String telefone, String cargo) async {
    db = await DB.instance.database;
    await db.transaction((txn) async {
      await txn.insert('membros', {
          'nome' : nome,
          'sobrenome' : sobrenome,
          'cargo': cargo,
          'email' : email,
          'telefone' : telefone,
      });
    });
    await _initRepository();
    notifyListeners();
  }
  _getMembros() async {
    db = await  DB.instance.database;
    tabela = [];
    List pessoas = await db.query('membros');
    for (var element in pessoas) {
      tabela.add(Membros(
        id: element['id'],
        nome: element['nome'], 
        sobrenome: element['sobrenome'], 
        cargo: element['cargo'], 
        telefone: element['Telefone'], 
        email: element['email'],
        )
      );
    }
    notifyListeners();
  }
}