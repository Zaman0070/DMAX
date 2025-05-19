import 'package:dmax_app/commons/common_imports/common_libs.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'ERROR HERE',
          style: getBoldStyle(
              fontSize: 17, color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
