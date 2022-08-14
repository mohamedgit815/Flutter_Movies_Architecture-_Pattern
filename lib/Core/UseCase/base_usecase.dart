import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/Core/Error/failure.dart';

abstract class BaseUseCase<T,  Parameters> {
  Future<Either<Failure,T>> call(Parameters parameters);
}

class NoParameter extends Equatable {

  const NoParameter();


  @override
  List<Object?> get props => [];

}

