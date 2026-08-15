class MenuModel {
  String title;
  String subtitle;
  double price;
  String imageUrl;
  bool isSelected;

  MenuModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.isSelected = false,
  });
}

List<MenuModel> menuModelList = [
  MenuModel(
    title: "Menú 1",
    subtitle: "Lun - Mar - Mier",
    price: 5.0,
    imageUrl: "https://i.blogs.es/b0a5c0/lomo_saltado/1366_2000.jpg",
  ),
  MenuModel(
    title: "Menú 2",
    subtitle: "Mar - Mier",
    price: 7.0,
    imageUrl:
        "https://images.pexels.com/photos/28448388/pexels-photo-28448388.jpeg",
  ),
  MenuModel(
    title: "Menú 3",
    subtitle: "Lun - Mar ",
    price: 8.0,
    imageUrl:
        "https://images.pexels.com/photos/8194817/pexels-photo-8194817.jpeg",
  ),
  MenuModel(
    title: "Menú 4",
    subtitle: "Mier",
    price: 5.0,
    imageUrl:
        "https://images.pexels.com/photos/38330330/pexels-photo-38330330.jpeg",
  ),
  MenuModel(
    title: "Menú 5",
    subtitle: "Sab- Dom",
    price: 10.0,
    imageUrl:
        "https://images.pexels.com/photos/37260671/pexels-photo-37260671.jpeg",
  ),
];
