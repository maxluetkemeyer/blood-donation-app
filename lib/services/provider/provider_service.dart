import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'providers.dart';

class ProviderService {
  //Singleton
  static final ProviderService _instance = ProviderService._private();
  factory ProviderService() => _instance;
  ProviderService._private() {
    print("Starting Settings Service");
  }

  ProviderContainer container = ProviderContainer();
}
