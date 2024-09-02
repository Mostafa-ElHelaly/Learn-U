class CountriesModel {
  String id;
  String iso3;
  String name;
  String name_native;
  String continents;
  String phonecodes;
  String currencies;
  String languages;
  String addstamp;
  String updatestamp;

  CountriesModel({
    required this.id,
    required this.iso3,
    required this.name,
    required this.name_native,
    required this.continents,
    required this.phonecodes,
    required this.currencies,
    required this.languages,
    required this.addstamp,
    required this.updatestamp,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        id: json['id'],
        iso3: json['iso3'] ?? "",
        name: json['name'] ?? "",
        name_native: json['name_native'] ?? "",
        continents: json['continents'] ?? "",
        phonecodes: json['phonecodes'] ?? "",
        currencies: json['currencies'] ?? "",
        languages: json['languages'] ?? "",
        addstamp: json['addstamp'] ?? "",
        updatestamp: json['updatestamp'] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso3": iso3,
        "name": name,
        "name_native": name_native,
        "continents": continents,
        "currencies": currencies,
        "languages": languages,
        "addstamp": addstamp,
        "updatestamp": updatestamp,
      };
}
