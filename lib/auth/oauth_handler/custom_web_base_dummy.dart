import 'package:oauth2_client/interfaces.dart';

export 'custom_web_base_dummy.dart';

class CustomWebBase implements BaseWebAuth {
  @override
  Future<String> authenticate({
    required String callbackUrlScheme,
    required String url,
    required String redirectUrl,
    Map<String, dynamic>? opts,
  }) {
    throw UnimplementedError();
  }
}