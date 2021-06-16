class Product{
  final String productId;
  final String name;
  final double price;
  final String kategoriBuku;
  final String tahunBuku;

  Product({this.productId,this.price, this.name, this.kategoriBuku, this.tahunBuku});

  Map<String,dynamic> toMap(){
    return {
      'productId' : productId,
      'name' : name,
      'price' : price,
      'kategoriBuku' : kategoriBuku,
      'tahunBuku' : tahunBuku
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        kategoriBuku = firestore['kategoriBuku'],
        tahunBuku = firestore['tahunBuku'];
}