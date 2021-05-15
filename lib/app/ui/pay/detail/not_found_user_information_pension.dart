import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/ui/requirements/requirements.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/consultation_pension.response.dart';
import 'package:yachap/data/rr/response/description.response.dart';
import 'package:url_launcher/url_launcher.dart';

class NotFoundUserInformationPensionPage extends StatefulWidget {

  ConsultationPensionResponse userInfo;
  DescriptionResponse descriptionInfo;

  NotFoundUserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultationPensionResponse userInformation, DescriptionResponse descriptionResponse) =>
      MaterialPageRoute(builder: (context) => NotFoundUserInformationPensionPage(userInformation, descriptionResponse));

  @override
  _NotFoundUserInformationPensionPageState createState() => _NotFoundUserInformationPensionPageState();
}

class _NotFoundUserInformationPensionPageState extends State<NotFoundUserInformationPensionPage> {


  @override
  void initState() {
    super.initState();
    //final date = DateFormat("yyyy-MM").parse(widget.userInfo.PERIODO);
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(75)),
                            ),
                            child: Image.asset(Resources.pension,
                                width: 150, height: 150)),


                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text("Lamentablemente usted",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            strutStyle: StrutStyle(height: 1.2)),
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
                              Image.asset(Resources.close_red,
                                  width: 50, height: 50, fit: BoxFit.contain),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("No figura en el\npadrón de usuarios",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                        strutStyle: StrutStyle(height: 1.2))
                                  ])
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Text(
                          "Condición: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Text(widget.userInfo.CONDICION ?? "-",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                        ),
                        HtmlView(
                          data: widget.descriptionInfo.description.isEmpty ? "-" : widget.descriptionInfo.description,
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

  _launchURL(latitude, longitude) async {
    var url = 'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
