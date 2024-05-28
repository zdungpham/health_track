import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check your progress'),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          setState(() {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              _focusedDay = _focusedDay.subtract(const Duration(days: 7));
            } else {
              _focusedDay = _focusedDay.add(const Duration(days: 7));
            }
          });
        },
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          calendarFormat: CalendarFormat.week,
          headerVisible: true,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false, // Hides the format button
            titleCentered: true,
            leftChevronVisible: true, // Optionally hide the left chevron
            rightChevronVisible: true, // Optionally hide the right chevron
          ),
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ),
    );
  }
}
