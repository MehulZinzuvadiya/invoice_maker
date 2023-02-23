import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_maker/buisnessModel/buisnessModel.dart';
import 'package:invoice_maker/main.dart';
import 'package:invoice_maker/productModel/productModel.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  TextEditingController txt_cname = TextEditingController();
  TextEditingController txt_cemail = TextEditingController();
  TextEditingController txt_cadd = TextEditingController();

  TextEditingController txt_pname = TextEditingController();
  TextEditingController txt_price = TextEditingController();
  TextEditingController txt_qty = TextEditingController();

  List<productModel> productlist = [];

  @override
  Widget build(BuildContext context) {
    // buisnessModel bm1 =
    //     ModalRoute.of(context)!.settings.arguments as buisnessModel;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Customer Details",
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
              const Text("Customer Details*"),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Enter your information'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  controller: txt_cname,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your name',
                                  ),
                                ),
                                TextField(
                                  controller: txt_cemail,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your email',
                                  ),
                                ),
                                TextField(
                                  controller: txt_cadd,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your Address',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Add Customer Details")),
              ),
              Text("Invoice Date*"),
              Container(
                height: 50,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: Text("${DateTime.now()}"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Enter Product Detail'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  controller: txt_pname,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter product name',
                                  ),
                                ),
                                TextField(
                                  controller: txt_price,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Price',
                                  ),
                                ),
                                TextField(
                                  controller: txt_qty,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter QTY',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('ADD'),
                                onPressed: () {
                                  setState(() {
                                    productModel p1 = productModel(
                                      name: txt_pname.text,
                                      price: txt_price.text,
                                      qty: txt_qty.text,
                                    );
                                    productlist.add(p1);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text("Add Product Details")),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: productlist.length,
                  itemBuilder: (context, index) {
                    return MyProduct(index, productlist[index].name!,
                        productlist[index].price!, productlist[index].qty!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  Widget MyProduct(int n, String? pname, String? price, String? qnt) {
    return ListTile(
      leading: Text(
        "$n",
        style: TextStyle(fontSize: 18),
      ),
      title: Text("$pname"),
      subtitle: Text("$price"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$qnt"),
          IconButton(
            onPressed: () {
              txt_pname=TextEditingController(text:"$pname");
              txt_price=TextEditingController(text: "$price");
              txt_qty=TextEditingController(text: "$qnt");
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Enter Product Detail'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: txt_pname,
                          decoration: const InputDecoration(
                            hintText: 'Enter product name',
                          ),
                        ),
                        TextField(
                          controller: txt_price,
                          decoration: const InputDecoration(
                            hintText: 'Enter Price',
                          ),
                        ),
                        TextField(
                          controller: txt_qty,
                          decoration: const InputDecoration(
                            hintText: 'Enter QTY',
                          ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('UPDATE'),
                        onPressed: () {
                          setState(() {
                            productModel p1 = productModel(
                              name: txt_pname.text,
                              price: txt_price.text,
                              qty: txt_qty.text,
                            );
                            productlist[n]=p1;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit,
              color: Colors.green.shade300,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                productlist.removeAt(n);
              });
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
