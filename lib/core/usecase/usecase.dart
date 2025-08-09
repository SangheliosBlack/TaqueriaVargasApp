abstract class UseCase<T, P> {
  Future<T> execute({required P params});
}

/// UseCase sin parámetros (azúcar sintáctica)
abstract class NoParamsUseCase<T> {
  Future<T> call();
}