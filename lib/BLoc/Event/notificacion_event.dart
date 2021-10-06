import 'package:equatable/equatable.dart';

class NotificacionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TurnoAceptadoEvent extends NotificacionEvent {}

class TurnoDenegadoEvent extends NotificacionEvent {}

class ProcesandoTurnoEvent extends NotificacionEvent {}
