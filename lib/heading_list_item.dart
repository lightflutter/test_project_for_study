import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project_for_study/day_heading.dart';

class HeadingListItem extends StatelessWidget {
  static final _dateFormatWeekDay = DateFormat('EEEE');
  final DayHeading dayHeading;

  const HeadingListItem(this.dayHeading, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Text(
            '${_dateFormatWeekDay.format(dayHeading.dateTime)} '
            '${dayHeading.dateTime.day}/${dayHeading.dateTime.month}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
