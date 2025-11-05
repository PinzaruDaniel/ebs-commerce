import 'package:data/modules/auth/models/local/auth_token_box.dart';
import 'package:objectbox/objectbox.dart';

abstract class AuthLocalSource {
  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<void> insertAccessToken(String accessToken);
  Future<void> insertTokens(String accessToken, String refreshToken);
}

class AuthLocalSourceImpl implements AuthLocalSource {
  Box<AuthTokenBox> authTokenBox;

  AuthLocalSourceImpl({required this.authTokenBox});

  @override
  Future<String?> getAccessToken() async {
    var accessTokens = await authTokenBox.getAllAsync();
    if (accessTokens.isEmpty) return null;
    return accessTokens.last.accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    var refreshTokens = await authTokenBox.getAllAsync();
    if (refreshTokens.isEmpty) return null;
    return refreshTokens.last.refreshToken;
  }

  @override
  Future<void> insertAccessToken(String accessToken) async {
    authTokenBox.putAsync(AuthTokenBox(accessToken: accessToken));
  }
  @override
  Future<void> insertTokens(String accessToken, String refreshToken)async{
    print('auth_local_source $accessToken $refreshToken');
    authTokenBox.putAsync(AuthTokenBox(accessToken: accessToken, refreshToken: refreshToken));
  }
}
