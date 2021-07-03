class CardItem {
  String productImg;
  String productName;
  String wishlist;
  double price;
  String categories;
  String description;
  CardItem(
      {this.productImg,
      this.productName,
      this.wishlist,
      this.price,
      this.categories,
      this.description});
}

//const groceryproduct = <Groceryproduct>[
List<CardItem> cards = [
  CardItem(
      productImg: "assets/avocado.png",
      productName: "avocado",
      wishlist: "yes",
      price: 8.30,
      categories: "topcategories",
      description:
          "The avocado, a tree likely originating from south-central Mexico, is classified as a member of the flowering plant family Lauraceae."),
  CardItem(
      productImg: "assets/orange.png",
      productName: "orange",
      wishlist: "yes",
      price: 18.30,
      categories: "topcategories",
      description:
          "A laptop computer is a small personal computer. They are designed to be more portable than traditional desktop computers, with many of the same abilities."),
  CardItem(
      productImg: "assets/grapes.png",
      productName: "grapes",
      wishlist: "yes",
      price: 30.10,
      categories: "topcategories",
      description:
          "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis"),
  CardItem(
      productImg: "assets/pineapple.png",
      productName: "pineapple",
      wishlist: "yes",
      price: 40.00,
      categories: "topcategories",
      description:
          "This will offer immense value proposition in crops such as potato, pineapple, oranges and apples."),
  CardItem(
      productImg: "assets/banana.png",
      productName: "banana",
      wishlist: "yes",
      price: 68.10,
      categories: "topcategories",
      description:
          "The avocado, a tree likely originating from south-central Mexico, is classified as a member of the flowering plant family Lauraceae."),
  CardItem(
      productImg: "assets/apple.png",
      productName: "apple",
      wishlist: "yes",
      price: 81.30,
      categories: "topcategories",
      description:
          "The apple, a tree likely originating from south-central Mexico, is classified as a member of the flowering plant family Lauraceae."),
  CardItem(
    price: 8.30,
    productName: "cherry",
    wishlist: "yes",
    description:
        "The cherry, a tree likely originating from south-central Mexico, is classified as a member of the flowering plant family Lauraceae.",
    productImg: 'assets/cherry.png',
  ),
];
