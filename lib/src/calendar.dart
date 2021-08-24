import 'dataPicker.dart';
import 'dateTime.dart';
import 'timePicker.dart';
import 'package:flutter/material.dart';
import 'paginas.dart';

// ignore: camel_case_types
class calendar extends StatelessWidget {
  static final String title = 'Date (Range) & Time';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
        ),
        drawer: MenuLateral(),
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DatePickerWidget(),
                const SizedBox(height: 24),
                TimePickerWidget(),
                const SizedBox(height: 24),
                DatetimePickerWidget(),
              ],
            ),
          ),
        );
    }
  }
}
