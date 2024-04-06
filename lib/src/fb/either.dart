sealed class Either<L, R> {}

class Left<L, R> extends Either {
  final L value;
  Left(this.value);
}

class Rigth<L, R> extends Either {
  final R value;
  Rigth(this.value);
}