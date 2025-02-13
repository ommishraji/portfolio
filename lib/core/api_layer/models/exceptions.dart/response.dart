import 'base.dart';

class ResponseApiException extends ApiException {
  ResponseApiException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
  });
}
