import 'dart:async';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import './regis.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  @override
  RegisState get initialState => RegisInitial();

  @override
  Stream<RegisState> mapEventToState(RegisEvent event) async* {
    if (event is RegisButtonPressed) {
      RegisLoading();
      try {
        String statusError;

        await UserRepository()
            .regis(
          userName: event.userName,
          phonoNo: event.phoneNo,
          email: event.email,
          password: event.password,
        )
            .then((e) {
          statusError = e.status;
        });

        if (statusError == 'success') {
          yield RegisHome(userName: event.userName);
        } else if (statusError == 'error') {
          yield RegisFailure(error: 'Registasi gagal silahkan periksa kembali');
        }
      } catch (error) {
        yield RegisFailure(error: error.toString());
      }
    }
  }
}
