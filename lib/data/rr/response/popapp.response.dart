class PopAppReponse{

  String alerta, icon;

  PopAppReponse({this.alerta, this.icon});

  factory PopAppReponse.fromJson(dynamic json){
    return PopAppReponse(
      alerta: json['alerta'],
      icon: json['icon']
    );
  }

  static List<PopAppReponse> listFromJson(dynamic json){
    var popapplist = json as List;
    List<PopAppReponse> items = popapplist.map((e) => PopAppReponse.fromJson(e)).toList();
    return items ?? [];
  }




}