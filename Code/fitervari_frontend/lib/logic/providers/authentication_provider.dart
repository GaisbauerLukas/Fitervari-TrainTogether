import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:oauth2/oauth2.dart';

class AuthenticationProvider {

  static final AuthenticationProvider _singleton =
      AuthenticationProvider._internal();

  AuthenticationProvider._internal();

  factory AuthenticationProvider() {
    return _singleton;
  }

  final authorizationEndpoint =
      Uri.parse('http://10.0.2.2:8180/auth/realms/Fitervari/protocol/openid-connect/token');

  final identifier = 'frontend';
  final secret = '33a7e74f-37cd-444a-b485-dcdad166c059';

  Client client;

  Future login(String username, String password) async {

    try {
      return this.client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: identifier, secret: secret);
    } catch(e){
      print(e);
    }

  }
}
