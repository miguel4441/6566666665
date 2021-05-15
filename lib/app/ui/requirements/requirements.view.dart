import 'package:yachap/app/ui/base/default.view.dart';
import 'package:yachap/data/rr/response/requirements.response.dart';

abstract class RequirementsView extends DefaultView{
  getRequirements(List<RequirementsResponse> requirements);
}