class CountryList 
{
    final List <Countries> country;

    CountryList({this.country});

      factory CountryList.fromJson(Map<String, dynamic> json) {
      return CountryList(
      country: parseStates(json),
      
    );
  }
    static List<Countries> parseStates(statesJson) {
    var slist = statesJson['countries'] as List;
    List<Countries> countryList =
       slist.map((data) => Countries.fromJson(data)).toList();
    return countryList;
  }
}

class Countries {
  final String name;
  final String iso2;
  final String iso3;

  Countries({this.name, this.iso2, this.iso3});

  factory Countries.fromJson(Map<String, dynamic> parsedJson){
    return Countries( name: parsedJson['name'],iso2: parsedJson['iso2']);
  }

}