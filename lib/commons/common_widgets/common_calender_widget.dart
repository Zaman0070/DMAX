// import 'package:dmax_app/commons/common_imports/apis_commons.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/features/user/checklish/widgets/u_checklist_card.dart';
// import 'package:table_calendar/table_calendar.dart';

// class CommonCalenderWidget extends ConsumerStatefulWidget {
//   final int? initialDate;
//   const CommonCalenderWidget({super.key, this.initialDate = 0});

//   @override
//   ConsumerState<CommonCalenderWidget> createState() =>
//       _CommonCalenderWidgetState();
// }

// class _CommonCalenderWidgetState extends ConsumerState<CommonCalenderWidget> {
//   CalendarFormat _calendarFormat = CalendarFormat.week;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   // Map<DateTime, List> _eventsList = {};

//   int getHashCode(DateTime key) {
//     return key.day * 1000000 + key.month * 10000 + key.year;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
//       // final watchAllTaskProvider = ref.watch(watchAllTaskInProgressProvider);
//       //  watchAllTaskProvider.when(data: (data) {
//       // _eventsList = {
//       //   for (var task in data)
//       //     DateTime.parse(task.due!.date!): [
//       //       task.content,
//       //     ]
//       // };
//       // final events = LinkedHashMap<DateTime, List>(
//       //   equals: isSameDay,
//       //   hashCode: getHashCode,
//       // )..addAll(_eventsList);

//       // List getEventForDay(DateTime day) {
//       //   return events[day] ?? [];
//       // }

//       return Column(
//         children: [
//           TableCalendar(
//             rowHeight: 75.h,
//             headerStyle: HeaderStyle(
//               formatButtonVisible: false,
//               titleCentered: true,
//               titleTextStyle: getBoldStyle(
//                   color: context.blackColor, fontSize: MyFonts.size18),
//               leftChevronIcon: Icon(
//                 Icons.chevron_left,
//                 color: context.bodyTextColor,
//               ),
//               rightChevronIcon: Icon(
//                 Icons.chevron_right,
//                 color: context.bodyTextColor,
//               ),
//             ),
//             calendarStyle: CalendarStyle(
//               todayDecoration: BoxDecoration(
//                 color: context.primary,
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: context.primary,
//                 shape: BoxShape.circle,
//               ),
//               todayTextStyle:
//                   getBoldStyle(color: MyColors.white, fontSize: MyFonts.size24),
//             ),
//             firstDay: DateTime.utc(2021, 1, 1),
//             lastDay: DateTime.utc(2025, 12, 31),
//             daysOfWeekStyle: DaysOfWeekStyle(
//               weekdayStyle: getMediumStyle(
//                   color: context.bodyTextColor.withOpacity(0.7),
//                   fontSize: MyFonts.size16),
//               weekendStyle: getMediumStyle(
//                   color: context.bodyTextColor.withOpacity(0.7),
//                   fontSize: MyFonts.size16),
//             ),
//             focusedDay: _focusedDay,
//             // eventLoader: getEventForDay,
//             calendarFormat: _calendarFormat,
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             selectedDayPredicate: (day) {
//               return isSameDay(_selectedDay, day);
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               if (!isSameDay(_selectedDay, selectedDay)) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           ListView(
//             shrinkWrap: true,
//             // children: getEventForDay(_selectedDay!)
//             //     .map((event) => ListTile(
//             //           title: Text(event.toString()),
//             //         ))
//             //     .toList(),
//             children: const [
//               UChecklistCard(),
//             ],
//           )
//         ],
//       );
//       // }, error: (e, s) {
//       //   return ShimmerWidget(
//       //     highlightColor: context.primary.withOpacity(0.5),
//       //     width: double.infinity,
//       //     height: 200,
//       //   );
//       // }, loading: () {
//       //   return ShimmerWidget(
//       //     highlightColor: context.primary.withOpacity(0.5),
//       //     width: double.infinity,
//       //     height: 200,
//       //   );
//       // });
//     });
//   }
// }
