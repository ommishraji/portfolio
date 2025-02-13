
import 'base.dart';

class OtherApiException extends ApiException {
  OtherApiException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
    required super.exception,
  });
}
