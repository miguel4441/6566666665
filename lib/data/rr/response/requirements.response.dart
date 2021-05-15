class RequirementsResponse {

  String icon;
  String description;

  RequirementsResponse({this.description, this.icon});

  factory RequirementsResponse.fromJson(dynamic json) {
    return RequirementsResponse(
        icon: json['icono'],
        description: json['descripcion']
    );
  }

  static List<RequirementsResponse> listFromJson(dynamic json) {

    var requirementsList = json as List;
    List<RequirementsResponse> items = requirementsList.map((item) => RequirementsResponse.fromJson(item)).toList();
    items.removeAt(0);
    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "icon": icon,
      "description": description,
    };
  }

}
