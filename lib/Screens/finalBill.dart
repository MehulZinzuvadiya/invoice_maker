import 'package:flutter/material.dart';

class finalbill extends StatefulWidget {
  const finalbill({Key? key}) : super(key: key);

  @override
  State<finalbill> createState() => _finalbillState();
}

class _finalbillState extends State<finalbill> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item Name",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item Name",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item Name",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade700,
            ),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notes",style: TextStyle(
                    color: Colors.grey,
                  ),),
                  SizedBox(height: 10,),
                  Text("It Was Great Doing Buisness With You.",style: TextStyle(
                    color: Colors.black,
                  ),),
                ],

              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terms & Condition",style: TextStyle(
                    color: Colors.grey,
                  ),),
                  SizedBox(height: 10,),
                  Text("Please make the payment by the due date.",style: TextStyle(
                    color: Colors.black,
                  ),),
                ],

              ),
            ),

          ],
        ),
      ),
    ));
  }
}
