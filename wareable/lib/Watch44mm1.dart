import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Watch44mm1 extends StatelessWidget {
  Watch44mm1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 37.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff165eee),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 23.0),
            Pin(size: 24.0, start: 7.0),
            child: Text(
              'gimnasio epet 20',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 18,
                color: const Color(0xfff1f3f8),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 6.0, end: 5.0),
            Pin(size: 42.0, middle: 0.5),
            child: Text(
              'Su turno fue reservado\n           con éxito ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xff000104),
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                    color: const Color(0xb50f45f6),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  )
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
