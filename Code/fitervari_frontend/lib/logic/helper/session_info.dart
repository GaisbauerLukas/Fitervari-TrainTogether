class SessionInfo {
  static final SessionInfo _singleton = SessionInfo._internal();

  factory SessionInfo() {
    return _singleton;
  }

  SessionInfo._internal();

  double actionBarHeight;
}