import 'dart:math';

class Bingo {
  final _greeting = "Let's play Bingo!";
  final _farewell = "The End!";
  int _numberOfNumbers = 5; // how many numbers in pool? default 75

  late final String _prev0; // current bingo number
  late final String _prev1; // last bingo number
  late final String _prev2; // second-to-last bingo number

  late final List<int> _numbers;
  final int _index;
  final bool _connected;

  get prev0 => _prev0;
  get prev1 => _prev1;
  get prev2 => _prev2;
  get numbers => _numbers;
  get index => _index;
  get connected => _connected;

  List<int> generateRandomList() {
    List<int> numbers = List.generate(_numberOfNumbers, (int index) => index);

    // randomize list using Fisher-Yates Shuffle
    int i = numbers.length;
    int j = 0;
    while (i > 0) {
      i = i - 1;
      j = (Random().nextDouble() * (i + 1)).toInt();
      int temp = numbers[j];
      numbers[j] = numbers[i];
      numbers[i] = temp;
    }

    return numbers;
  }

  Bingo({
    int index = -1,
    List<int>? numbers,
    bool connected = false,
  }) : _index = index,
        _connected = connected {
    if (numbers == null || numbers.isEmpty) { // if numbers to be generated
      _numbers = generateRandomList();
      _numbers.add(-1);
    } else { // to ensure we have the right quantity for indexing
      _numberOfNumbers = _numbers.length;
    }

    // set the initial values to be read
    _prev0 = (arrayHasIndex(_index)) ? intToBingo(_numbers[_index]) : _greeting;
    _prev1 = (arrayHasIndex(_index - 1)) ? intToBingo(_numbers[_index - 1]) : "";
    _prev2 = (arrayHasIndex(_index - 2)) ? intToBingo(_numbers[_index - 2]) : "";
  }

  copyWith({
    final int? index,
    final bool? connected,
    final bool? pairing,
  }) {
    if (index != null && indexIsValid(index)) {
      return Bingo(
        index: index,
        numbers: _numbers,
        connected: connected ?? _connected,
      );
    } else {
      return Bingo(
        index: _index,
        numbers: numbers,
        connected: connected ?? _connected,
      );
    }
  }

  // for database upload preparation
  Map<String, dynamic> asSimpleJson() {
    return {
      "index": _index,
      "numbers": _numbers,
      "connected": _connected,
    };
  }

  // check if is an actual index
  bool arrayHasIndex(int index) {
    return index >= 0 && index < _numbers.length;
  }

  // check if is a valid index or -1 (meaning game not started)
  bool indexIsValid(int index) {
    return arrayHasIndex(index) || index == -1;
  }

  // convert integer to bingo letter (e.g. 0 -> B1)
  String intToBingo(int number) {
    List<String> bingoColumns = ["B", "I", "N", "G", "O", "F", "L", "I", "C", "K", "R", "U", "S", "H", "X", "E", "P", "T", "Q", "M", "A", "D", "J", "Z", "Y", "W"];
    String newText = "";
    int range = number ~/ 15;
    newText = (number == -1) ? _farewell : "${bingoColumns[range]} ${number + 1}";
    return newText;
  }
}