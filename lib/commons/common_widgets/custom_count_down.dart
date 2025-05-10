import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'dart:async';

class CustomCountdown extends StatefulWidget {
  final DateTime endTime;
  final Function? onEnd;

  const CustomCountdown({
    super.key,
    required this.endTime,
    this.onEnd,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomCountdownState createState() => _CustomCountdownState();
}

class _CustomCountdownState extends State<CustomCountdown> {
  late Timer _timer;
  late Duration _timeRemaining;

  @override
  void initState() {
    super.initState();
    _timeRemaining = widget.endTime.difference(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeRemaining = widget.endTime.difference(DateTime.now());

        if (_timeRemaining.isNegative) {
          _timer.cancel();
          if (widget.onEnd != null) {
            widget.onEnd!();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day',
              style: getRegularStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
            Text(
              twoDigits(days),
              style: getMediumStyle(
                  color: context.blackColor, fontSize: MyFonts.size40),
            ),
          ],
        ),
        padding16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hours',
              style: getRegularStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
            Text(
              twoDigits(hours),
              style: getMediumStyle(
                  color: context.blackColor, fontSize: MyFonts.size40),
            ),
          ],
        ),
        padding16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Minutes',
              style: getRegularStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
            Text(
              twoDigits(minutes),
              style: getMediumStyle(
                  color: context.blackColor, fontSize: MyFonts.size40),
            ),
          ],
        ),
        padding16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Secs',
              style: getRegularStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
            Text(
              twoDigits(seconds),
              style: getMediumStyle(
                  color: context.blackColor, fontSize: MyFonts.size40),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _formatTime(_timeRemaining);
  }
}
