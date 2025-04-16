import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capipay/model/disciplina.dart';
import 'package:capipay/model/professor.dart';

class DisciplinaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void save(Disciplina disciplina) {
    _firestore.collection("usuarios").doc("0").set(disciplina.toMap());
  }

  void delete(Disciplina disciplina) {
    // _firestore.collection('disciplinas').doc(disciplina.id).delete();
  }

  void deleteById(String id) {
    _firestore.collection('disciplinas').doc("0").delete();
  }

  Disciplina? findById(String id) {
    return null;
  }

  List<Disciplina> findByNome(String nome) {
    return [];
  }

  List<Disciplina> findByProfessor(Professor professor) {
    return [];
  }

  List<Disciplina> findByProfessorId(String professorId) {
    return [];
  }

  List<Disciplina> findAll() {
    return [];
  }
}
