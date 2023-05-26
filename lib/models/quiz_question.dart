//modele class
//thnigs define here used in data class
class QuizQuestion {
  //construtor fun
  const QuizQuestion(this.text, this.answers);

  //2 class variable / instance variabls
  final String text;
  final List<String> answers;

//crate a shuffle list method with .shuffle
//save a copy of answer style with List.of(copylistElement) constructor
//we can change command after command calling method on result of other method is channing

  List<String> getShuffledAnswer() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
