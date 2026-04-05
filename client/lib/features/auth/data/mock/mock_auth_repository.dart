class MockAuthRepository {
  const MockAuthRepository();

  Future<void> fakeDelay() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
  }
}
