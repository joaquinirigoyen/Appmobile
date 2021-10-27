/* import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:app_gym/BLoc/Event/notificacion_event.dart';
import 'package:app_gym/BLoc/State/notificacion_state.dart';

class NotificacionTurnoBloc extends Bloc<NotificacionEvent, NotificacionState> {
  NotificacionTurnoBloc(NotificacionState initialState) : super(initialState) {
    add(NotificacionEvent());
  }

  @override
  Stream<NotificacionState> mapEventToState(NotificacionEvent event) async* {
    if (event is NotificacionEvent) {
      print('¡El turno fue guardado con exito!');
      yield this.state.notiTurno(loading: true, notificaionTurno: []);
      await Future.delayed(Duration(seconds: 2));
    } else if (event is TurnoDenegadoEvent) {
      print('¡El turno fue denegado! ');
    } else if (event is ProcesandoTurnoEvent) {
      print('¡El turno esta siendo procesado!');
    }
  }
}
 */