import 'package:flutter_test/flutter_test.dart';

class TGetDateTest {
  final startWeek = DateTime.now().weekday;
  static const int weeksCount = 15;
  static const int daysCount = weeksCount * 7;
  final today = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isFutureDate(DateTime date) => today.compareTo(date).isNegative;

  //
  DateTime getDate(int index) {
    // index = 105
    // daysCount = 105

    return today.subtract(Duration(days: (startWeek - 7) - index + daysCount));
  }
}

void main() {
  group("test Get Date Function", () {
    test("Should return 6 months past date if i give index 0", () {
      expect(
        TGetDateTest().getDate(0),
        TGetDateTest().today.subtract(
          Duration(
            days: (TGetDateTest.daysCount - (7 - TGetDateTest().startWeek)),
          ),
        ),
      );
    });
    test("Should return this weekend date i give index 105", () {
      expect(
        TGetDateTest().getDate(TGetDateTest.daysCount - 1),
        TGetDateTest().today.add(Duration(days: 6 - TGetDateTest().startWeek)),
      );
    });
  });
}
