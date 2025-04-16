import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capipay/model/aluno.dart';

class AlunoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void save(Aluno aluno) {
    _firestore.collection("usuarios").doc("1").set(aluno.toMap());
  }

  void delete(Aluno aluno) {
    // delete(aluno.id);
  }

  void deleteById(String id) {
    _firestore.collection('usuarios').doc("1").delete();
  }

  Future<Aluno?> findById(String id) async {
    var doc = await _firestore.collection("usuarios").doc(id).get();
    if (!doc.exists || doc.data() == null) {
      return null;
    }
    return Aluno.fromMap(doc.data()!);
  }

  Future<Aluno?> findByRga(String rga) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("rga", isEqualTo: rga)
            .limit(1)
            .get();

    if (query.docs.isEmpty) return null;

    return Aluno.fromMap(query.docs.first.data());
  }

  Future<List<Aluno>> findByNome(String nome) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("nome", isGreaterThanOrEqualTo: nome)
            .where("nome", isLessThanOrEqualTo: "$nome\uf8ff")
            .get();

    return query.docs.map((doc) => Aluno.fromMap(doc.data())).toList();
  }

  Future<Aluno?> findByEmail(String email) async {
    final query =
        await _firestore
            .collection("usuarios")
            .where("rga", isEqualTo: email)
            .limit(1)
            .get();

    if (query.docs.isEmpty) return null;

    return Aluno.fromMap(query.docs.first.data());
  }

  Future<List<Aluno>> findAll() async {
    List<Aluno> alunos = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("usuarios").get();
    for (var doc in snapshot.docs) {
      alunos.add(Aluno.fromMap(doc.data()));
    }
    return alunos;
  }
}
