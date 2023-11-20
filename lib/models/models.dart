class Coffee {
  String name;
  String description;
  String price;
  String? rating;
  String? aggregate_score;
  String? size;
  String? additive;
  String? roast_level;
  String? image;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    this.image,
    this.additive,
  });
}

// class Milk {
//   String type;
//   String description;
//   String price;
//
//   Milk({
//     required this.type,
//     required this.description,
//     required this.price,
//   });
// }
//
// class Order {
//   String drink; // coffee, tea or other
//   String additive; // type of milk
//   String price;
//   String? rating;
//   String? aggregate_score;
//
//   Order({
//     required this.drink,
//     required this.additive,
//     required this.price,
//   });
// }

