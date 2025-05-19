import 'package:intl/intl.dart';

import '../commons/common_imports/common_libs.dart';




Widget spacer({double height = 16}) {
  return SizedBox(
    height: height,
  );
}

DateTime getDateTimeFromUnix(int dt) =>
    DateTime.fromMillisecondsSinceEpoch(dt * 1000);

String getTimeInHour(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final hour = DateFormat('hh a').format(curDt);
  return hour;
}

String getTimeInHHMM(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final hour = DateFormat('hh:mm a').format(curDt);
  return hour;
}

String getDayFromEpoch(int dt) {
  final curDt = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  final day = DateFormat('EEEE').format(curDt);
  return day;
}



class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key, this.message = "Something went wrong !"});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: getMediumStyle(fontSize: 12.spMin,color:Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({super.key, this.message = "No Records"});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style:  getMediumStyle(fontSize: 12.spMin, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
