import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SacarTurnoState extends Equatable {
  final bool loading;
  final List<dynamic> gimnasioLibre;

  SacarTurnoState({required this.loading, required this.gimnasioLibre});

  static SacarTurnoState initialState() =>
      SacarTurnoState(loading: false, gimnasioLibre: []);

  SacarTurnoState gimLibre({bool loading: true, List<dynamic> gimnasioLibre}) {
    return SacarTurnoState(
        loading: loading ?? this.loading,
        gimnasioLibre: gimnasioLibre ?? this.gimnasioLibre);
  }

  @override
  List<Object> get props => [this.loading, this.gimnasioLibre];
}
