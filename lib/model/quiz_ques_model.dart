// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArcQuizQuesModel {
  final int questionID;
  final String question;
  final String optA;
  final String optB;
  final String optC;
  final String optD;
  final String answer;
   int timeTaken;
   int score;
   bool  isPlayedCorrect;
   String? tappedOption;
  ArcQuizQuesModel({
    required this.questionID,
    required this.question,
    required this.optA,
    required this.optB,
    required this.optC,
    required this.optD,
    required this.answer,
     this.timeTaken=0,
     this.score=0,
     this.tappedOption,
this.isPlayedCorrect = false,
  });

  ArcQuizQuesModel copyWith({
    int? questionID,
    String? question,
    String? optA,
    String? optB,
    String? optC,
    String? optD,
    String? answer,
    int? timeTaken,
    int? score,
    String? tappedOption,
  }) {
    return ArcQuizQuesModel(
      questionID: questionID ?? this.questionID,
      question: question ?? this.question,
      optA: optA ?? this.optA,
      optB: optB ?? this.optB,
      optC: optC ?? this.optC,
      optD: optD ?? this.optD,
      answer: answer ?? this.answer,
      timeTaken: timeTaken ?? this.timeTaken,
      score: score ?? this.score,
      tappedOption: tappedOption ?? this.tappedOption,
    );
  }
  factory ArcQuizQuesModel.fromMap(Map<String, dynamic> map) {
    return ArcQuizQuesModel(
      questionID: map['Question_id'] as int,
      question: map['Question'] as String,
      optA: map['A'] as String,
      optB: map['B'] as String,
      optC: map['C'] as String,
      optD: map['D'] as String,
      answer: map['ANS'] as String,
    );
  }
  @override
  String toString() {
    return 'ArcQuizQuesModel(questionID: $questionID, question: $question, optA: $optA, optB: $optB, optC: $optC, optD: $optD, answer: $answer, timeTaken: $timeTaken, score: $score, tappedOption: $tappedOption)';
  }

  @override
  bool operator ==(covariant ArcQuizQuesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.questionID == questionID &&
      other.question == question &&
      other.optA == optA &&
      other.optB == optB &&
      other.optC == optC &&
      other.optD == optD &&
      other.timeTaken == timeTaken &&
      other.score == score &&
      other.tappedOption == tappedOption &&
      other.answer == answer;
  }

  @override
  int get hashCode {
    return questionID.hashCode ^
      question.hashCode ^
      optA.hashCode ^
      optB.hashCode ^
      optC.hashCode ^
      optD.hashCode ^
      tappedOption.hashCode ^
      timeTaken.hashCode ^
      score.hashCode ^
      answer.hashCode;
  }
}
