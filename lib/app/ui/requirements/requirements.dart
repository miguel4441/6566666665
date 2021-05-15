import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/ui/requirements/requirements.presenter.dart';
import 'package:yachap/app/ui/requirements/requirements.view.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/requirements.response.dart';
import 'package:yachap/domain/repository/requirements.repository.dart';

class RequirementsPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => RequirementsPage());

  @override
  _RequirementsPageState createState() => _RequirementsPageState();
}

class _RequirementsPageState extends State<RequirementsPage>
    implements RequirementsView {
  List<RequirementsResponse> requirementsList = [];
  RequirementsPresenter _requirementsPresenter;

  @override
  void initState() {
    super.initState();

    _requirementsPresenter =
        RequirementsPresenter(requirementsRepository: RequirementsRepository());
    _requirementsPresenter.view = this;
    _requirementsPresenter.getRequirements();
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
            appBar: requirementsBar(context),
            body: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  Text(
                    "Conoce los requisitos para acceder al Programa Nacional de Asistencia Solidaria Pensión 65",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    strutStyle: StrutStyle(height: 1.4),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: requirementsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [



                                Container(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 20.0,
                                        left: 20.0),
                                    //height: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          //right: ConstantsDialogInit.padding,
                                          //top: ConstantsDialogInit.padding+ConstantsDialogInit.padding + 8,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 20.0,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  child: Text((index+1).toString())
                                              ),
                                            )),
                                        Icon(
                                          IconDataSolid(int.parse("0x${requirementsList[index].icon}")),
                                          //FontAwesomeIcons.calendar,
                                          size: 50,
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 30),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border(left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey)),
                                          ),
                                        ),
                                        Flexible(
                                          //height: double.infinity,
                                          child: HtmlView(
                                            data: Platform.isAndroid ? '<p>${requirementsList[index].description}</p>' : '<p>requirementsList[index].description</p>',
                                            scrollable: false,
                                          ),
                                        )
                                      ],
                                    )),



                                  SizedBox(
                                    height: 10,
                                  )
                                ]);
                          })),
                  Container(
                      margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Los trámites son gratuitos y sin intermediarios. Realízalos en la Unidad Local de Empadronamiento (ULE) de la municipalidad del distrito donde resides.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(height: 1.2),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  getRequirements(List<RequirementsResponse> requirements) {
    setState(() {
      requirementsList = requirements;
    });
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}
}
