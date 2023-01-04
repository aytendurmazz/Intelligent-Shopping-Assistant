class Product {
  final int id;
  final String title, description;
  final String images;
  final int price;
  final bool isFavourite;
  final int number;
  final String pazarName;
  final String standName;
  final double productRate;
  final int voteCounter;

  Product(
      {this.id,
      this.images,
      this.isFavourite = false,
      this.title,
      this.price,
      this.description,
      this.number,
      this.standName,
      this.pazarName,
      this.productRate,
      this.voteCounter});
}
