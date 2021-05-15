class DescriptionResponse {

  String icon;
  String description;
  String infotipo;

  DescriptionResponse({this.description, this.icon, this.infotipo});

  factory DescriptionResponse.fromJson(dynamic json) {
    return DescriptionResponse(
        icon: json['icono'],
        description: json['descripcion'],
        infotipo: json['infotipo'].toString().replaceAll(RegExp(r'^<p>|</p>'), ''),
    );
  }

  static List<DescriptionResponse> listFromJson(dynamic json) {

    var requirementsList = json as List;
    List<DescriptionResponse> items = requirementsList.map((item) => DescriptionResponse.fromJson(item)).toList();

    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "icon": icon,
      "description": description,
      "infotipo": infotipo,
    };
  }

}
