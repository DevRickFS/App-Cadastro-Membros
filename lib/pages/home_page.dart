// ignore_for_file: prefer_const_constructors


import 'package:app_list_members/pages/insert_page.dart';
import 'package:app_list_members/pages/membros_detalhes_page.dart';
import 'package:app_list_members/repositorys/color_repositori.dart';
import 'package:app_list_members/repositorys/persons_repositor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get separatorBuilder => null;
  ColorRepository cores = ColorRepository();
  

  @override
  Widget build(BuildContext context) {
    final tabela = context.watch<MembersRepository>();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[850],
        toolbarHeight: 80,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: EdgeInsets.symmetric(horizontal: 24),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(Icons.menu_outlined),
              iconSize: 36,);
          }
        ),
        title: Text(
          'Lista de Membros', 
          style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w500,
              ),
            ),
        centerTitle: true,
      ),
      body: Container(
        child: (tabela.tabela.isEmpty)? Center(
          child: Text('Nenhum Membro inserido ate o momento!'),
        ) : ListView.builder(
          padding:const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 24),
          itemBuilder: (BuildContext context, int index) {
            return InkWell( 
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> MembersDetalhePage(membro:tabela.tabela[index])));
              },
              child: Card(
                color: (index.isOdd)? cores.corPrincipal.withAlpha(130): cores.corPrincipal.withAlpha(200),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(bottom: 24),
                child: Padding(
                  padding: EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 8),
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Row(
                                  children:  [
                                    Text(tabela.tabela[index].getNome, 
                                    style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 24),),
                                  ],
                                ),
                                Text(tabela.tabela[index].getCargo, style: TextStyle(fontWeight: FontWeight.w200,), )
                              ],
                            ), 
                            Row(
                              children:  [Icon(Icons.phone_outlined), SizedBox(width: 20,), Text(tabela.tabela[index].getTelefone)],
                            ),
                            Row(
                              children:  [Icon(Icons.email_outlined), SizedBox(width: 20,),Text(tabela.tabela[index].getEmail)],
                            )
                          ],
                        ), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: (){}, icon: Icon(Icons.info_outline))],
                          )
                        ],
                    ),
                  ),
                ),
                  
                )
              );
        
          }, 
          itemCount: tabela.tabela.length),
        ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(_) =>  InsertPage()));
      },
      child: Icon(Icons.add, size: 36, color: Colors.white,),),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}