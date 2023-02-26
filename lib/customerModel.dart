import 'package:invoice_maker/productModel/productModel.dart';

class customerModel {
  String? cname, cemail, caddress, bname, bmail, bphone, baddress;
  List<productModel>? item;

  customerModel(
  {this.cname,
      this.cemail,
      this.caddress,
      this.bname,
      this.bmail,
      this.bphone,
      this.baddress,
      this.item,
  });
}




