
import 'package:yachap/data/rr/response/description.response.dart';
import 'package:yachap/data/rr/response/requirements.response.dart';

abstract class RequirementsUseCase {
  requirements(Function(List<RequirementsResponse>) onSuccess, Function(String) onError);
}