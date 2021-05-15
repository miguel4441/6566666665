
import 'package:yachap/data/http_api_rest.dart';
import 'package:yachap/data/rr/response/popapp.response.dart';
import 'package:yachap/domain/usecase/popapp.usecase.dart';

class PopAppRepository implements PopAppUseCase {
  @override
  Future<List<PopAppReponse>> bienvenidaYPagos(Function(List<PopAppReponse> popAppList) onSuccess, Function(String message) onError) async{
    // TODO: implement bienvenidaYPagos
   await HttpResponse.get("https://movil.pension65.gob.pe/bonos/wsconsultabienvenida.php", (response) => onSuccess(PopAppReponse.listFromJson(response)), (message) => onError(message));
  }
  
}