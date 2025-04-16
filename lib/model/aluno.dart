import 'usuario.dart';

class Aluno extends Usuario {
  String _rga;

  Aluno({
    required String nome,
    required String email,
    required String senha,
    required String rga,
  }) : _rga = rga,
       super(nome, email, senha);

  String get rga => _rga;

  set rga(String valor) {
    if (valor.isEmpty || valor.length < 5) {
      throw ArgumentError('O RGA deve ter pelo menos 5 caracteres.');
    }
    _rga = valor;
  }

  factory Aluno.fromMap(Map<String, dynamic> map) => Aluno(
    nome: map['nome'],
    email: map['email'],
    senha: map['senha'],
    rga: map['rga'],
  );

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'email': email,
    'senha': senha,
    'rga': rga,
  };

  @override
  String toString() {
    return 'Aluno(nome: $nome, email: $email, RGA: $_rga)';
  }
}
