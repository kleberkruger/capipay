import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:capipay/model/usuario.dart';

abstract class UsuarioRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void save(Usuario usuario);

  void delete(Usuario usuario);

  void deleteById(String id);

  Usuario? findById(String id);

  List<Usuario> findByNome(String nome);

  Usuario? findByEmail(String email);

  List<Usuario> findAll();
}
