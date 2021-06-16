import 'package:mobile_week10/models/stok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_week10/providers/stok_provider.dart';

class EditStok extends StatefulWidget {
  final Stok stok;

  EditStok([this.stok]);

  @override
  _EditStokState createState() => _EditStokState();
}

class _EditStokState extends State<EditStok> {
  final namaStokController = TextEditingController();
  final kategoriStokController = TextEditingController();
  final tahunStokController = TextEditingController();
  final stokBukuController = TextEditingController();

  @override
  void dispose() {
    namaStokController.dispose();
    kategoriStokController.dispose();
    tahunStokController.dispose();
    stokBukuController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.stok == null) {
      //New Record
      namaStokController.text = "";
      kategoriStokController.text = "";
      tahunStokController.text = "";
      stokBukuController.text = "";
      new Future.delayed(Duration.zero, () {
        final stokProvider = Provider.of<StokProvider>(context,listen: false);
        stokProvider.loadValues(Stok());
      });
    } else {
      //Controller Update
      namaStokController.text=widget.stok.namaStok;
      kategoriStokController.text=widget.stok.kategoriStok;
      tahunStokController.text=widget.stok.tahunStok;
      stokBukuController.text=widget.stok.stokBuku;
      //State Update
      new Future.delayed(Duration.zero, () {
        final stokProvider = Provider.of<StokProvider>(context,listen: false);
        stokProvider.loadValues(widget.stok);
      });
      
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stokProvider = Provider.of<StokProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: namaStokController,
              decoration: InputDecoration(hintText: 'Nama Buku'),
              onChanged: (value) {
                stokProvider.changenamaStok(value);
              },
            ),
            TextFormField(
              controller: kategoriStokController,
              decoration: InputDecoration(hintText: 'Kategori Buku'),
              onChanged: (value) {
                stokProvider.changekategoriStok(value);
              },
            ),
            TextFormField(
              controller: tahunStokController,
              decoration: InputDecoration(hintText: 'Tahun Buku'),
              onChanged: (value) {
                stokProvider.changetahunStok(value);
              },
            ),
            TextFormField(
              controller: stokBukuController,
              decoration: InputDecoration(hintText: 'Stok Buku'),
              onChanged: (value) {
                stokProvider.changestokBuku(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                stokProvider.saveStok();
                Navigator.of(context).pop();
              },
            ),
            (widget.stok !=null) ? RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Delete'),
              onPressed: () {
                stokProvider.removeStok(widget.stok.stokId);
                Navigator.of(context).pop();
              },
            ): Container(),
          ],
        ),
      ),
    );
  }
}
