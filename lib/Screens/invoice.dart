import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:invoice_maker/buisnessModel/buisnessModel.dart';
import 'package:invoice_maker/customerModel.dart';
import 'package:invoice_maker/productModel/productModel.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {


    customerModel c1=ModalRoute.of(context)!.settings.arguments as customerModel;
    List<productModel> p1 = ModalRoute.of(context)!.settings.arguments as List<productModel>;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "INVOICE",
          style: GoogleFonts.aboreto(
            color: Colors.indigo.shade400,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:RepaintBoundary(
        key: globalKey,
        child: Column(
            children: [
              // Text("SHOP RECEIPT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              // Text("SUPERMARKET 123",style: TextStyle(fontSize: 13),),
              // Text("PLANET EARTH",style: TextStyle(fontSize: 13),),
              // Text("Tel :123-456-7890",style: TextStyle(fontSize: 13),),
              // SizedBox(height: 20,),
              // Text("RECEIPT :12345",style: TextStyle(fontSize: 13),),
              // Text("DATE :12/12/2023",style: TextStyle(fontSize: 13),),
              // Text("CASHIER :JOHN DOE",style: TextStyle(fontSize: 13),),
              // SizedBox(height: 15,),
              // Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return invoice(p1[index]);
                },
                  itemCount: p1.length,
                ),
              ),
              Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("TAXABLE",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("232323",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("VAT15%",style: TextStyle(fontSize: 15),),
                    Spacer(),
                    Text("65656",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("TOTAL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text("8877",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("CASH",style: TextStyle(fontSize: 15,),),
                    Spacer(),
                    Text("8877",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("CHANGE",style: TextStyle(fontSize: 15,),),
                    Spacer(),
                    Text("898",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("paid with CASH",style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
              SizedBox(height: 10,),
              Text("THANK YOU",style: TextStyle(fontSize: 13,letterSpacing: 5),),
              SizedBox(height: 5,),
              Text("HAVE A NICE DAY",style: TextStyle(fontSize: 13,letterSpacing: 1),),
            ]
        ),
      ),
    ));
  }

  Widget invoice(productModel p1){
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text("${p1.name}",style: TextStyle(fontSize: 15,),),
          Spacer(),
          Text("${p1.price}",style: TextStyle(fontSize: 15),),
          Spacer(),
          Text("${p1.qty}",style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }

  void captureImage() async {
    RenderRepaintBoundary? boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    final ui.Image? image = await boundary?.toImage();
    final ByteData? byteData =
        await image!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes,
        name: "My Post.png", quality: 50);
    print(result);
  }
}
