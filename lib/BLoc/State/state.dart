import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:UX/Pages/homepage.dart';
import 'package:UX/Pages/error.dart';

abstract class HomesState extends Equatable {
  const HomesState();

  @override
  List<Object> get props => [];
}

class InitialHomeState extends HomesState {}

class LoadingHomeState extends HomesState {}

class LoadSucessHomeState extends HomesState {}

class NotLoadedHomeState extends HomesState {}
