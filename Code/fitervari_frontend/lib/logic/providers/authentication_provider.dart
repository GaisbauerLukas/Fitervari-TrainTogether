import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

const AUTH0_DOMAIN = 'fitervari.me:8180/auth/realms/Fitervari';
const AUTH0_CLIENT_ID = 'frontend';

const AUTH0_REDIRECT_URI = 'localhost:4200';
const AUTH0_ISSUER = 'http://$AUTH0_DOMAIN';

class AuthenticationProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  TokenResponse _token;

  Future<String> get token async {
    if (_token == null ||
        _token.expiresAt.compareTo(DateTime.now()) < 1 && _isLoggedIn) {
      await refreshToken();
    }
    return _token?.accessToken;
  }

  bool get isLoggedIn => _isLoggedIn;

  var uri = Uri.parse('http://' + AUTH0_DOMAIN);
  var clientId = AUTH0_CLIENT_ID;
    var scopes = List<String>.of(['openid', 'profile']);
  var port = 4200;

  Future<Issuer> get issuer async => await Issuer.discover(uri);

  Future<Client> get client async => new Client(await issuer, clientId);

  Future<UserInfo> get userInfo async => _credentialVariable.getUserInfo();

  Authenticator _authenticatorVariable;
  Credential _credentialVariable;

  // Future<Credential> get _credential async {
  //   if (_credentialVariable != null) return _credentialVariable;
  //   _credentialVariable = await (await _authenticator).authorize();
  //   return _credentialVariable;
  // }
  //
  // Future<Authenticator> get _authenticator async {
  //   if (_authenticatorVariable != null) return _authenticatorVariable;
  //   return new Authenticator(
  //     await client,
  //     scopes: scopes,
  //     port: port,
  //     urlLancher: urlLauncher,
  //   );
  // }

  Future urlLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future urlLauncherBackground(String url) async {
    if (await canLaunch(url)) {
      await http.get(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<bool> refreshToken() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken== null || storedRefreshToken == "")
      return Future.value(false);

    try {
      _credentialVariable = (await client).createCredential(
        accessToken: null,
        tokenType: await secureStorage.read(key: "tokenType"),
        refreshToken: await secureStorage.read(key: "refresh_token"),
        idToken: await secureStorage.read(key: "idToken"),
      );

      _credentialVariable.validateToken(
          validateClaims: true, validateExpiry: true);
      var token = await _credentialVariable.getTokenResponse();
      await _saveToken(token);
      _token = token;
      _isLoggedIn = true;
      return Future.value(true);
    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      await logoutAction();
      return Future.value(false);
    }
  }

  Future<bool> loginAction() async {
    try {
      _authenticatorVariable = new Authenticator(
        await client,
        scopes: scopes,
        port: port,
        urlLancher: urlLauncher,
      );
      //if there is a "you can now close this window page" delete it in openid_client_id line 61
      _credentialVariable =
          await _authenticatorVariable.authorize().then((value) {
        _authenticatorVariable.cancel();
        return value;
      });

      closeWebView();

      var token = await _credentialVariable.getTokenResponse();
      _token = token;
      print(token);
      await _saveToken(token);
      _isLoggedIn = true;
      return Future.value(true);
    } catch (e) {
      print(e.toString());
      await logoutAction();
      return Future.value(false);
    }
  }

  Future<bool> logoutAction() async {
    try {
      var url = _credentialVariable.generateLogoutUrl();
      await urlLauncherBackground(url.toString());
      _token = null;
      _credentialVariable = null;
      _authenticatorVariable = null;
      _isLoggedIn = false;
      await _clearToken();
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    } finally {
      //notifyListeners();
    }
  }

  Future _saveToken(TokenResponse tokenResponse) async {
    await secureStorage.write(
        key: 'access_token', value: tokenResponse.accessToken);
    await secureStorage.write(
        key: 'refresh_token', value: tokenResponse.refreshToken);
    await secureStorage.write(key: 'tokenType', value: tokenResponse.tokenType);
    await secureStorage.write(
        key: 'idToken', value: tokenResponse.idToken.toCompactSerialization());
  }

  Future _clearToken() async {
    await secureStorage.write(key: 'access_token', value: "");
    await secureStorage.write(key: 'refresh_token', value: "");
    await secureStorage.write(key: 'tokenType', value: "");
    await secureStorage.write(key: 'idToken', value: "");
  }
}
