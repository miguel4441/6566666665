//  import 'dart:html';


import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:yachap/app/ui/nav_bar/bar.dart';
import 'package:yachap/app/ui/questions/questions.presenter.dart';
import 'package:yachap/app/ui/questions/questions.view.dart';
import 'package:yachap/app/utils/resources.dart';
import 'package:yachap/data/rr/response/questions.response.dart';
import 'package:yachap/domain/repository/questions.repository.dart';

class QuestionPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => QuestionPage());

  @override
  _QuestionPage createState() => _QuestionPage();
}

class _QuestionPage extends State<QuestionPage> implements QuestionsView {
  List<QuestionResponse> questionsList = [];
  QuestionsPresenter _questionsPresenter;
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _questionsPresenter =
        QuestionsPresenter(questionsRepository: QuestionsRepository());
    _questionsPresenter.view = this;
    _questionsPresenter.getQuestions();
  }

  @override
  void dispose() {
    listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            appBar: questionsBar(context),
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

                  Expanded(
                      child: ListView.builder(
                          itemCount: questionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [



                                        new ExpansionTile(
                                          leading:  Positioned(
                            left: 20.0,
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
                                          title: Container(

                                            child:
                                HtmlView(
                                  data:
                                  """<h2><b>${questionsList[index].pregunta}</b></h2>""",
                                  scrollable: false,
                                ),
                               decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border(bottom: BorderSide(color: Colors.grey),),
                                          ),
                                          ),
                                          children: <Widget>[
                                            Column(children: <Widget>[
                                              ListTile(
                                                title: Container(
                                                  child: Align(alignment: Alignment.centerLeft, child: HtmlView(
                                                    data://"""<div style='font-size : 20px; text-align: justify'>${questionsList[index].respuesta}</div>"""
                                                    """<h2 style='font-size : 20px'>${questionsList[index].respuesta}</h2>""",
                                                    scrollable: false,
                                                  ),),
                                                ),
                                              ),
                                            ],),
                                            SizedBox(
                                              height: 2,
                                            ),
                                          ],
                                        ),








                                  SizedBox(
                                    height: 20,
                                  ),
                                ]);
                          })),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}

  @override
  getQuestions(List<QuestionResponse> questions) {
    // TODO: implement getQuestions
    setState(() {
      questionsList = questions;
    });
  }
}
