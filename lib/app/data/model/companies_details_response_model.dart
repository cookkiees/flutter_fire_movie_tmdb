class CompaniesDetailsResponseModel {
  String? description;
  String? headquarters;
  String? homepage;
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;
  String? parentCompany;

  CompaniesDetailsResponseModel(
      {this.description,
      this.headquarters,
      this.homepage,
      this.id,
      this.logoPath,
      this.name,
      this.originCountry,
      this.parentCompany});

  CompaniesDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    headquarters = json['headquarters'];
    homepage = json['homepage'];
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
    parentCompany = json['parent_company'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['headquarters'] = headquarters;
    data['homepage'] = homepage;
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    data['parent_company'] = parentCompany;
    return data;
  }
}
