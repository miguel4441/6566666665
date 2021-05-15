import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:yachap/app/utils/font/dialoginit_constants.dart';
import 'package:yachap/data/rr/response/popapp.response.dart';


class DialogInit extends StatefulWidget {

  //final String title, description, text;
  final List<PopAppReponse> popAppList;

  const DialogInit({Key key, this.popAppList}) : super(key: key);
  
  @override
  _DialogInit createState() => _DialogInit(popAppList: popAppList);

}

class _DialogInit extends State<DialogInit> {
  List<PopAppReponse> popAppList;
  _DialogInit({this.popAppList});

  @override
  Widget build(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstantsDialogInit.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contextBox(context),
    );
  }

  contextBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: ConstantsDialogInit.padding, top: ConstantsDialogInit.avatarRadius
          +ConstantsDialogInit.padding, right: ConstantsDialogInit.padding, bottom: ConstantsDialogInit.padding),
          margin: EdgeInsets.only(top: ConstantsDialogInit.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(ConstantsDialogInit.padding),
            boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 10),
              blurRadius: 10),
            ],
          ),
          child: ListView.builder(itemCount: popAppList.length,
          itemBuilder: (BuildContext context , int index){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(popAppList[index].icon,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                SizedBox(height: 5,),
                Align(alignment: Alignment.centerLeft, child: HtmlView(
            data:popAppList[index].alerta,
            scrollable: false,
            ),),

                /*Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text(widget.text,style: TextStyle(fontSize: 18),)),
                ),*/

              ],
            );
          },),
          height: 400,
        ),
        /*Positioned(
            //left: ConstantsDialogInit.padding,
            //right: ConstantsDialogInit.padding,
            //top: ConstantsDialogInit.padding+ConstantsDialogInit.padding + 8,
            child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: ConstantsDialogInit.avatarRadius,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(ConstantsDialogInit.avatarRadius)),
              child: Image.network("https://movil.pension65.gob.pe/movil/webservices/imagenes/eleccion.jpg")
          ),
        ))*/
      ],
    );
  }
  
}