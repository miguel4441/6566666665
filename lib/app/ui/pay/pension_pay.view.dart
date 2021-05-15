import 'package:yachap/app/ui/base/default.view.dart';
import 'package:yachap/data/rr/response/consultation_pension.response.dart';
import 'package:yachap/data/rr/response/description.response.dart';
import 'package:yachap/data/rr/response/popapp.response.dart';
import 'package:yachap/data/rr/response/requirements.response.dart';

abstract class PensionView extends DefaultView {
  getUserInformation(ConsultationPensionResponse userInformation, DescriptionResponse DescriptionResponse);

}