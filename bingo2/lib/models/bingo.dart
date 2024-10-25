import 'dart:math';

class Bingo {
  final _greeting = "Let's play Bingo!";
  final _farewell = "The End!";
  int _numberOfNumbers = 5;

  late final String _prev0;
  late final String _prev1;
  late final String _prev2;
  final List<int> _numbers;
  final int _index;

  get prev0 => _prev0;
  get prev1 => _prev1;
  get prev2 => _prev2;
  get numbers => _numbers;
  get index => _index;
  get playable => _numbers.length > 1;

  Bingo({
    int index = -1,
    List<int>? numbers,
    bool startEmpty = false,
  }) : _index = index, _numbers = numbers ?? [] {
    if (_numbers.isEmpty) {
      for (int i = 0; i < _numberOfNumbers; i++) {
        _numbers.add(i);
      }
      int i = _numbers.length;
      int j = 0;
      while (i > 0) {
        i = i - 1;
        j = (Random().nextDouble() * (i + 1)).toInt();
        int temp = _numbers[j];
        _numbers[j] = _numbers[i];
        _numbers[i] = temp;
      }
      _numbers.add(-1);
    } else {
      _numberOfNumbers = _numbers.length;
    }

    if (!startEmpty) {
      _prev0 =
          (arrayHasIndex(_index)) ? intToBingo(_numbers[_index]) : _greeting;
      _prev1 =
          (arrayHasIndex(_index - 1)) ? intToBingo(_numbers[_index - 1]) : "";
      _prev2 =
          (arrayHasIndex(_index - 2)) ? intToBingo(_numbers[_index - 2]) : "";
    } else {
      _prev0 = "";
      _prev1 = "";
      _prev2 = "";
    }
  }

  copyWith(final int? index) {
    if (index != null && indexIsValid(index)) {
      return Bingo(
        index: index,
        numbers: _numbers,
      );
    } else {
      return Bingo(
        index: this.index,
        numbers: numbers,
      );
    }
  }

  Bingo markUnplayable() {
    return Bingo(
        index: -1,
        numbers: [-1],
    );
  }

  Map<String, dynamic> asSimpleJson() {
    return {
      "index": index,
      "numbers": numbers,
    };
  }

  bool arrayHasIndex(int index) {
    return index >= 0 && index < _numbers.length;
  }

  bool indexIsValid(int index) {
    return arrayHasIndex(index) || index == -1;
  }

  String intToBingo(int number) {
    List<String> bingoColumns = ["B", "I", "N", "G", "O", "F", "L", "I", "C", "K", "R", "U", "S", "H", "X", "E", "P", "T", "Q", "M", "A", "D", "J", "Z", "Y", "W"];
    String newText = "";
    int range = number ~/ 15;
    newText = (number == -1) ? _farewell : "${bingoColumns[range]} ${number + 1}";
    return newText;
  }
}