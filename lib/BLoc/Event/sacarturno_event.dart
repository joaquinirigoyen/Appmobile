import 'package:equatable/equatable.dart';

class SacarTurnoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GimnasiolibreEvent extends SacarTurnoEvent {}

class GimansioCerradoEvent extends SacarTurnoEvent {}

class GimnasioOcupadoEvent extends SacarTurnoEvent {}
