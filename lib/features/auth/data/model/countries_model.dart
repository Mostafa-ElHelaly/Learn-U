class CountriesModel {
  String? id;
  String? iso3;
  String? name;
  String? nameNative;
  String? continents;
  String? phonecodes;
  String? currencies;
  String? languages;
  String? addstamp;
  String? updatestamp;

  CountriesModel({
    this.id,
    this.iso3,
    this.name,
    this.nameNative,
    this.continents,
    this.phonecodes,
    this.currencies,
    this.languages,
    this.addstamp,
    this.updatestamp,
  });

  // Parsing the JSON to create a CountriesModel instance
  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      id: json['id'] as String?,
      iso3: json['iso3'] as String?,
      name: json['name'] as String?,
      nameNative: json['name_native'] as String?,
      continents: json['continents'] as String?,
      phonecodes: json['phonecodes'] as String?,
      currencies: json['currencies'] as String?,
      languages: json['languages'] as String?,
      addstamp: json['addstamp'] as String?,
      updatestamp: json['updatestamp'] as String?,
    );
  }
}
