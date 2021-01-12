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
      Uri.parse('http://10.0.2.2:8180/auth/realms/Fitervari/.well-known/openid-configuration');

  final identifier = 'frontend';
  final secret = 'dec90166-409e-4839-a75d-339cea447e2c';

  Client client;

  void login(String username, String password) async {
    this.client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier, secret: secret);
    print("adsjflajfda" + this.client.toString());
  }
}
