import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NotificacionState extends Equatable {
  final bool loading;
  final List<dynamic> notificaionTurno;

  NotificacionState({required this.loading, required this.notificaionTurno});

  static NotificacionState initialState() =>
      NotificacionState(loading: false, notificaionTurno: []);

  NotificacionState notiTurno(
      {bool loading: true, List<dynamic> notificaionTurno}) {
    return NotificacionState(
        loading: loading ?? this.loading,
        notificaionTurno: notiTurno ?? this.notificaionTurno);
  }

  @override
  List<Object> get props => [this.loading, this.notificaionTurno];
}
