import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/failure.dart';

mixin UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParams {}
