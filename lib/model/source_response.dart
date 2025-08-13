// class SourceResponse {
//   String status;
//   List<Source> sourcse;
// }
//
// class Source {
//   String id;
//   String name;
//   String description;
//   String url;
//   String category;
//   String language;
//   String country;
//
//   Source(
//       {required this.id, required this.name, required this.description, required this.category, required this.url, required this.country, required this.language,});
//
//   Source.fromJson(Map<String, dynamic> json) :this(
//     id: json['id'],
//     name: json['name'],
//     description: json['description'],
//     url: json['url'],
//     category: json['category'],
//     language: json['language'],
//     country: json['country'],
//   );
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'url': url,
//       'category': category,
//       'language': language,
//       'country': country,
//     };
//   }
//
// }