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
      body:Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 1),
                      color: Colors.white10,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10),),),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buisness Details",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "From:",
                            style: GoogleFonts.abrilFatface(
                                color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            "${c1.bname}",
                            style: GoogleFonts.aBeeZee(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${c1.bphone}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                      SizedBox(
                        height: 10,),
                          Text(
                            "${c1.bmail}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,),
                          Text(
                            "${c1.baddress}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 1),
                      color: Colors.white10,
                      borderRadius:
                      BorderRadius.all(Radius.circular(10),),),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customer details",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Bill TO:",
                            style: GoogleFonts.abrilFatface(
                                color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${c1.cname}",
                            style: GoogleFonts.aBeeZee(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${c1.cemail}",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${c1.caddress} ",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: c1.item!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    "${c1.item![index].qty}",
                    style: TextStyle(fontSize: 18),
                  ),
                  title: Text("${c1.item![index].name}"),
                  trailing: Text("${c1.item![index].price}"),
                );
              },
            ),
          )
        ],
      ),
    ));
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
