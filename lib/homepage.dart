import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? ScannerResult;

  Future scanBarcode() async{
  try{
    ScannerResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE
    );
  } on PlatformException{
    ScannerResult = "Feild to get Platform Version";
  }
   if (!mounted) return;
   setState(()=>this.ScannerResult = ScannerResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>scanBarcode(),
        child: Icon(Icons.camera_alt_outlined),
      ),

      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Center(child: Text(ScannerResult == null?'Sacn Code': 'Scan Code : $ScannerResult',

                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black,),)),
          ],
        ),
      ),
    );
  }
}
