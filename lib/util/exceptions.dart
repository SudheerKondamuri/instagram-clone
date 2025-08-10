class Exceptions implements Exception {
  final String message;
  Exceptions(this.message);

  @override
  String toString() => message;
}
