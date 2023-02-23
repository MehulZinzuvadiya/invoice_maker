import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_maker/main.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pname = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your name',
                                  ),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your email',
                                  ),
                                ),
                                TextField(
                                  controller: passwordController,
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
                                  // Process the user input here
                                  String name = nameController.text;
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  print('Name: $name');
                                  print('Email: $email');
                                  print('Password: $password');

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
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter product name',
                                  ),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Price',
                                  ),
                                ),
                                TextField(
                                  controller: passwordController,
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
                                  // Process the user input here
                                  String name = pname.text;
                                  String price = priceController.text;
                                  String quantity = qtycontroller.text;
                                  print('pName: $name');
                                  print('price: $price');
                                  print('quantity: $quantity');
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
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: l1.length,
                  itemBuilder: (context, index) =>
                      Mywidget(
                          l1[index].id!, l1[index].name!, l1[index].std!, index)
              ),
          ],
        ),
      ),
    ),)
    );
  }

  Widget Mywidget(String? id, String? name, String? std, int index) {
    return ListTile(
      leading: Text(
        "$id",
        style: TextStyle(fontSize: 18),
      ),
      title: Text("$name"),
      subtitle: Text("$std"),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                UpdateDialog(name!, id!, std!, index);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.green.shade300,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  l1.removeAt(index);
                });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
