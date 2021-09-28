import 'dart:async';
import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:app_gym/BLoc/Event/sacarturno_event.dart';
import 'package:app_gym/BLoc/State/sacarturnos_state.dart';
import 'package:equatable/equatable.dart';

class SacarTurnoBloc extends Bloc<SacarTurnoEvent, SacarTurnoState> {
  SacarTurnoBloc(GimansioLibreState initialState); super(initialState){

  }

  @Override
  Stream<GimansioLibreState> mapEventToState(GimnasiolibreEvent)async*{
    if (event is GimnasioLibreEvent)
  }
}
