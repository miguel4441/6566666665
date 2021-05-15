import 'package:yachap/data/rr/response/consultation_general.response.dart';
import 'package:yachap/data/rr/response/consultation_pension.response.dart';
import 'package:yachap/data/rr/response/description.response.dart';
import 'package:yachap/data/rr/response/description_general.response.dart';

abstract class ConsultationUseCase {
  consultationGeneral(String dni, String fnac, Function(ConsultationGeneralResponse, DescriptionGeneralResponse) onSuccess, Function(String) onError);
  consultationPension(String dni, String fnac, Function(ConsultationPensionResponse, DescriptionResponse) onSuccess, Function(String) onError);
}