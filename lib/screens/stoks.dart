import 'package:mobile_week10/screens/edit_stok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_week10/models/stok.dart';
import 'package:mobile_week10/providers/stok_provider.dart';

class Stoks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stoks = Provider.of<List<Stok>>(context);

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
                    MaterialPageRoute(builder: (context) => EditStok()));
              },
            )
          ],
        ),
        body: (stoks != null)
            ? ListView.builder(
                itemCount: stoks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.book),
                    ),
                     title: Text(stoks[index].namaStok),
                     subtitle: Text("Stok Buku : " + stoks[index].stokBuku.toString()),
                     trailing: GestureDetector(
                      child: Icon(Icons.edit),
                      onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditStok(stoks[index])));
                      },
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
