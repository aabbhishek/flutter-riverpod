Future<void> addDelay(int seconds) async {
  await Future.delayed(Duration(milliseconds: seconds));
}
