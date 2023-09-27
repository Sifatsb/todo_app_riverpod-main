import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app_riverpod/providers/date_providers.dart';
import 'package:todo_app_riverpod/providers/providers.dart';
import 'package:todo_app_riverpod/utils/utils.dart';

import 'common_text_field.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: 'Date',
            hintText: '$date',
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(context, ref),
              icon: const FaIcon(FontAwesomeIcons.calendar),
            ),
          ),
        ),
        16.horizontalSpacing,
        Expanded(
          child: CommonTextField(
              title: 'Time',
              hintText: Helpers.timeToString(time),
              readOnly: true,
              suffixIcon: IconButton(
                onPressed: () => _selectTime(context, ref),
                icon: const FaIcon(FontAwesomeIcons.clock),
              )),
        ),
      ],
    );
  }
}

void _selectTime(BuildContext context, WidgetRef ref) async {
  final initialTime = ref.read(timeProvider);
  TimeOfDay? pickTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
  );
  if (pickTime != null) {
    ref.read(timeProvider.notifier).state = pickTime;
  }
}


