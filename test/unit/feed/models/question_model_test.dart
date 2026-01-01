import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/feed/data/question_model.dart';

void main() {
  group("Question Model parse", () {
    test("Should parse the Dict to Object", () {
      final questionJson = {
        "id": "ID",
        "title": "Title",
        "description": "```python\ndef solve(n):\nsolve(3)\n```",
        "options": ["3 2 1", "3 2 1 0", "3 2 1 then error", "3 2 then stops"],
        "difficulty": "HARD",
        "category": "Recursion Stack",
        "tags": ["Python", "Recursion"],
        "correctOption": 0,
        "explanation":
            "```text\nCall stack:\nsolve(3)\n → solve(2)\n   → solve(1)\n     → solve(0)\nOnly prints before recursion → 3 2 1\n```",
        "codeSnippet": null,
      };

      final Question question = Question.fromJson(questionJson);

      expect(question.id, questionJson["id"]);
      expect(question.title, questionJson["title"]);
      expect(question.description, questionJson["description"]);
      expect(question.options, questionJson["options"]);
    });
    test("Should parse the List to Object", () {
      final questions = [
        {
          "id": "cmjg181em0006116j5shhvq5m",
          "title": "What is the output of this recursion + stack behavior?",
          "description":
              "```python\ndef solve(n):\n    if n == 0:\n        return 1\n    print(n)\n    return solve(n-1)\n\nsolve(3)\n```",
          "options": ["3 2 1", "3 2 1 0", "3 2 1 then error", "3 2 then stops"],
          "difficulty": "HARD",
          "category": "Recursion Stack",
          "tags": ["Python", "Recursion"],
          "correctOption": 0,
          "explanation":
              "```text\nCall stack:\nsolve(3)\n → solve(2)\n   → solve(1)\n     → solve(0)\nOnly prints before recursion → 3 2 1\n```",
          "codeSnippet": null,
        },
        {
          "id": "cmjg181em0007116jjg87fcen",
          "title":
              "What is the result of this stack-based infix→postfix conversion?",
          "description":
              "```python\nexpr = \"A+B*(C-D)/E\"  # Infix\nstack = []\noutput = []\n\nprecedence = {'+':1, '-':1, '*':2, '/':2}\n\nfor ch in expr:\n    if ch.isalpha():\n        output.append(ch)\n    elif ch in precedence:\n        while stack and precedence.get(stack[-1],0) \u003E= precedence[ch]:\n            output.append(stack.pop())\n        stack.append(ch)\n    elif ch == '(':\n        stack.append(ch)\n    elif ch == ')':\n        while stack and stack[-1] != '(':\n            output.append(stack.pop())\n        stack.pop()\n\nwhile stack:\n    output.append(stack.pop())\n\nprint(''.join(output))\n```",
          "options": ["ABCD-*E/+", "ABCD-*+E/", "ABCD-*E/+", "ABC-D*E/+"],
          "difficulty": "HARD",
          "category": "Expression Conversion",
          "tags": ["DSA", "Stacks"],
          "correctOption": 2,
          "explanation":
              "```text\nA + (B * (C - D)) / E\nPostfix → ABCD-*E/+\n```",
          "codeSnippet": null,
        },
      ];

      final List<Question> questionsList = questions
          .map((questionJson) => Question.fromJson(questionJson))
          .toList();
      expect(questionsList.length, questions.length);
    });
    test("Should parse the Feed Object", () {
      final feedObj = {
        "id": "cmjg181em0007116jjg87fcen",
        "title":
            "What is the result of this stack-based infix→postfix conversion?",
        "description":
            "```python\nexpr = \"A+B*(C-D)/E\"  # Infix\nstack = []\noutput = []\n\nprecedence = {'+':1, '-':1, '*':2, '/':2}\n\nfor ch in expr:\n    if ch.isalpha():\n        output.append(ch)\n    elif ch in precedence:\n        while stack and precedence.get(stack[-1],0) \u003E= precedence[ch]:\n            output.append(stack.pop())\n        stack.append(ch)\n    elif ch == '(':\n        stack.append(ch)\n    elif ch == ')':\n        while stack and stack[-1] != '(':\n            output.append(stack.pop())\n        stack.pop()\n\nwhile stack:\n    output.append(stack.pop())\n\nprint(''.join(output))\n```",
        "options": ["ABCD-*E/+", "ABCD-*+E/", "ABCD-*E/+", "ABC-D*E/+"],
        "correctOption": 1,
        "difficulty": "HARD",
        "category": "Expression Conversion",
        "tags": ["DSA", "Stacks"],
        "codeSnippet": null,
        "userProgress": {
          "attempts": 0,
          "correctAttempts": 0,
          "isCorrect": null,
          "lastShownAt": null,
        },
        "viewsCount": 0,
        "likesCount": 0,
        "commentsCount": 0,
        "matchingTagsCount": 1,
        "difficultyMatches": false,
        "priority": 0,
        "userRanking": 3,
        "interestedTagsCount": 0,
      };
      final Question question = Question.fromJson(feedObj);
      expect(question.id, feedObj["id"]);
    });
  });
}
