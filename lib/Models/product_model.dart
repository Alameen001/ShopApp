class ProductModel {
  String productName;
  String productPrice;
  String quantity;
  String image;
  
  static List<ProductModel> products= [];

  ProductModel({
    required this.image,
    required this.productName,
    required this.productPrice,
    required this.quantity,
  });
}
