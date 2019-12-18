import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisState extends Equatable {
  const RegisState();

  @override
  List<Object> get props => null;
}

class RegisInitial extends RegisState {}

class RegisHome extends RegisState {
   final String userName;

  const RegisHome({@required this.userName});

  @override
  List<Object> get props => [userName];
}

class RegisLoading extends RegisState {}

class RegisFailure extends RegisState {
  final String error;

  const RegisFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
