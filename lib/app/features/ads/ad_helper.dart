import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId => 'ca-app-pub-3312835192770188/1968950611';
  Future<InitializationStatus> initGoogleMobileAds() {
    RequestConfiguration configuration = RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
      testDeviceIds: <String>['A6D8C3632DDF7E28C012DDE63E1D254C'],
    );
    return MobileAds.instance.initialize().then((value) {
      MobileAds.instance.updateRequestConfiguration(configuration);
      return value;
    });
  }
}
