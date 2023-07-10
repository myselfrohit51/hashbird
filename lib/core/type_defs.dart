import 'package:fpdart/fpdart.dart';
import 'package:hashbird/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;