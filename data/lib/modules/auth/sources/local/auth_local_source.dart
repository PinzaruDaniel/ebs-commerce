abstract class AuthLocalSource{
  Future<void> getRefreshToken();
  Future<void> insertAccessToken();
}