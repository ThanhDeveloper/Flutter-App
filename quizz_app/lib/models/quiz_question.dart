class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> getScuffledAnswer() {
    final sufferList = List.of(answer);
    sufferList.shuffle();
    return sufferList;
  }
}