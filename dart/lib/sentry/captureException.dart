import 'package:sentry/sentry.dart';

Future<void> captureException(Object exception, StackTrace stackTrace) async {
  if (exception.toString().contains("API:")) return;
  await Sentry.captureException(
    exception,
    stackTrace: stackTrace,
  );
}
