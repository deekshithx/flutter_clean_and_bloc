abstract class UseCase<Type, Params> {
  Future<Type> call(int page);
}
