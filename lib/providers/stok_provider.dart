import 'package:mobile_week10/models/stok.dart';
import 'package:mobile_week10/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StokProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _namaStok;
  String _kategoriStok;
  String _tahunStok;
  String _stokBuku;
  String _stokId;
  var uuid = Uuid();

  //Getters
  String get namaStok => _namaStok;
  String get kategoriStok => _kategoriStok;
  String get tahunStok => _tahunStok;
  String get stokBuku => _stokBuku;

  //Setters
  changenamaStok(String value) {
    _namaStok = value;
    notifyListeners();
  }

  changekategoriStok(String value) {
    _kategoriStok = value;
    notifyListeners();
  }

  changetahunStok(String value) {
    _tahunStok = value;
    notifyListeners();
  }

  changestokBuku(String value) {
    _stokBuku = value;
    notifyListeners();
  }

  loadValues(Stok stok){
    _namaStok=stok.namaStok;
    _kategoriStok=stok.kategoriStok;
    _tahunStok=stok.tahunStok;
    _stokBuku=stok.stokBuku;
    _stokId=stok.stokId;
  }

  saveStok() {
    print(_stokId);
    if (_stokId == null) {
      var newStok = Stok(namaStok: namaStok, kategoriStok: kategoriStok, tahunStok: tahunStok, stokBuku: stokBuku, stokId: uuid.v4());
      firestoreService.saveStok(newStok);
    } else {
      //Update
      var updatedStok =
          Stok(namaStok: namaStok, kategoriStok: kategoriStok, tahunStok: tahunStok, stokBuku: stokBuku, stokId: _stokId);
      firestoreService.saveStok(updatedStok);
    }
  }

  removeStok(String stokId){
    firestoreService.removeStok(stokId);
  }

}
