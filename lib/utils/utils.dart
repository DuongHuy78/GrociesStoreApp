class Utils {

  static bool isCorrectEmail(String email) {
    /**
    * ký tự "r" là raw string các ký tự đặc biệt /n, ... sẽ ko đc xử lý mà sẽ giữ nguyên
    * Kiểm tra email có domain gmail và ít nhất 2 ký tự phía trước "@"
    * Pattern giải thích:
    *  ^                       : bắt đầu chuỗi
    *  [A-Za-z0-9._%+-]{2,}    : ít nhất 2 ký tự hợp lệ trước '@' (chữ, số, . _ % + -)
    *  @gmail\.com             : phần domain chính xác là gmail.com
    *  $                       : kết thúc chuỗi
    */
    final String pattern = r'^[A-Za-z0-9]{2,}@gmail\.com$';
    return RegExp(pattern, caseSensitive: false).hasMatch(email);
  }

  static bool isCorrectPassWord(String password) {
     //  (?=.*[A-Z])            : lookahead bắt buộc có ít nhất 1 chữ hoa
    //  (?=.*[a-z])            : lookahead bắt buộc có ít nhất 1 chữ thường
    //  (?=.*\d)               : lookahead bắt buộc có ít nhất 1 chữ số
    //  \S{6,}                 : tổng ít nhất 6 ký tự KHÔNG phải whitespace (no spaces)
    //  ^ ... $                : bắt đầu và kết thúc chuỗi (validate toàn bộ chuỗi)
    //
    // Quan trọng:
    //  - KHÔNG đặt caseSensitive: false cho pattern này, vì nếu caseInsensitive thì
    //    [A-Z] sẽ khớp cả chữ thường và kiểm tra chữ hoa sẽ mất ý nghĩa.
    final String pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)\S{6,}$';
    return RegExp(pattern).hasMatch(password);
  }

  static bool isCorrectUserName(String value) {
    final String pattern = r'^\S{6,}$';
    return RegExp(pattern).hasMatch(value);
  }

  static bool isCorrectFirstName(String value) {
    return value.isNotEmpty;
  }

  static bool isCorrectLastName(String value) {
    return value.isNotEmpty;
  }
}