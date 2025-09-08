abstract class BaseUrlHelperCl {
  String get baseUrl;

  Future<void> changeBaseUrl(String url);

  Future<void> openChangeBaseUrlPage();

  Future<void> resetBaseUrl();

  Future<void> switchToUatEnv();
}
