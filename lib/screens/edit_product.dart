import 'package:mobile_week10/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_week10/providers/product_provider.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  EditProduct([this.product]);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final kategoriBukuController = TextEditingController();
  final tahunBukuController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    tahunBukuController.dispose();
    kategoriBukuController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.product == null) {
      //New Record
      nameController.text = "";
      priceController.text = "";
      tahunBukuController.text = "";
      kategoriBukuController.text = "";

      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.loadValues(Product());
      });
    } else {
      //Controller Update
      nameController.text=widget.product.name;
      priceController.text=widget.product.price.toString();
      kategoriBukuController.text=widget.product.kategoriBuku;
      tahunBukuController.text=widget.product.tahunBuku;
      //State Update
      new Future.delayed(Duration.zero, () {
        final productProvider = Provider.of<ProductProvider>(context,listen: false);
        productProvider.loadValues(widget.product);
      });
      
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Nama Buku'),
              onChanged: (value) {
                productProvider.changeName(value);
              },
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(hintText: 'Harga Buku'),
              onChanged: (value) => productProvider.changePrice(value),
            ),
            TextFormField(
              controller: kategoriBukuController,
              decoration: InputDecoration(hintText: 'Kategori Buku'),
              onChanged: (value) {
                productProvider.changekategoriBuku(value);
              },
            ),
            TextFormField(
              controller: tahunBukuController,
              decoration: InputDecoration(hintText: 'Tahun Buku'),
              onChanged: (value) {
                productProvider.changetahunBuku(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                productProvider.saveProduct();
                Navigator.of(context).pop();
              },
            ),
            (widget.product !=null) ? RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Delete'),
              onPressed: () {
                productProvider.removeProduct(widget.product.productId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }
}
