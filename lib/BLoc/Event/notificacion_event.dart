import 'package:equatable/equatable.dart';

abstract class NotificacionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TurnoAceptado extends NotificacionEvent {}

class TurnoDenegadoEvent extends NotificacionEvent {}

class ProcesandoTurnoEvent extends NotificacionEvent {}
