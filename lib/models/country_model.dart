import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    CountryModel({
        this.typename,
        this.country,
    });

    String ?typename;
    Country ?country;

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        typename: json["__typename"],
        country: Country.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "country": country!.toJson(),
    };
}

class Country {
    Country({
        this.typename,
        this.name,
        this.native,
        this.capital,
        this.emoji,
        this.currency,
        this.languages,
    });

    String ?typename;
    String ?name;
    String ?native;
    String ?capital;
    String? emoji;
    String ?currency;
    List<Language> ?languages;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        typename: json["__typename"],
        name: json["name"],
        native: json["native"],
        capital: json["capital"],
        emoji: json["emoji"],
        currency: json["currency"],
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "name": name,
        "native": native,
        "capital": capital,
        "emoji": emoji,
        "currency": currency,
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
    };
}

class Language {
    Language({
        this.typename,
        this.code,
        this.name,
    });

    String ?typename;
    String? code;
    String ?name;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        typename: json["__typename"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "code": code,
        "name": name,
    };
}
