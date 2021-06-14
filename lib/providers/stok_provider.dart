import 'package:mobile_week10/models/stok.dart';
import 'package:mobile_week10/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StokProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _name;
  double _stokbuku;
  String _stokId;
  var uuid = Uuid();

  //Getters
  String get name => _name;
  double get stokbuku => _stokbuku;

  //Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _stokbuku = double.parse(value);
    notifyListeners();
  }

  loadValues(Stok stok){
    _name=stok.name;
    _stokbuku=stok.stokbuku;
    _stokId=stok.stokId;
  }


  saveStok() {
    print(_stokId);
    if (_stokId == null) {
      var newStok = Stok(name: name, stokbuku: stokbuku, stokId: uuid.v4());
      firestoreService.saveStok(newStok);
    } else {
      //Update
      var updatedStok =
          Stok(name: name, stokbuku: _stokbuku, stokId: _stokId);
      firestoreService.saveStok(updatedStok);
    }
  }

  removeStok(String stokId){
    firestoreService.removeStok(stokId);
  }

}
