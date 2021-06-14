import 'package:mobile_week10/screens/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProduct()));
              },
            )
          ],
        ),
        body: (products != null)
            ? ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.bookmark),
                    ),
                    title: Text(products[index].name),
                     subtitle: Text("Harga Buku : Rp." + products[index].price.toString()),
                     trailing: GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProduct(products[index])));
                      },
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
