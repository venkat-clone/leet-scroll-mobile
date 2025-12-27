import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/feed/data/streek/streek_model.dart';

void main() {
  group("Parse Streak Model", () {
    test("Parse Server String into Model Object", () {
      final json = {
        "currentStreak": 0,
        "longestStreak": 0,
        "lastActivityDate": null,
        "dailyActivities": [],
        "todayActivity": null,
      };
      final model = StreekModel.fromJson(json);
      expect(model.currentStreak, 0);
      expect(model.longestStreak, 0);
      expect(model.lastActivityDate, null);
      expect(model.dailyActivities, []);
      expect(model.todayActivity, null);
    });
    test("Parse Server String into Model ", () {
      final json = {
        "currentStreak": 1,
        "longestStreak": 1,
        "lastActivityDate": "2025-12-27",
        "dailyActivities": [
          {
            "id": "cmjopn803000h11xklrhca4zc",
            "date": "2025-12-27T18:30:00.000Z",
            "totalAttempts": 8,
            "totalCorrect": 3,
            "totalSkips": 0,
          },
        ],
        "todayActivity": {
          "id": "cmjopn803000h11xklrhca4zc",
          "userId": "cmjg159om0004116jb3mokpur",
          "date": "2025-12-27T18:30:00.000Z",
          "totalAttempts": 8,
          "totalCorrect": 3,
          "totalSkips": 0,
        },
      };

      final model = StreekModel.fromJson(json);
      expect(model.currentStreak, 1);
    });
  });
}
