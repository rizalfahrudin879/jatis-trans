import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisEvent extends Equatable {
  const RegisEvent();
}

class RegisAppInitial extends RegisEvent {
  @override
  List<Object> get props => [];
}

class RegisButtonPressed extends RegisEvent {
  final String userName;
  final String phoneNo;
  final String email;
  final String password;

  const RegisButtonPressed({
    @required this.userName,
    @required this.phoneNo,
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [userName, phoneNo, email, password];
}
