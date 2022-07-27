abstract class Endpoint {
  Uri createUri();

  String createUrl() {
    final uri = createUri();

    return uri.toString();
  }
}
