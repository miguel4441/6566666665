import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yachap/app/ui/dialog/dialog_init/dialog_initial.dart';
import 'package:yachap/app/ui/general/general.dart';

import 'package:yachap/app/ui/pay/pension_pay.dart';
import 'package:yachap/app/ui/questions/questions.dart';
import 'package:yachap/app/ui/requirements/requirements.dart';
 
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/popapp.response.dart';
import 'package:yachap/domain/repository/popapp.repository.dart';

class HomePage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => HomePage());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PopAppReponse> varpopAppList = [];

  @override
  void initState() {
    super.initState();

    _showDialog();

  }

  _showDialog() async{
    PopAppRepository popAppRepository = PopAppRepository();
    await popAppRepository.bienvenidaYPagos((popAppList) {
      varpopAppList.add(popAppList[0]);
      varpopAppList.add(popAppList[1]);
      varpopAppList.add(popAppList[2]);


    }, (message) => null).whenComplete(() {

       SchedulerBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) {

            print("cargando: "+varpopAppList[0].alerta);
            return DialogInit(popAppList: varpopAppList);


          }));
    })  ;


    //); Future.delayed(Duration(milliseconds: 5));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Resources.bg),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(38.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 222,
                          height: 58,
                          margin: EdgeInsets.only(bottom: 77),
                          child: Image.asset(Resources.pension65),
                        ),
                        Container(
                          width: 200,
                          //height: 65,
                          //margin: EdgeInsets.only(bottom: 170),
                          child: Image.asset(Resources.midis),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 5)),
                        GestureDetector(
                          child: Container(
                            height: 77,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(38.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                "CONSULTA GENERAL",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                  strutStyle: StrutStyle(
                                  height: 1.2
                              )
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, GeneralPage.route());
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        GestureDetector(
                          child: Container(
                            height: 77,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(38.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                "CONSULTA DE PAGO DE PENSIÓN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                  strutStyle: StrutStyle(
                                      height: 1.5
                                  )
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, PensionPage.route());
                          },
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        GestureDetector(
                            child: Container(
                          height: 77,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(38.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                )
                              ]),
                          child: Center(
                            child: Text(
                              "REQUISITOS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              strutStyle: StrutStyle(
                                  height: 1.2
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ), onTap: () {
                              Navigator.push(context, RequirementsPage.route());
                        }),
                        Padding(
                          padding:  EdgeInsets.only(
                            top: 20
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 77,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(38.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                    0,3
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "PREGUNTAS FRECUENTES",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),
                                strutStyle: StrutStyle(
                                  height: 1.2,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, QuestionPage.route());
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }




}
