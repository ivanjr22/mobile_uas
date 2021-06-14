class Stok{
  final String stokId;
  final String name;
  final double stokbuku;

  Stok({this.stokId,this.stokbuku, this.name});

  Map<String,dynamic> toMap(){
    return {
      'stokId' : stokId,
      'name' : name,
      'stok' : stokbuku
    };
  }

  Stok.fromFirestore(Map<String, dynamic> firestore)
      : stokId = firestore['stokId'],
        name = firestore['name'],
        stokbuku = firestore['stokbuku'];
}