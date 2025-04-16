import 'professor.dart';
import 'aluno.dart';

class Disciplina {
  String _codigo;
  String _nome;
  String _turma;
  int _ano;
  int _semestre;
  Professor _professor;
  List<Aluno> _alunos;

  Disciplina({
    required String codigo,
    required String nome,
    required String turma,
    required int ano,
    required int semestre,
    required Professor professor,
  }) : _codigo = codigo,
       _nome = nome,
       _turma = turma,
       _ano = ano,
       _semestre = semestre,
       _professor = professor,
       _alunos = [];

  String get codigo => _codigo;

  set codigo(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('Código da disciplina não pode ser vazio.');
    }
    _codigo = valor.trim();
  }

  String get nome => _nome;

  set nome(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('Nome da disciplina não pode ser vazio.');
    }
    _nome = valor.trim();
  }

  String get turma => _turma;

  set turma(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('Turma não pode ser vazia.');
    }
    _turma = valor.trim();
  }

  int get ano => _ano;

  set ano(int valor) {
    if (valor < 2000) {
      throw ArgumentError('Ano inválido. Deve ser 2000 ou superior.');
    }
    _ano = valor;
  }

  int get semestre => _semestre;

  set semestre(int valor) {
    if (valor < 1 || valor > 2) {
      throw ArgumentError('Semestre deve ser 1 ou 2.');
    }
    _semestre = valor;
  }

  Professor get professor => _professor;

  set professor(Professor prof) {
    _professor = prof;
  }

  List<Aluno> get alunos => List.unmodifiable(_alunos);

  void adicionarAluno(Aluno aluno) {
    if (_alunos.contains(aluno)) {
      throw ArgumentError('Aluno já está matriculado na disciplina.');
    }
    _alunos.add(aluno);
  }

  void removerAluno(Aluno aluno) {
    _alunos.remove(aluno);
  }

  factory Disciplina.fromMap(Map<String, dynamic> map) => Disciplina(
    nome: map['nome'],
    codigo: map['email'],
    turma: map['senha'],
    ano: map['siape'],
    semestre: map['semestre'],
    professor: map['professor'],
    // alunos: map['alunos']
  );

  Map<String, dynamic> toMap() => {
    'codigo': codigo,
    'nome': nome,
    'turma': turma,
    'semestre': '$ano-$semestre',
    // 'professor': '$professor'
  };

  @override
  String toString() {
    return 'Disciplina: [$_codigo] - $_nome\n'
        'Turma: $_turma | Semestre: $_ano-$_semestre\n'
        'Professor: ${_professor.nome}\n'
        'Alunos matriculados: ${_alunos.length}';
  }
}
