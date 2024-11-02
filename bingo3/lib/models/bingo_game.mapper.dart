// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bingo_game.dart';

class BingoGameMapper extends ClassMapperBase<BingoGame> {
  BingoGameMapper._();

  static BingoGameMapper? _instance;
  static BingoGameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BingoGameMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BingoGame';

  static List<int> _$knockCode(BingoGame v) => v.knockCode;
  static const Field<BingoGame, List<int>> _f$knockCode =
      Field('knockCode', _$knockCode);
  static List<int> _$numbers(BingoGame v) => v.numbers;
  static const Field<BingoGame, List<int>> _f$numbers =
      Field('numbers', _$numbers, opt: true);
  static int _$index(BingoGame v) => v.index;
  static const Field<BingoGame, int> _f$index = Field('index', _$index);
  static bool _$pairing(BingoGame v) => v.pairing;
  static const Field<BingoGame, bool> _f$pairing =
      Field('pairing', _$pairing, opt: true, def: false);
  static bool _$connected(BingoGame v) => v.connected;
  static const Field<BingoGame, bool> _f$connected =
      Field('connected', _$connected);
  static int _$startingSeed(BingoGame v) => v.startingSeed;
  static const Field<BingoGame, int> _f$startingSeed =
      Field('startingSeed', _$startingSeed);
  static int _$priority(BingoGame v) => v.priority;
  static const Field<BingoGame, int> _f$priority =
      Field('priority', _$priority, opt: true, def: 0);
  static int _$numberOfNumbers(BingoGame v) => v.numberOfNumbers;
  static const Field<BingoGame, int> _f$numberOfNumbers =
      Field('numberOfNumbers', _$numberOfNumbers, mode: FieldMode.member);
  static String _$prev0(BingoGame v) => v.prev0;
  static const Field<BingoGame, String> _f$prev0 =
      Field('prev0', _$prev0, mode: FieldMode.member);
  static String _$prev1(BingoGame v) => v.prev1;
  static const Field<BingoGame, String> _f$prev1 =
      Field('prev1', _$prev1, mode: FieldMode.member);
  static String _$prev2(BingoGame v) => v.prev2;
  static const Field<BingoGame, String> _f$prev2 =
      Field('prev2', _$prev2, mode: FieldMode.member);

  @override
  final MappableFields<BingoGame> fields = const {
    #knockCode: _f$knockCode,
    #numbers: _f$numbers,
    #index: _f$index,
    #pairing: _f$pairing,
    #connected: _f$connected,
    #startingSeed: _f$startingSeed,
    #priority: _f$priority,
    #numberOfNumbers: _f$numberOfNumbers,
    #prev0: _f$prev0,
    #prev1: _f$prev1,
    #prev2: _f$prev2,
  };

  static BingoGame _instantiate(DecodingData data) {
    return BingoGame.minimal(
        knockCode: data.dec(_f$knockCode),
        numbers: data.dec(_f$numbers),
        index: data.dec(_f$index),
        pairing: data.dec(_f$pairing),
        connected: data.dec(_f$connected),
        startingSeed: data.dec(_f$startingSeed),
        priority: data.dec(_f$priority));
  }

  @override
  final Function instantiate = _instantiate;

  static BingoGame fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BingoGame>(map);
  }

  static BingoGame fromJson(String json) {
    return ensureInitialized().decodeJson<BingoGame>(json);
  }
}

mixin BingoGameMappable {
  String toJson() {
    return BingoGameMapper.ensureInitialized()
        .encodeJson<BingoGame>(this as BingoGame);
  }

  Map<String, dynamic> toMap() {
    return BingoGameMapper.ensureInitialized()
        .encodeMap<BingoGame>(this as BingoGame);
  }

  BingoGameCopyWith<BingoGame, BingoGame, BingoGame> get copyWith =>
      _BingoGameCopyWithImpl(this as BingoGame, $identity, $identity);
  @override
  String toString() {
    return BingoGameMapper.ensureInitialized()
        .stringifyValue(this as BingoGame);
  }

  @override
  bool operator ==(Object other) {
    return BingoGameMapper.ensureInitialized()
        .equalsValue(this as BingoGame, other);
  }

  @override
  int get hashCode {
    return BingoGameMapper.ensureInitialized().hashValue(this as BingoGame);
  }
}

extension BingoGameValueCopy<$R, $Out> on ObjectCopyWith<$R, BingoGame, $Out> {
  BingoGameCopyWith<$R, BingoGame, $Out> get $asBingoGame =>
      $base.as((v, t, t2) => _BingoGameCopyWithImpl(v, t, t2));
}

abstract class BingoGameCopyWith<$R, $In extends BingoGame, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get knockCode;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get numbers;
  $R call(
      {List<int>? knockCode,
      List<int>? numbers,
      int? index,
      bool? pairing,
      bool? connected,
      int? startingSeed,
      int? priority});
  BingoGameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BingoGameCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BingoGame, $Out>
    implements BingoGameCopyWith<$R, BingoGame, $Out> {
  _BingoGameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BingoGame> $mapper =
      BingoGameMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get knockCode =>
      ListCopyWith($value.knockCode, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(knockCode: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get numbers =>
      ListCopyWith($value.numbers, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(numbers: v));
  @override
  $R call(
          {List<int>? knockCode,
          Object? numbers = $none,
          int? index,
          bool? pairing,
          bool? connected,
          int? startingSeed,
          int? priority}) =>
      $apply(FieldCopyWithData({
        if (knockCode != null) #knockCode: knockCode,
        if (numbers != $none) #numbers: numbers,
        if (index != null) #index: index,
        if (pairing != null) #pairing: pairing,
        if (connected != null) #connected: connected,
        if (startingSeed != null) #startingSeed: startingSeed,
        if (priority != null) #priority: priority
      }));
  @override
  BingoGame $make(CopyWithData data) => BingoGame.minimal(
      knockCode: data.get(#knockCode, or: $value.knockCode),
      numbers: data.get(#numbers, or: $value.numbers),
      index: data.get(#index, or: $value.index),
      pairing: data.get(#pairing, or: $value.pairing),
      connected: data.get(#connected, or: $value.connected),
      startingSeed: data.get(#startingSeed, or: $value.startingSeed),
      priority: data.get(#priority, or: $value.priority));

  @override
  BingoGameCopyWith<$R2, BingoGame, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BingoGameCopyWithImpl($value, $cast, t);
}
