abstract class Usuario {
  String _nome;
  String _email;
  String _senha;

  Usuario(String nome, String email, String senha)
    : _nome = nome,
      _email = email,
      _senha = senha;

  String get nome => _nome;

  set nome(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('O nome não pode ser vazio.');
    }
    _nome = valor.trim();
  }

  String get email => _email;

  set email(String valor) {
    final regex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
    if (!regex.hasMatch(valor)) {
      throw ArgumentError('E-mail inválido.');
    }
    _email = valor;
  }

  String get senha => _senha;

  set senha(String valor) {
    if (valor.length < 4) {
      throw ArgumentError('A senha deve ter pelo menos 4 caracteres.');
    }
    if (!RegExp(r'[A-Z]').hasMatch(valor)) {
      throw ArgumentError(
        'A senha deve conter pelo menos uma letra maiúscula.',
      );
    }
    if (!RegExp(r'[0-9]').hasMatch(valor)) {
      throw ArgumentError('A senha deve conter pelo menos um número.');
    }
    _senha = valor;
  }
}
