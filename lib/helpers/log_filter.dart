import 'package:logger/logger.dart';

class AlwaysLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
