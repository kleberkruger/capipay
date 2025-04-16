import 'usuario.dart';

class Professor extends Usuario {
  int _siape;

  Professor({
    required String nome,
    required String email,
    required String senha,
    required int siape,
  }) : _siape = siape,
       super(nome, email, senha);

  int get siape => _siape;

  set rga(int valor) {
    if (valor < 0 && valor > 999999999999) {
      throw ArgumentError('Valor incorreto.');
    }
    _siape = valor;
  }

  factory Professor.fromMap(Map<String, dynamic> map) => Professor(
    nome: map['nome'],
    email: map['email'],
    senha: map['senha'],
    siape: map['siape'],
  );

  Map<String, dynamic> toMap() => {
    'nome': nome,
    'email': email,
    'senha': senha,
    'siape': siape,
  };

  @override
  String toString() {
    return 'Professor(nome: $nome, email: $email, SIAPE: $_siape)';
  }
}
