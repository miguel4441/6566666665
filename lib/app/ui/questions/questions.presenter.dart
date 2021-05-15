import 'package:yachap/app/ui/questions/questions.view.dart';
import 'package:yachap/domain/repository/questions.repository.dart';

class QuestionsPresenter {
  QuestionsRepository questionsRepository;
  QuestionsView view;

  QuestionsPresenter({this.questionsRepository});

  getQuestions() {
    questionsRepository.questions(
            (questionsListResponse) =>
        {view.getQuestions(questionsListResponse)},
            (message) => {view.onError(message)});
  }
}