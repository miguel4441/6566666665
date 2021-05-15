import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/consultation_pension.response.dart';
import 'package:yachap/data/rr/response/description.response.dart';
import 'package:url_launcher/url_launcher.dart';

class NoUserInformationPensionPage extends StatefulWidget {
  ConsultationPensionResponse userInfo;
  DescriptionResponse descriptionInfo;

  NoUserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultationPensionResponse userInformation,
          DescriptionResponse descriptionResponse) =>
      MaterialPageRoute(
          builder: (context) => NoUserInformationPensionPage(
              userInformation, descriptionResponse));

  @override
  _NoUserInformationPensionPageState createState() =>
      _NoUserInformationPensionPageState();
}

class _NoUserInformationPensionPageState
    extends State<NoUserInformationPensionPage> {
  String label = '';
  bool modalidadShow = true;
  bool lugarpagoShow = true;
  bool iconShow = true;
  bool fechapagoShow = true;
  bool personaCobroShow = true;
  bool infraclabelmontoShow = true;
  bool activeLugarPagoAgencia = false;
  String msjLugarPagoAgencia = '';
  String labelperiodo = 'Periodo: ';

  @override
  void initState() {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.5);
    flutterTts.speak(widget.userInfo.MENSAJE);
    var condicion = widget.userInfo.CONDICION.toString();
    var personaCobro = widget.userInfo.TERCERO.toString();

    if (condicion == "INFRACTOR") {
      modalidadShow = false;
      lugarpagoShow = false;
      iconShow = false;
      fechapagoShow = false;
      infraclabelmontoShow = false;
    }

    if (personaCobro == null || personaCobro == "") {
      personaCobroShow = false;
    }

    if(widget.userInfo.MODALIDAD_PAGO == "Agencia Bancaria"){
      modalidadShow = false;
      lugarpagoShow = false;
      iconShow = false;
      labelperiodo = 'Periodos: ';
      if(condicion != "INFRACTOR"){
        activeLugarPagoAgencia = true;
        msjLugarPagoAgencia = 'Puede cobrarlo en cualquier agencia del Banco de la Nación';
      }
    }

    label = widget.userInfo.FECHAPAGOLABEL;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Resources.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: pensionBar(context),
          body: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding:
                  EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 222,
                      height: 58,
                      margin: EdgeInsets.only(bottom: 77),
                      child: Image.asset(Resources.pension65),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text("Hola, ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal)),
                        ),
                        Flexible(
                          child: Text(widget.userInfo.NOMBRES,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                              strutStyle: StrutStyle(height: 1.4)),
                        )
                      ],
                    ),
                    Container(
                        height: 150,
                        width: 150,
                        //color: Colors.grey,
                        child: Image.asset(Resources.pension,
                            width: 150, height: 150)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Visibility(child: Text(
                      widget.userInfo.MONTO.isNotEmpty
                          ? "Tienes un depósito en tu cuenta"
                          : "Lamentablemente usted",
                        style: TextStyle(fontSize: 16),
                      ), visible: infraclabelmontoShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                              widget.userInfo.MONTO.isNotEmpty
                                  ? Resources.check_green
                                  : Resources.close_red,
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    widget.userInfo.MONTO.isNotEmpty
                                        ? "Monto"
                                        : "NO figura en el",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                ),
                                Text(
                                  widget.userInfo.MONTO.isNotEmpty
                                      ? "S/. " +
                                          int.parse(widget.userInfo.MONTO)
                                              .toStringAsFixed(2)
                                      : "Padrón de usuarios",
                                  style: TextStyle(fontSize: 18),
                                )
                              ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    RichText(textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: labelperiodo,
                            style: TextStyle(
                                fontSize: 16,color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Text(widget.userInfo.PERIODO ?? "-",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(height: 1.2)),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Align(
                          alignment: Alignment.center,
                            child: RichText(textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "La persona autorizada para realizar el cobro es : ",
                                    style: TextStyle(
                                        fontSize: 16,color: Colors.black
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Align( alignment: Alignment.center,
                        child: Text(widget.userInfo.TERCERO ?? "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(height: 1.2)),),
                      visible: personaCobroShow,
                    ),
                Visibility(
                  child:Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),visible: modalidadShow,
                ),
                    Visibility(
                      child: Align(alignment: Alignment.center, child:
                      RichText(textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "Tu Modalidad de pago es:",
                              style: TextStyle(
                                  fontSize: 16,color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),

                      ),
                      visible: modalidadShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: modalidadShow,
                    ),
                    Visibility(
                      child:  Align(alignment: Alignment.center, child: Text(widget.userInfo.MODALIDAD_PAGO ?? "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(height: 1.2)),),
                      visible: modalidadShow,
                    ),
                Visibility(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                  visible: lugarpagoShow,
                ),
                    Visibility(
                      child: RichText(textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: "Tu lugar de pago es:",
                              style: TextStyle(
                                  fontSize: 16,color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                      visible: lugarpagoShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: lugarpagoShow,
                    ),
                    Visibility(
                      child: Text(widget.userInfo.LUGAR_AGENCIA ?? "-",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(height: 1.2)),
                      visible: lugarpagoShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Visibility(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: widget.userInfo.LATITUD != null &&
                                  widget.userInfo.LONGITUD != null &&
                                  widget.userInfo.LONGITUD.isNotEmpty &&
                                  widget.userInfo.LATITUD.isNotEmpty,
                              child: SizedBox(
                                width: 20,
                              )),
                          Visibility(
                              visible: widget.userInfo.LATITUD != null &&
                                  widget.userInfo.LONGITUD != null &&
                                  widget.userInfo.LONGITUD.isNotEmpty &&
                                  widget.userInfo.LATITUD.isNotEmpty,
                              child: Container(
                                  //padding: EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                child: Image.asset(Resources.location,
                                    width: 40, height: 40, fit: BoxFit.contain),
                                onTap: () {
                                  _launchURL(widget.userInfo.LATITUD,
                                      widget.userInfo.LONGITUD);
                                },
                              ))),
                        ],
                      ),
                      visible: iconShow,
                    ),
                    /*Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: activeLugarPagoAgencia,
                    ),*/
                    Visibility(child:Align(alignment: Alignment.center,
                      child: Text(
                        "*"+msjLugarPagoAgencia+"*",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),),visible: activeLugarPagoAgencia),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.arrow_right_sharp, size: 30, color: Colors.red),
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              TextSpan(
                                text: label,
                                style: TextStyle(
                                    fontSize: 16,color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(widget.userInfo.FECHA_PAGO ?? "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              strutStyle: StrutStyle(height: 1.2)),
                        ),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: fechapagoShow,
                    ),
                Container(
                    margin: EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 10,
                    ),
                    padding: EdgeInsets.all(
                        5
                    ),
                    color: Colors.white10,
                    child: Text(
                      widget.descriptionInfo.infotipo,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      strutStyle: StrutStyle(
                        height: 1.2,
                      ),
                    ),
                ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  _launchURL(latitude, longitude) async {
    var url =
        'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
