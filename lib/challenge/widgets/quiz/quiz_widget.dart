import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: 'Resposta 1',
            isRight: true,
            isSelected: true,
          ),
          AnswerWidget(
            title: 'Resposta 2',
            isRight: false,
            isSelected: true,
          ),
          AnswerWidget(
            title: 'Resposta 3',
            isRight: true,
            isSelected: false,
          ),
          AnswerWidget(
            title: 'Resposta 4',
            isRight: false,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
