library xdart;

extension xString on String {
  ///Check if the string is null or empty, with a parameter to check if the string is equal to "null" ignoring case
  bool isNullOrEmpty({bool checkNullWord = false}) =>
      this == null || this.isEmpty || checkNullWord && this.toLowerCase().trim() == "null";

  ///Check if the string, empty or equals to the "null" ignoring case
  bool isNullOrWhiteSpaces({bool checkNullWord = false}) => this?.trim()?.isNullOrEmpty(checkNullWord: checkNullWord) != false;
}

extension xInt on int {
  ///Transform an int value to its hex value in string
  String toHex([bool withPrefix]) => withPrefix ? "0x${this.toRadixString(16)}" : this.toRadixString(16);
}

extension xNumIterable<T extends num> on Iterable<T> {
  ///Sum all elements in this collection
  T total() => this.sum((e) => e);

  ///Return the average of all elements in this collection
  double average() => total() / this.length.toDouble();

  T max() {
    T biggest;
    for (var item in this) {
      if (biggest == null || biggest < item) biggest = item;
    }
    return biggest;
  }

  T min() {
    T smallest;
    for (var item in this) {
      if (smallest == null || smallest > item) smallest = item;
    }
    return smallest;
  }
}

extension xIterable<T> on Iterable<T> {
  ///Returns a map collection groupint this collection by given rule
  Map<KEY, List<T>> groupBy<KEY>(KEY getKey(T element)) {
    var res = Map<KEY, List<T>>();

    this.forEach((item) => res.putIfAbsent(getKey(item), () => List<T>()).add(item));

    return res;
  }

  ///Sum all itens by given rule
  N sum<N extends num>(N getValue(T element)) => this.fold<num>(0, (value, item) => value + getValue(item));

  ///Count the amount of elements that respect given rule
  int count(bool expression(T element)) {
    int res = 0;
    this.forEach((f) {
      if (expression(f)) res++;
    });
    return res;
  }
}
