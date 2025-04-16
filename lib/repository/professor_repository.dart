import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capipay/model/professor.dart';

class ProfessorRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void save(Professor aluno) {
    _firestore.collection("usuarios").doc("0").set(aluno.toMap());
  }

  void delete(Professor professor) {
    // delete(professor.id);
  }

  void deleteById(String id) {
    _firestore.collection('usuarios').doc("0").delete();
  }

  Future<Professor?> findById(String id) async {
    var doc = await _firestore.collection("usuarios").doc(id).get();
    if (!doc.exists || doc.data() == null) {
      return null;
    }
    return Professor.fromMap(doc.data()!);
  }

  Future<Professor?> findByRga(String rga) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("rga", isEqualTo: rga)
            .limit(1)
            .get();

    if (query.docs.isEmpty) return null;

    return Professor.fromMap(query.docs.first.data());
  }

  Future<List<Professor>> findByNome(String nome) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("nome", isGreaterThanOrEqualTo: nome)
            .where("nome", isLessThanOrEqualTo: "$nome\uf8ff")
            .get();

    return query.docs.map((doc) => Professor.fromMap(doc.data())).toList();
  }

  Future<Professor?> findByEmail(String email) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("rga", isEqualTo: email)
            .limit(1)
            .get();

    if (query.docs.isEmpty) return null;

    return Professor.fromMap(query.docs.first.data());
  }

  Future<List<Professor>> findAll() async {
    List<Professor> alunos = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("usuarios").get();
    for (var doc in snapshot.docs) {
      alunos.add(Professor.fromMap(doc.data()));
    }
    return alunos;
  }
}
