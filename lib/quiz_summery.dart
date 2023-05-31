//widget used in result-screen for questionSummery
import 'package:flutter/material.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summaryData, {super.key});
//summery map object from
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return Column(
      //convert List of map to Widget
      //pass Map data one by one
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              // access Values in map  ['key']
              //now we access data and map values
              //we add question index + 1 cause index is start from zero and we want to dispay number to user from 1
              //we cannot asign +1 directly to map value cause map dont now what the value type so we define int by self
              //now int cannot be asing to string so we use .toString() to convert to sting

              Text(
                ((data['question_index'] as int) + 1).toString(),
              ),
              // coumn for quetion and answer text
              Column(
                children: [
                  //assessing map values by ['key']
                  Text(data['question'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['correct answer'] as String),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(data['user_answer'] as String),
                ],
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
