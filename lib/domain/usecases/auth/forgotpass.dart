import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/forgot_pass_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class ForgotpassUseCase implements Usecase<Either, ForgotPassUserReq> {
  @override
  Future<Either> call({required ForgotPassUserReq params}) async {
    return await sl<AuthRepository>().forgotPass(params);
  }
}
