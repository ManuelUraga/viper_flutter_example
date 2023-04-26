abstract class UseCase<Type, Params> {
  Future<dynamic> call(Params params);
}
