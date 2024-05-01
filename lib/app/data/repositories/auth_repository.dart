import 'package:dartz/dartz.dart';
import 'package:dummyapp/app/core/services/app_config.dart';
import 'package:dummyapp/app/data/model/base_dir/base_model.dart';
import 'package:dummyapp/app/network/api_controller.dart';
import '../../core/constants/urls.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../model/request_model/login_request_model.dart';
import '../model/response_model/login_response_model.dart';

class AuthRepository {
  final ApiControllerV1 apiControllerV1;

  AuthRepository({required this.apiControllerV1});

  Future<Either<Failure, BaseModel<LoginData>>> login(
      {required LoginRequestModel request}) async {
    try {
      final response = await apiControllerV1.post(
        path: AppConfig().baseUrl + EndPoints.login,
        data: request.toJson(),
      );

      return Right(BaseModel<LoginData>.fromJson(
          response, (data) => LoginData.fromJson(data)));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
