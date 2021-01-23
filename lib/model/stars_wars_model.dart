
// class StarWarsList {
//   List<StarWars> starWars;
//   StarWarsList({this.starWars});
//   factory StarWarsList.fromJson(List json) {
//     List<StarWars> newList = json.map((i) => StarWars.fromJson(i)).toList();
//     return StarWarsList(starWars: newList);
//   }
// }

// class StarWars {
//   // int count;
//   // String next;
//   // String previous;
//   List<dynamic> results;
//
//   StarWars({this.results});
//
//   StarWars.fromJson(Map<String, dynamic> json) {
//     // count = json['count'];
//     // next = json['next'];
//     // previous = json['previous'];
//     if (json['results'] != null) {
//       results = new List<Results>();
//       json['results'].forEach((v) {
//         results.add(new Results.fromJson(v));
//       });
//     }
//   }
// }

class StarWars {
 final String name;
 final String height;
 final String mass;
 final String hairColor;
 final String skinColor;
 final String eyeColor;
 final String birthYear;
 final String gender;
final  String homeworld;
 final List<String> films;
 final List<String> species;
 final List<String> vehicles;
 final List<String> starships;
final  String created;
final  String edited;
 final String url;

  StarWars(
      {this.name,
        this.height,
        this.mass,
        this.hairColor,
        this.skinColor,
        this.eyeColor,
        this.birthYear,
        this.gender,
        this.homeworld,
        this.films,
        this.species,
        this.vehicles,
        this.starships,
        this.created,
        this.edited,
        this.url});

  StarWars.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    height = json['height'],
    mass = json['mass'],
    hairColor = json['hair_color'],
    skinColor = json['skin_color'],
    eyeColor = json['eye_color'],
    birthYear = json['birth_year'],
    gender = json['gender'],
    homeworld = json['homeworld'],
    films = json['films'].cast<String>(),
    species = json['species'].cast<String>(),
    vehicles = json['vehicles'].cast<String>(),
    starships = json['starships'].cast<String>(),
    created = json['created'],
    edited = json['edited'],
    url = json['url'];

}
