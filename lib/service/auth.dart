import 'package:alisverissepeti/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth
      .instance; //Firebaseauth nesnesinden bir değişken tanımladım kullanabilmek için instance etmek gerekiyor
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<User> createPerson(
  String name, String password, String email, String cinsiyet) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  await _firestore.collection("KULLANICILAR").doc(user.user.uid).set({
      'userName': name,
      'email': email,
      'cinsiyet': cinsiyet,
    });

    return user.user;
  }

  signOut() async {
    return await _auth.signOut();
  }

 }
