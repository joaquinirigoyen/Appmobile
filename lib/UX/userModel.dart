class UsuarioModel {
  //definiendo valores
  String? uid;
  String? email;
  String? nombreCompleto;
  String? dni;

  UsuarioModel({this.uid, this.email, this.nombreCompleto, this.dni});

  // recibe la información del servidor
  factory UsuarioModel.fromMap(map) {
    return UsuarioModel(
      uid: map['uid'],
      email: map['email'],
      nombreCompleto: map['nombreCompleto'],
      dni: map['dni'],
    );
  }

  // devuelve información al servidor
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nombreCompleto': nombreCompleto,
      'dni': dni,
    };
  }
}
