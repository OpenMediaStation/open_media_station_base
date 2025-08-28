import 'package:logger/logger.dart';
import 'package:open_media_station_base/helpers/log_filter.dart';

class Logging {
  static Logger logger = Logger(filter: AlwaysLogFilter());
}
