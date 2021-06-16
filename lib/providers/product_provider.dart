import 'package:mobile_week10/models/product.dart';
import 'package:mobile_week10/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  double _price;
  String _productId;
  String _kategoriBuku;
  String _tahunBuku;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  double get price => _price;
  String get kategoriBuku => _kategoriBuku;
  String get tahunBuku => _tahunBuku;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  changekategoriBuku(String value) {
    _kategoriBuku = value;
    notifyListeners();
  }

  changetahunBuku(String value) {
    _tahunBuku = value;
    notifyListeners();
  }

  loadValues(Product product){
    _name=product.name;
    _price=product.price;
    _productId=product.productId;
    _kategoriBuku=product.kategoriBuku;
    _tahunBuku=product.tahunBuku;
  }

  saveProduct() {
    print(_productId);
    if (_productId == null) {
      var newProduct = Product(name: name, price: price, kategoriBuku: kategoriBuku, tahunBuku: tahunBuku, productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct =
          Product(name: name, price: _price, kategoriBuku: kategoriBuku, tahunBuku: tahunBuku, productId: _productId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId){
    firestoreService.removeProduct(productId);
  }

}
