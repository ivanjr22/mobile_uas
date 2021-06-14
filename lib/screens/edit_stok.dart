import 'package:mobile_week10/models/stok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/stok_provider.dart';

class EditStok extends StatefulWidget {
  final Stok stok;

  EditStok([this.stok]);

  @override
  _EditStokState createState() => _EditStokState();
}

class _EditStokState extends State<EditStok> {
  final nameController = TextEditingController();
  final stokbukuController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    stokbukuController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.stok == null) {
      //New Record
      nameController.text = "";
      stokbukuController.text = "";
      new Future.delayed(Duration.zero, () {
        final stokProvider = Provider.of<StokProvider>(context,listen: false);
        stokProvider.loadValues(Stok());
      });
    } else {
      //Controller Update
      nameController.text=widget.stok.name;
      stokbukuController.text=widget.stok.stokbuku.toString();
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
              controller: nameController,
              decoration: InputDecoration(hintText: 'Product Name'),
              onChanged: (value) {
                stokProvider.changeName(value);
              },
            ),
            TextFormField(
              controller: stokbukuController,
              decoration: InputDecoration(hintText: 'Product Stok'),
              onChanged: (value) => stokProvider.changePrice(value),
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
