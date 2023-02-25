import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_maker/buisnessModel/buisnessModel.dart';

class BuisnessDetails extends StatefulWidget {
  const BuisnessDetails({Key? key}) : super(key: key);

  @override
  State<BuisnessDetails> createState() => _BuisnessDetailsState();
}

class _BuisnessDetailsState extends State<BuisnessDetails> {
  TextEditingController bname = TextEditingController();
  TextEditingController bemail = TextEditingController();
  TextEditingController bphone = TextEditingController();
  TextEditingController baddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Business Details",
          style: GoogleFonts.aboreto(
            color: Colors.indigo.shade400,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  controller: bname,
                  decoration: InputDecoration(
                    hintText: "Red & White Infotech",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade300,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Buisness Name',
                    //lable style
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  controller: bemail,
                  decoration: InputDecoration(
                    hintText: "mehul123@gmail.com",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade300,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                    //lable style
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  controller: bphone,
                  decoration: InputDecoration(
                    hintText: "+91 1234567890",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade300,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Phone',
                    //lable style
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  controller: baddress,
                  decoration: InputDecoration(
                    hintText: "Street",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade300,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Address',
                    //lable style
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: ElevatedButton(
                  onLongPress: null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.black,
                      elevation: 10,
                      textStyle:
                          TextStyle(fontSize: 16, color: Colors.black26)),
                  onPressed: () {
                    buisnessModel bm = buisnessModel(
                      bname: bname.text,
                      baddress: baddress.text,
                      bmail: bemail.text,
                      bphone: bphone.text,
                    );
                    Navigator.pushNamed(context, 'customer', arguments: bm);
                  },
                  child: Text(
                    "NEXT",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
