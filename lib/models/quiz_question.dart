class QuizQuestion{
  const QuizQuestion(this.text , this.answer);
  final String text;
  final List<String> answer;

  List<String> getShuffledList(){
    //below line creates a copy of answer list using List.of
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}