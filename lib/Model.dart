// To parse this JSON data, do
//
//     final rickMorty = rickMortyFromJson(jsonString);

import 'dart:convert';

RickMorty rickMortyFromJson(String str) => RickMorty.fromJson(json.decode(str));

String rickMortyToJson(RickMorty data) => json.encode(data.toJson());

class RickMorty {
  Data data;

  RickMorty({
    required this.data,
  });

  factory RickMorty.fromJson(Map<String, dynamic> json) => RickMorty(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Characters characters;

  Data({
    required this.characters,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: Characters.fromJson(json["characters"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters.toJson(),
      };
}

class Characters {
  List<Result> results;

  Characters({
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String name;
  String image;
  String species;

  Result({
    required this.name,
    required this.image,
    required this.species,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        image: json["image"],
        species: json["species"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "species": species,
      };
}
