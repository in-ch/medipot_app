class EmailValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
  );
  static final Set<String> _invalidDomains = {'privaterelay.appleid.com'};

  /// 이메일 주소의 유효성을 검사합니다.
  /// [email] 이메일 주소 문자열
  /// 반환값: 이메일 주소가 유효하면 true, 그렇지 않으면 false
  static bool isValidEmail(String email) {
    // 이메일 형식 검증
    if (!_emailRegExp.hasMatch(email)) {
      return false;
    }
    final domain = email.split('@').last;
    if (_invalidDomains.contains(domain)) {
      return false;
    }
    return true;
  }
}
