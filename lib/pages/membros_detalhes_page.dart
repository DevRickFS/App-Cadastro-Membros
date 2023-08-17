import 'package:app_list_members/models/membros.dart';
import 'package:flutter/material.dart';

class MembersDetalhePage extends StatefulWidget {
  const MembersDetalhePage({super.key, required this.membro});
  final Membros membro;

  @override
  State<MembersDetalhePage> createState() => _MembersDetalhePageState();
}

class _MembersDetalhePageState extends State<MembersDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.membro.getNome),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Icon(Icons.person, size: 150,),
              Text(widget.membro.getTelefone),
            ],
          ),
        ],
      ),
    );
  }
}