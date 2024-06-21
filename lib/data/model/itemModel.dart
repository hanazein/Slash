import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  List<BestSelling> bestSelling;
  List<BestSelling> newArrival;
  List<BestSelling> recommendedForYou;

  DataModel({
    required this.bestSelling,
    required this.newArrival,
    required this.recommendedForYou,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    bestSelling: List<BestSelling>.from(json["bestSelling"].map((x) => BestSelling.fromJson(x))),
    newArrival: List<BestSelling>.from(json["newArrival"].map((x) => BestSelling.fromJson(x))),
    recommendedForYou: List<BestSelling>.from(json["recommendedForYou"].map((x) => BestSelling.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bestSelling": List<dynamic>.from(bestSelling.map((x) => x.toJson())),
    "newArrival": List<dynamic>.from(newArrival.map((x) => x.toJson())),
    "recommendedForYou": List<dynamic>.from(recommendedForYou.map((x) => x.toJson())),
  };
}

class BestSelling {
  int id;
  String name;
  double price;
  String image;

  BestSelling({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory BestSelling.fromJson(Map<String, dynamic> json) => BestSelling(
    id: json["id"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "image": image,
  };
}