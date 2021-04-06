abstract class UseCase<Object, Params> {
  Future<dynamic> call();
}

class NoParams {
  List<Object> get props => [];
}
