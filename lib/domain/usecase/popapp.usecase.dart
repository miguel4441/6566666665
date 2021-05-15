

import 'package:yachap/data/rr/response/popapp.response.dart';

abstract class PopAppUseCase{
  bienvenidaYPagos(Function(List<PopAppReponse>) onSuccess, Function(String) onError);
}