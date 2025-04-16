import 'model/aluno.dart';
import 'model/disciplina.dart';
import 'model/professor.dart';
import 'repository/aluno_repository.dart';
import 'repository/professor_repository.dart';
import 'repository/disciplina_repository.dart';

void teste() async {
  try {
    var aluno = Aluno(
      nome: "Ana Rubia Schneider Sampaio",
      senha: "senha123",
      email: "ana.schneider@ufms.br",
      rga: "202208030335",
    );
    print(aluno);

    var alunoRepository = AlunoRepository();
    alunoRepository.save(aluno);

    var professor = Professor(
      nome: "Kleber Kruger",
      senha: "senha123",
      email: "kleber.kruger@ufms.br",
      siape: 2917083,
    );
    print(professor);

    var professorRepository = ProfessorRepository();
    professorRepository.save(professor);

    var disciplina = Disciplina(
      codigo: "08050004218",
      nome: "Linguagem de Programação Orientada a Objetos",
      turma: "T01",
      ano: 2025,
      semestre: 1,
      professor: professor,
    );

    disciplina.adicionarAluno(aluno);
    print(disciplina);

    var disciplinaRepository = DisciplinaRepository();
    disciplinaRepository.save(disciplina);
  } catch (e) {
    print("Erro: $e");
  }
}
