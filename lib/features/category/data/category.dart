import 'package:equatable/equatable.dart';

class Category extends Equatable {
  late String slug;
  late String name;

  Category({required this.slug, required this.name});

  Category.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slug'] = this.slug;
    data['name'] = this.name;

    return data;
  }

  @override
  List<Object?> get props => [slug, name];
}
