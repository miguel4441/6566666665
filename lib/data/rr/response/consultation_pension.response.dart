class ConsultationPensionResponse {
  String DNI;
  String NOMBRES;
  String APELLIDOS_NOMBRES;
  String SEXO;
  String MONTO;
  String PERIODO;
  String TERCERO;
  String MODALIDAD_PAGO;
  String LUGAR_AGENCIA;
  String FECHA_PAGO;
  String FECHAPAGOLABEL;
  String LATITUD;
  String LONGITUD;
  String CONDICION;
  String MENSAJE;

  ConsultationPensionResponse(
      {this.DNI,
        this.NOMBRES,
        this.APELLIDOS_NOMBRES,
        this.SEXO,
        this.MONTO,
        this.PERIODO,
        this.TERCERO,
        this.MODALIDAD_PAGO,
        this.LUGAR_AGENCIA,
        this.FECHA_PAGO,
        this.FECHAPAGOLABEL,
        this.LATITUD,
        this.LONGITUD,
        this.CONDICION,
        this.MENSAJE});

  ConsultationPensionResponse.fromJson(dynamic json) {
    DNI = json['DNI'];
    NOMBRES = json['NOMBRES'];
    APELLIDOS_NOMBRES = json['APELLIDOS_NOMBRES'];
    SEXO = json['SEXO'];
    MONTO = json['MONTO'];
    PERIODO = json['PERIODO'];
    TERCERO = json['TERCERO'];
    MODALIDAD_PAGO = json['MODALIDAD_PAGO'];
    LUGAR_AGENCIA = json['LUGAR_AGENCIA'];
    FECHA_PAGO = json['FECHA_PAGO'];
    FECHAPAGOLABEL = json['FECHAPAGOLABEL'];
    LATITUD = json['LATITUD'];
    LONGITUD = json['LONGITUD'];
    CONDICION = json['CONDICION'];
    MENSAJE = json['MENSAJE'];
  }

  static List<ConsultationPensionResponse> listFromJson(dynamic json) {

    var list = json as List;
    List<ConsultationPensionResponse> items = list.map((item) => ConsultationPensionResponse.fromJson(item)).toList();

    return items ?? [];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DNI'] = this.DNI;
    data['APELLIDOS_NOMBRES'] = this.APELLIDOS_NOMBRES;
    data['MONTO'] = this.MONTO;
    data['PERIODO'] = this.PERIODO;
    data['MODALIDAD_PAGO'] = this.MODALIDAD_PAGO;
    data['LUGAR_AGENCIA'] = this.LUGAR_AGENCIA;
    data['LATITUD'] = this.LATITUD;
    data['LONGITUD'] = this.LONGITUD;
    data['CONDICION'] = this.CONDICION;
    return data;
  }*/
}