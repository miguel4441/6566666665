import 'dart:convert';

import 'package:yachap/data/http_api_rest.dart';
import 'package:yachap/data/rr/response/requirements.response.dart';
import 'package:yachap/domain/usecase/questions.usecase.dart';
import 'package:yachap/data/rr/response/questions.response.dart';


class QuestionsRepository implements QuestionsUseCase {

  @override
  questions(Function(List<QuestionResponse>) onSuccess, Function(String) onError) {
    HttpResponse.get("https://movil.pension65.gob.pe/bonos/wsconsultafrecuentes.php", (response) => onSuccess(QuestionResponse.listFromJson(response)), (message) => onError(message));
  }

}