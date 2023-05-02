import 'package:dartz/dartz.dart';
import 'package:viper_flutter_example/utility/app_exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppException, dynamic>> call(Params params);
}
