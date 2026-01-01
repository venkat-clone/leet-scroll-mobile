import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart';

void main() {
  group("Submission Json parsing", () {
    test("Should parse the Submission Json", () {
      final json = {
        "id": "cmjilp9qg000hf5q9yexv5szv",
        "userId": "cmjg159om0004116jb3mokpur",
        "questionId": "cmjg181em0009116jvb31rvah",
        "attempts": 3,
        "correctAttempts": 3,
        "lastCorrect": true,
        "lastShownAt": "2025-12-24T18:41:16.746Z",
        "submittedAt": "2025-12-24T18:41:15.372Z",
        "isCorrect": true,
        "createdAt": "2025-12-23T13:08:36.616Z",
        "question": {
          "id": "cmjg181em0009116jvb31rvah",
          "title": "What is printed by this mixed-type stack evaluation?",
          "description":
              "```python\nstack = []\nstack.append(5)\nstack.append(\"5\")\nstack.append(5.0)\n\nwhile stack:\n    print(type(stack.pop()).__name__)\n```",
          "options": [
            "int, str, float",
            "float, str, int",
            "str, int, float",
            "int, float, str",
          ],
          "correctOption": 1,
          "explanation":
              "```text\nStack top → 5.0 → float\nNext → \"5\" → str\nLast → 5 → int\n```",
          "difficulty": "MEDIUM",
          "category": "Type Behavior",
          "tags": ["Python"],
          "codeSnippet": null,
          "createdAt": "2025-12-21T17:59:47.998Z",
          "updatedAt": "2025-12-21T17:59:47.998Z",
        },
        "attemptsHistory": [
          {
            "id": "cmjimps1p001hp2z54k8oqu0j",
            "userId": "cmjg159om0004116jb3mokpur",
            "questionId": "cmjg181em0009116jvb31rvah",
            "selectedOption": "1",
            "isCorrect": true,
            "attemptedAt": "2025-12-23T13:36:59.965Z",
          },
          {
            "id": "cmjipz9rm008pp2z5ptqzgq9f",
            "userId": "cmjg159om0004116jb3mokpur",
            "questionId": "cmjg181em0009116jvb31rvah",
            "selectedOption": "1",
            "isCorrect": true,
            "attemptedAt": "2025-12-23T15:08:21.682Z",
          },
          {
            "id": "cmjkd0wok0001fkukimzq7ab3",
            "userId": "cmjg159om0004116jb3mokpur",
            "questionId": "cmjg181em0009116jvb31rvah",
            "selectedOption": "1",
            "isCorrect": true,
            "attemptedAt": "2025-12-24T18:41:15.377Z",
          },
        ],
      };

      final submission = SubmissionModel.fromJson(json);

      expect(
        (json['question'] as Map<String, dynamic>)['title'],
        submission.question.title,
      );
    });
  });
}
