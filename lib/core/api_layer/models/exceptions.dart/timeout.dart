import 'base.dart';

abstract class TimeoutException extends ApiException {
  final Duration timeout;

  TimeoutException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
    required this.timeout,
    super.exception,
  });

  @override
  String toString() {
    return "${super.toString()}TimedOut: ${timeout.inMilliseconds}ms\n";
  }
}

class ConnectionTimeoutException extends TimeoutException {
  ConnectionTimeoutException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
    required super.timeout,
    super.exception,
  });
}

class RequestTimeoutException extends TimeoutException {
  RequestTimeoutException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
    required super.timeout,
    super.exception,
  });
}

class SendTimeoutException extends TimeoutException {
  SendTimeoutException({
    required super.method,
    required super.url,
    required super.data,
    required super.headers,
    required super.timeout,
    super.exception,
  });
}
