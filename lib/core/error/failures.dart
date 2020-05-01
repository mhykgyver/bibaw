import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends IFailure {}

class CacheFailure extends IFailure {}

class NullFailure extends IFailure {}
