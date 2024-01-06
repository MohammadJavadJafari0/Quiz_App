class Question {
  String question;
  String answer1;
  String answer2;

  // right answer 1-> answer1, 2-> answer2
  int trueAnswer;

  // constructor
  Question(this.question, this.answer1, this.answer2, this.trueAnswer);

  bool isRight(int num) {
    if (num == 1 || num == 2) {
      // pass
    } else {
      return false;
    }
    // true answer -> 1
    if (trueAnswer == 1) {
      if (num == 1) {
        return true;
      } //
      else {
        return false;
      }
    } // true answer -> 2
    else {
      if (num == 2) {
        return true;
      } //
      else {
        return false;
      }
    }
  }
}

List<Question> testList = [
  Question('what is the capital of Iran?', 'Tabriz', 'Tehran', 1),
  Question('who is harry potter?', 'harry potter is a actor',
      'harry potter is a singer', 1),
  Question('Is homayoon shajariyan a actor?', 'yes', 'no', 2),
  Question('what is the name of best season?', 'summer', 'winter', 1),
  Question(
      'do we need energy in our life?',
      'yes, all of us need energy to survive and have happy life',
      'no, it is not necessery to have energy',
      1),
  Question('do you have any goal in your life?', 'of course, I have',
      'No, I wanna be free without any goal', 1),
  Question('Are we human or robot?', 'robot', 'human', 2),
  Question('Are you fine?', 'yes', 'no', 1),
  Question('is enyone try to help you?', 'no', 'yes', 2),
  Question(
      'are you lucky person?', 'no, i think i am not lucky', 'of course yes', 2)
];
