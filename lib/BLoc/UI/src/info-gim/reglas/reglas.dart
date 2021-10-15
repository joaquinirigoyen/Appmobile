import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:app_gym/BLoc/UI/src/paginas.dart';
import 'mobile.dart' if (dart.library.html) 'web.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class Reglas extends StatefulWidget {
  Reglas({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ReglasState createState() => _ReglasState();
}

class _ReglasState extends State<Reglas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET 20"),
        ),
      ),
      drawer: MenuLateral(),
      body: Center(
          child: ElevatedButton(
        child: Text('crear PDF'),
        onPressed: _createPDF,
      )),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('¡Bienvenido a las reglas del gimnasio EPET20!',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(
        PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
        Rect.fromLTWH(0, 100, 440, 550));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
