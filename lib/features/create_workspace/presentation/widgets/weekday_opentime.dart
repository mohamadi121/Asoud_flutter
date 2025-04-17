import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/widgets/custom_button.dart';
import 'package:asood/features/create_workspace/presentation/widgets/row_widget_title_widget.dart';

class WeekdayOpentime extends StatefulWidget {
  const WeekdayOpentime({super.key});

  @override
  State<WeekdayOpentime> createState() => _WeekdayOpentimeState();
}

class _WeekdayOpentimeState extends State<WeekdayOpentime> {
  final List<String> _weekDays = [
    "شنبه",
    "یکشنبه",
    "دوشنبه",
    "سه‌شنبه",
    "چهارشنبه",
    "پنج‌شنبه",
    "جمعه",
  ];

  final Map<String, List<TimeOfDay?>> _timeRanges = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(_weekDays.length, (index) {
          final day = _weekDays[index];
          _timeRanges.putIfAbsent(day, () => [null, null, null, null]);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: RowWidgetTitle(
                  title: day,
                  widget: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTimeRow(
                          _timeRanges[day]![0],
                          _timeRanges[day]![1],
                          (from) => setState(() => _timeRanges[day]![0] = from),
                          (to) {
                            if (_isToAfterFrom(_timeRanges[day]![0], to)) {
                              setState(() => _timeRanges[day]![1] = to);
                            } else {
                              _showError(context);
                            }
                          },
                          onClear:
                              () => setState(() {
                                _timeRanges[day]![0] = null;
                                _timeRanges[day]![1] = null;
                              }),
                        ),
                        const SizedBox(height: 6),
                        _buildTimeRow(
                          _timeRanges[day]![2],
                          _timeRanges[day]![3],
                          (from) => setState(() => _timeRanges[day]![2] = from),
                          (to) {
                            if (_isToAfterFrom(_timeRanges[day]![2], to)) {
                              setState(() => _timeRanges[day]![3] = to);
                            } else {
                              _showError(context);
                            }
                          },
                          onClear:
                              () => setState(() {
                                _timeRanges[day]![2] = null;
                                _timeRanges[day]![3] = null;
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (index != _weekDays.length - 1)
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colora.primaryColor,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTimeRow(
    TimeOfDay? from,
    TimeOfDay? to,
    ValueChanged<TimeOfDay> onFromSelected,
    ValueChanged<TimeOfDay> onToSelected, {
    required VoidCallback onClear,
  }) {
    final bool showClear = from != null || to != null;

    return Container(
      decoration: BoxDecoration(
        color: Colora.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TimePickerField(
            label: "از ساعت",
            time: from,
            onTap: () {
              showCustomTimePicker(
                context: context,
                initialTime: from ?? TimeOfDay.now(),
                onTimeSelected: onFromSelected,
              );
            },
          ),
          const SizedBox(width: 6),
          const Text("-", style: TextStyle(color: Colors.white)),
          const SizedBox(width: 6),
          TimePickerField(
            label: "تا ساعت",
            time: to,
            onTap: () {
              showCustomTimePicker(
                context: context,
                initialTime: to ?? TimeOfDay.now(),
                onTimeSelected: onToSelected,
              );
            },
          ),
          const SizedBox(width: 8),
          if (showClear)
            InkWell(
              onTap: onClear,

              child: Icon(Icons.clear, color: Colors.white),
            ),
        ],
      ),
    );
  }

  bool _isToAfterFrom(TimeOfDay? from, TimeOfDay to) {
    if (from == null) return true;
    final fromMinutes = from.hour * 60 + from.minute;
    final toMinutes = to.hour * 60 + to.minute;
    return toMinutes > fromMinutes;
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ساعت پایان باید بعد از ساعت شروع باشد'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class TimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay? time;
  final VoidCallback onTap;

  const TimePickerField({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 30,
        decoration: BoxDecoration(
          color: Colora.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            time != null ? time!.format(context) : label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void showCustomTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  required void Function(TimeOfDay) onTimeSelected,
}) {
  TimeOfDay selectedTime = initialTime;

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colora.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'انتخاب ساعت',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: TimePickerSpinner(
                      is24HourMode: true,
                      normalTextStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                      highlightedTextStyle: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                      spacing: 30,
                      itemHeight: 60,
                      isForce2Digits: true,
                      time: DateTime(
                        0,
                        0,
                        0,
                        initialTime.hour,
                        initialTime.minute,
                      ),
                      onTimeChange: (dateTime) {
                        selectedTime = TimeOfDay(
                          hour: dateTime.hour,
                          minute: dateTime.minute,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          onPress: () => Navigator.pop(context),
                          text: "لغو",
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          onPress: () {
                            Navigator.pop(context);
                            onTimeSelected(selectedTime);
                          },
                          text: "تایید",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
