import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/consultation_general.response.dart';
import "package:yachap/app/utils/string.extension.dart";
import 'package:yachap/data/rr/response/description_general.response.dart';

class UserInformationPage extends StatefulWidget {
  ConsultationGeneralResponse userInfo;
  DescriptionGeneralResponse descriptionResponse;

  UserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(ConsultationGeneralResponse userInformation, DescriptionGeneralResponse dscrptnResponse) =>
      MaterialPageRoute(
          builder: (context) => UserInformationPage(userInformation, dscrptnResponse));

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
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
              appBar: generalBar(context),
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
                                    strutStyle: StrutStyle(height: 1.4)))
                          ],
                        ),
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(75)),
                            ),
                            child: Image.asset(Resources.general,
                                width: 150, height: 150)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
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
                              Image.asset(Resources.check_green,
                                  width: 50, height: 50, fit: BoxFit.contain),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("USUARIO(a)",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                        strutStyle: StrutStyle(height: 1.2))
                                  ])
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
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
                                text: "Clasificación socioeconómica:",
                                style: TextStyle(
                                    fontSize: 16,color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(widget.userInfo.CSE.isEmpty ? "-" : widget.userInfo.CSE,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
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
                                text: "Ubigeo:",
                                style: TextStyle(
                                    fontSize: 16,color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(
                            widget.userInfo.UBIGEO.isEmpty ? "-" : widget.userInfo.UBIGEO +
                                " - " +
                                widget.userInfo.DEPARTAMENTO +
                                ", " +
                                widget.userInfo.PROVINCIA +
                                ", " +
                                widget.userInfo.DISTRITO,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2),
                        textAlign: TextAlign.center),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
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
                                text: "Fecha de vencimiento de tu clasificación socioeconómica:",
                                style: TextStyle(
                                    fontSize: 16,color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(
                            widget.userInfo.FECHA_VENCIMIENTO_VIGENCIA.isEmpty ? "-" :
                            customFormat(
                                widget.userInfo.FECHA_VENCIMIENTO_VIGENCIA),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  String customFormat(String date) {
    final splitDate = date.split("-");
    final day = splitDate[0];
    final month = splitDate[1].capitalize();
    final year = (2000 + int.parse(splitDate[2])).toString();

    final month_string = DateFormat("MMMM", "es_PE")
        .format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final dayWeek = DateFormat("EEEE", "es_PE")
        .format(DateFormat("dd MMM yyyy").parse("$day $month $year"));

    return date == null
        ? ""
        : dayWeek.capitalize() +
        ", " +
        day +
        " de " +
        month_string.capitalize() +
        " del " +
        year;
  }
}
