import 'dart:io';
import 'package:aws_dynamodb_api/dynamodb-2012-08-10.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';
import 'package:aws_lambda_dart_runtime/runtime/context.dart';
import '../../sentry/captureException.dart';
import 'package:aws_ses_api/email-2010-12-01.dart';

Future<AwsApiGatewayResponse> hello(
    Context context, AwsApiGatewayEvent event) async {
  try {

    return AwsApiGatewayResponse.fromJson(
      {
        "content": {"message": "Hello from AWS Lambda Dart Runtime!"}
      },
      headers: {"Access-Control-Allow-Origin": "*"},
    );
  } catch (error, stackTrace) {
    await captureException(error, stackTrace);
    return AwsApiGatewayResponse.fromJson(
      {
        "content": {
          "error": error.toString(),
          "stackTrace": stackTrace.toString()
        }
      },
      statusCode: HttpStatus.internalServerError,
      headers: {"Access-Control-Allow-Origin": "*"},
    );
  }
}

