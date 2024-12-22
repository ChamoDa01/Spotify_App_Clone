import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninUserReq signinUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);
}
