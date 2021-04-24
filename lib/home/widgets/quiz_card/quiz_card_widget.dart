import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.quiz,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double spaceBetween = screenHeight * 0.02;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // child: Image.asset(quiz.image),
              width: 40,
              height: 40,
            ),
            SizedBox(
              height: spaceBetween,
            ),
            Text(
              quiz.title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: spaceBetween,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    _getProgressText(),
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(
                    value: _getProgress(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _getProgress() => quiz.answeredQuestions / quiz.questions.length;

  String _getProgressText() =>
      "${quiz.answeredQuestions} de ${quiz.questions.length}";
}
