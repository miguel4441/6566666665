import 'package:yachap/app/ui/base/default.view.dart';
import 'package:yachap/data/rr/response/consultation_general.response.dart';
import 'package:yachap/data/rr/response/description_general.response.dart';

abstract class GeneralView extends DefaultView {
  getUserInformation(ConsultationGeneralResponse userInformation, DescriptionGeneralResponse descriptionResponse);
}