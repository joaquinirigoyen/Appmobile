import 'package:flutter/material.dart';
import '../paginas.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET20"),
        ),
      ),
      drawer: MenuLateral(),
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          _heading("Detalles personales:"),
          SizedBox(
            height: 6,
          ),
          _detailsCard(),
          SizedBox(
            height: 10,
          ),
          Spacer(),
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  icon: Icon(Icons.near_me),
                  hintText: 'Ejemplo juan',
                  labelText: 'Nombre'),
              onChanged: (value) {},
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.add_ic_call),
                  hintText: '2995343434',
                  labelText: 'Numero'),
              onChanged: (value) {},
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.attribution_rounded),
                  hintText: '44444444',
                  labelText: 'DNI'),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
