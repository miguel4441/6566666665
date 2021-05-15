import 'package:yachap/app/ui/pay/pension_pay.view.dart';
import 'package:yachap/domain/repository/consultations.repository.dart';
import 'package:yachap/domain/repository/popapp.repository.dart';

class PensionPresenter {
  ConsultationsRepository consultationsRepository;
  PopAppRepository popAppRepository;
  PensionView view;

  PensionPresenter({this.consultationsRepository, this.popAppRepository});

  getUserInformation(String dni, String fnac) {
    view.showLoading();
    consultationsRepository.consultationPension(dni, fnac,
        (listUserInformation, descriptionInfo) {
      view.hideLoading();
      view.getUserInformation(listUserInformation, descriptionInfo);
    }, (message) {
      view.hideLoading();
      view.onError(message);
    });
  }

  
}
