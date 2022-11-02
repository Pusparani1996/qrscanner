import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscanner/model/xml.model.dart';
import 'package:xml/xml.dart';

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  PrintLetterBarcodeData? scannedData;
  //String _data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Qr Code"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/scanning-qr.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var scanData = await FlutterBarcodeScanner.scanBarcode(
                        "#00ffff", "Cancel", true, ScanMode.QR);

                    // log(_data);
                    var a = XmlDocument.parse(scanData);

                    var e = a.getElement("PrintLetterBarcodeData");
                    log(e.toString());
                    if (e != null) {
                      var name = e.getAttribute("name");
                      var uid = e.getAttribute("uid");
                      var gender = e.getAttribute("gender");
                      var yob = e.getAttribute("yob");
                      var co = e.getAttribute("co");
                      var loc = e.getAttribute("loc");
                      var vtc = e.getAttribute("vtc");
                      var po = e.getAttribute("po");
                      var dist = e.getAttribute("dist");
                      var subdist = e.getAttribute("subdist");
                      var state = e.getAttribute("state");
                      var pc = e.getAttribute("pc");
                      var dob = e.getAttribute("dob");
                      var inputData = PrintLetterBarcodeData(
                        uid: uid,
                        name: name,
                        gender: gender,
                        yob: yob,
                        co: co,
                        loc: loc,
                        vtc: vtc,
                        dist: dist,
                        subdist: subdist,
                        state: state,
                        pc: pc,
                        po: po,
                        dob: dob,
                      );
                      // log(inputData.toJson().toString());
                      //log(scannedData!.toJson().toString());
                      setState(() {
                        scannedData = inputData;
                      });
                    }
                  },
                  child: const Text("Scan QR-Code")),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.uid : "",
                      ),
                      decoration: const InputDecoration(helperText: "uid"),
                    ),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.name : "",
                      ),
                      decoration: const InputDecoration(helperText: "Name"),
                    ),
                    TextFormField(
                        controller: TextEditingController(
                          text: scannedData != null ? scannedData!.gender : "",
                        ),
                        decoration: InputDecoration(
                            helperText: scannedData != null
                                ? scannedData!.gender
                                : "Gender")),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.dob : "",
                      ),
                      decoration: InputDecoration(
                          helperText:
                              scannedData != null ? scannedData!.dob : "Dob"),
                    ),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.loc : "",
                      ),
                      decoration: InputDecoration(
                          helperText: scannedData != null
                              ? scannedData!.loc
                              : "Address"),
                    ),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.vtc : "",
                      ),
                      decoration: InputDecoration(
                          helperText: scannedData != null
                              ? scannedData!.vtc
                              : "Address"),
                    ),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.dist : "",
                      ),
                      decoration: InputDecoration(
                          helperText: scannedData != null
                              ? scannedData!.dist
                              : "Address"),
                    ),
                    TextFormField(
                      controller: TextEditingController(
                        text: scannedData != null ? scannedData!.subdist : "",
                      ),
                      decoration: InputDecoration(
                          helperText: scannedData != null
                              ? scannedData!.subdist
                              : "Address"),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
