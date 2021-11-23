import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'calendar.dart';

class Turnos extends StatefulWidget {
  @override
  _TurnosState createState() => _TurnosState();
}

class _TurnosState extends State<Turnos> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController tiempo = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  final formkey = GlobalKey<FormState>();

  create() async {
    try {
      await firebase.collection("usuarios").doc().set({
        "name": name.text,
        "email": email.text,
        "fecha": fecha.text,
        "tiempo": tiempo.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      await firebase.collection("usuarios").doc().update({
        "name": name.text,
        "email": email.text,
        "fecha": fecha.text,
        "tiempo": tiempo.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      await firebase.collection("User").doc().delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET20"),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Calendar()));
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: name,
                validator: (value) => value!.isEmpty ? "campo requerido" : null,
                decoration: InputDecoration(
                  labelText: 'Nombre de usuario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: email,
                validator: (value) => value!.isEmpty ? "campo requerido" : null,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: tiempo,
                validator: (value) => value!.isEmpty ? "campo requerido" : null,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Hora xx.xx',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: fecha,
                validator: (value) => value!.isEmpty ? "campo requerido" : null,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Dia xx-xx-xx',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        create();
                        name.clear();
                        email.clear();
                        tiempo.clear();
                        fecha.clear();
                      }
                    },
                    child: Text('Nuevo Turno'),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      update();
                      name.clear();
                      email.clear();
                      tiempo.clear();
                      fecha.clear();
                    },
                    child: Text('Actualizar Turno'),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      name.clear();
                      email.clear();
                      tiempo.clear();
                      fecha.clear();
                    },
                    child: Text('Borrar Turno'),
                  ),
                ],
              ),
              Container(
                height: 300,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: firebase.collection("usuarios").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, i) {
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[i];
                                return ListTile(
                                  title: Text(x['name']),
                                  subtitle: Text(x['email']),
                                );
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
