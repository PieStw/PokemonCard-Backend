import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:fitdesk/api/hello.dart';

void main() async {
  /// The Runtime is a singleton. You can define the handlers as you wish..
  Runtime()
    ..registerHandler<AwsApiGatewayEvent>("main.hello", hello)
    // ..registerHandler<AwsApiGatewayEvent>(
    //     "main.patchAccountTypeUser", patchAccountTypeUser)
    ..invoke();
  // await Sentry.init((options) {
  //   options.dsn =
  //       '';
  //   options.tracesSampleRate = 1.0;
  // });
  //
}
