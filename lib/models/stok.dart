class Stok{
  final String stokId;
  final String namaStok;
  final String kategoriStok;
  final String tahunStok;
  final String stokBuku;

  Stok({this.stokId,this.stokBuku, this.namaStok, this.kategoriStok, this.tahunStok});

  Map<String,dynamic> toMap(){
    return {
      'stokId' : stokId,
      'nama' : namaStok,
      'stokBuku' : stokBuku,
      'tahunStok' : tahunStok,
      'kategoriStok' : kategoriStok
    };
  }

  Stok.fromFirestore(Map<String, dynamic> firestore)
      : stokId = firestore['stokId'],
        namaStok = firestore['nama'],
        tahunStok = firestore['tahunStok'],
        kategoriStok = firestore['kategoriStok'],
        stokBuku = firestore['stokBuku'];
}