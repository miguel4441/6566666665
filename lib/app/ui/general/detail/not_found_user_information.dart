import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:intl/intl.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/ui/requirements/requirements.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/consultation_general.response.dart';
import "package:yachap/app/utils/string.extension.dart";
import 'package:yachap/data/rr/response/description_general.response.dart';

class NotFoundUserInformationPage extends StatefulWidget {
  ConsultationGeneralResponse userInfo;
  DescriptionGeneralResponse descriptionResponse;

  NotFoundUserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(ConsultationGeneralResponse userInformation, DescriptionGeneralResponse dscptnResponse) =>
      MaterialPageRoute(
          builder: (context) => NotFoundUserInformationPage(userInformation, dscptnResponse));

  @override
  _NotFoundUserInformationPageState createState() => _NotFoundUserInformationPageState();
}

class _NotFoundUserInformationPageState extends State<NotFoundUserInformationPage> {
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

                        Text("DNI NO ENCONTRADO",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                            strutStyle: StrutStyle(height: 1.4)),
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
                              Image.asset(Resources.close_red,
                                  width: 50, height: 50, fit: BoxFit.contain),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Usuario\nno encontrado",
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
                        HtmlView(
                          data: widget.descriptionResponse.description.isEmpty ? "-" : widget.descriptionResponse.description,
                          scrollable: false,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                        FlatButton(
                          height: 50,
                          textColor: Colors.white,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "VER REQUISITOS",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2),
                          ),
                          onPressed: () {
                            Navigator.push(context, RequirementsPage.route());
                          },
                        ),
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
