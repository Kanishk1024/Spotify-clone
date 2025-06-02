import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/forgot_pass_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> forgotPass(ForgotPassUserReq forgotPassUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return const Right("Sign In Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Invalid Email';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid Password provided for the user';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      await FirebaseFirestore.instance.collection('users').add(
        {
          'email': data.user?.email,
          'name': createUserReq.fullName,
        },
      );
      return const Right('Sign was successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> forgotPass(ForgotPassUserReq forgotPassUserReq) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotPassUserReq.email);
      return const Right('Email sent');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'auth/invalid-email') {
        message = 'Invalid Email';
      } else if (e.code == 'auth/user-not-found') {
        message = 'User Not Found';
      }
      return Left(message);
    }
  }
}
