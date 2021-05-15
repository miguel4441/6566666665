class DescriptionGeneralResponse {

  String description;

  DescriptionGeneralResponse({this.description});

  factory DescriptionGeneralResponse.fromJson(dynamic json) {
    return DescriptionGeneralResponse(
        description: json['DESCRIPCION']
    );
  }

}
