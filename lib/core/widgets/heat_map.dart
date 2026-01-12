import 'package:flutter/material.dart';

class HeatMap extends StatelessWidget {
  static const int weeksCount = 15;
  static const int daysCount = weeksCount * 7;

  HeatMap({
    super.key,
    required this.dailyActivities,
    required this.hearMapColorMapping,
  });

  final Color Function([double? totalAttempts]) hearMapColorMapping;

  final Map<DateTime, double?> dailyActivities;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 120,
      alignment: Alignment.center,
      child: GridView.builder(
        reverse: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: daysCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 2,
          mainAxisExtent: maxWidth > 450 ? 24 : 16,
          //
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          final date = _getDate(index);
          if (isFutureDate(date)) {
            return SizedBox();
          }
          if (dailyActivities[date] == null) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: hearMapColorMapping(),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }

          final double? activityModel = dailyActivities[date];
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: hearMapColorMapping(activityModel),
              borderRadius: BorderRadius.circular(3),
            ),
          );
        },
      ),
    );
  }

  final startWeek = DateTime.now().weekday;

  final today = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  bool isFutureDate(DateTime date) => today.compareTo(date).isNegative;

  DateTime _getDate(int index) {
    return today.subtract(Duration(days: (startWeek - 7) - index + daysCount));
  }
}
