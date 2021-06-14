import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_week10/models/product.dart';
import 'package:mobile_week10/models/stok.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Product product){
    return _db.collection('products').doc(product.productId).set(product.toMap());
  }

  Stream<List<Product>> getProducts(){
    return _db.collection('products').snapshots().map((snapshot) => snapshot.docs.map((document) => Product.fromFirestore(document.data())).toList());
  }

  Future<void> removeProduct(String productId){
    return _db.collection('products').doc(productId).delete();
  }

  Future<void> saveStok(Stok stok){
    return _db.collection('stoks').doc(stok.stokId).set(stok.toMap());
  }

  Stream<List<Stok>> getStoks(){
    return _db.collection('stoks').snapshots().map((snapshot) => snapshot.docs.map((document) => Stok.fromFirestore(document.data())).toList());
  }

  Future<void> removeStok(String stokId){
    return _db.collection('stoks').doc(stokId).delete();
  }


}