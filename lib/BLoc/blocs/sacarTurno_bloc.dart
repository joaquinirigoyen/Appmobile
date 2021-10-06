import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:app_gym/BLoc/Event/sacarturno_event.dart';
import 'package:app_gym/BLoc/State/sacarturnos_state.dart';

class SacarTurnoBloc extends Bloc<SacarTurnoEvent, SacarTurnoState> {
  SacarTurnoBloc(SacarTurnoState initialState) : super(initialState) {
    add(SacarTurnoEvent());
  }

  @override
  Stream<SacarTurnoState> mapEventToState(SacarTurnoEvent event) async* {
    if (event is SacarTurnoEvent) {
      print('Gimnasio libre');
      yield this.state.gimLibre(loading: true, gimnasioLibre: []);
      await Future.delayed(Duration(seconds: 2));
    } else if (event is GimansioCerradoEvent) {
      print('El gimnasio esta cerrado. ');
    } else if (event is GimnasioOcupadoEvent) {
      print('El gimnasio esta ocupado.');
    }
  }
}
