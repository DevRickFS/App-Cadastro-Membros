class Membros {
  int _id = 0;
  String _nome = "";
  String _sobrenome = "";
  String _cargo = "";
  String _telefone = "";
  String _email = "";
  
  Membros({required int id, required String nome, required String sobrenome,required String cargo, required String telefone, required String email}){
    _id = id;
    _nome = nome;
    _cargo = cargo;
    _telefone = telefone;
    _email = email;
    _sobrenome = sobrenome;
  }
  
  String get getId => _id.toString();
  String get getNome => '$_nome $_sobrenome';
  String get getCargo => _cargo;
  String get getTelefone => _telefone;
  String get getEmail => _email;
}