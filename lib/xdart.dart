library xdart;

extension xDart on String {
  bool isNullOrEmpty({bool checkNullWord = false}) => this == null || this.isEmpty || checkNullWord && this.toLowerCase().trim() == "null" ;
  bool isNullOrWhiteSpaces({bool checkNullWord = false}) => this?.trim()?.isNullOrEmpty(checkNullWord: checkNullWord) != false;
}