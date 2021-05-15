class ConsultationGeneralResponse {
  String DNI;
  String NOMBRES;
  String APELLIDOS_NOMBRES;
  String CONDICION;
  String UBIGEO;
  String DEPARTAMENTO;
  String PROVINCIA;
  String DISTRITO;
  String CSE;
  String FECHA_VENCIMIENTO_VIGENCIA;
  String DESCRIPTION;

  ConsultationGeneralResponse(
      {this.DNI,
        this.NOMBRES,
        this.APELLIDOS_NOMBRES,
        this.CONDICION,
        this.UBIGEO,
        this.DEPARTAMENTO,
        this.PROVINCIA,
        this.DISTRITO,
        this.CSE,
        this.FECHA_VENCIMIENTO_VIGENCIA,
        this.DESCRIPTION});

  ConsultationGeneralResponse.fromJson(dynamic json) {
    DNI = json['DNI'];
    NOMBRES = json['NOMBRES'];
    APELLIDOS_NOMBRES = json['APELLIDOS_NOMBRES'];
    CONDICION = json['CONDICION'];
    UBIGEO = json['UBIGEO'];
    DEPARTAMENTO = json['DEPARTAMENTO'];
    PROVINCIA = json['PROVINCIA'];
    DISTRITO = json['DISTRITO'];
    CSE = json['CSE'];
    FECHA_VENCIMIENTO_VIGENCIA = json['FECHA_VENCIMIENTO_VIGENCIA'];
    DESCRIPTION = json['DESCRIPTION'];
  }

  static List<ConsultationGeneralResponse> listFromJson(dynamic json) {

    var list = json as List;
    List<ConsultationGeneralResponse> items = list.map((item) => ConsultationGeneralResponse.fromJson(item)).toList();

    return items ?? [];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DNI'] = this.DNI;
    data['APELLIDOS_NOMBRES'] = this.APELLIDOS_NOMBRES;
    data['CONDICION'] = this.CONDICION;
    data['UBIGEO'] = this.UBIGEO;
    data['DEPARTAMENTO'] = this.DEPARTAMENTO;
    data['PROVINCIA'] = this.PROVINCIA;
    data['DISTRITO'] = this.DISTRITO;
    data['CSE'] = this.CSE;
    data['FECHA_VENCIMIENTO_VIGENCIA'] = this.FECHA_VENCIMIENTO_VIGENCIA;
    return data;
  }*/
}
