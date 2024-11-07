// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'win.dart';

class WinMapper extends ClassMapperBase<Win> {
  WinMapper._();

  static WinMapper? _instance;
  static WinMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WinMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Win';

  static DateTime _$date(Win v) => v.date;
  static const Field<Win, DateTime> _f$date = Field('date', _$date);
  static String? _$winType(Win v) => v.winType;
  static const Field<Win, String> _f$winType =
      Field('winType', _$winType, opt: true);
  static List<int>? _$bingoSquares(Win v) => v.bingoSquares;
  static const Field<Win, List<int>> _f$bingoSquares =
      Field('bingoSquares', _$bingoSquares, opt: true);
  static int? _$roundNumber(Win v) => v.roundNumber;
  static const Field<Win, int> _f$roundNumber =
      Field('roundNumber', _$roundNumber, opt: true);

  @override
  final MappableFields<Win> fields = const {
    #date: _f$date,
    #winType: _f$winType,
    #bingoSquares: _f$bingoSquares,
    #roundNumber: _f$roundNumber,
  };

  static Win _instantiate(DecodingData data) {
    return Win(
        date: data.dec(_f$date),
        winType: data.dec(_f$winType),
        bingoSquares: data.dec(_f$bingoSquares),
        roundNumber: data.dec(_f$roundNumber));
  }

  @override
  final Function instantiate = _instantiate;

  static Win fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Win>(map);
  }

  static Win fromJson(String json) {
    return ensureInitialized().decodeJson<Win>(json);
  }
}

mixin WinMappable {
  String toJson() {
    return WinMapper.ensureInitialized().encodeJson<Win>(this as Win);
  }

  Map<String, dynamic> toMap() {
    return WinMapper.ensureInitialized().encodeMap<Win>(this as Win);
  }

  WinCopyWith<Win, Win, Win> get copyWith =>
      _WinCopyWithImpl(this as Win, $identity, $identity);
  @override
  String toString() {
    return WinMapper.ensureInitialized().stringifyValue(this as Win);
  }

  @override
  bool operator ==(Object other) {
    return WinMapper.ensureInitialized().equalsValue(this as Win, other);
  }

  @override
  int get hashCode {
    return WinMapper.ensureInitialized().hashValue(this as Win);
  }
}

extension WinValueCopy<$R, $Out> on ObjectCopyWith<$R, Win, $Out> {
  WinCopyWith<$R, Win, $Out> get $asWin =>
      $base.as((v, t, t2) => _WinCopyWithImpl(v, t, t2));
}

abstract class WinCopyWith<$R, $In extends Win, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bingoSquares;
  $R call(
      {DateTime? date,
      String? winType,
      List<int>? bingoSquares,
      int? roundNumber});
  WinCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WinCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Win, $Out>
    implements WinCopyWith<$R, Win, $Out> {
  _WinCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Win> $mapper = WinMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>? get bingoSquares =>
      $value.bingoSquares != null
          ? ListCopyWith(
              $value.bingoSquares!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(bingoSquares: v))
          : null;
  @override
  $R call(
          {DateTime? date,
          Object? winType = $none,
          Object? bingoSquares = $none,
          Object? roundNumber = $none}) =>
      $apply(FieldCopyWithData({
        if (date != null) #date: date,
        if (winType != $none) #winType: winType,
        if (bingoSquares != $none) #bingoSquares: bingoSquares,
        if (roundNumber != $none) #roundNumber: roundNumber
      }));
  @override
  Win $make(CopyWithData data) => Win(
      date: data.get(#date, or: $value.date),
      winType: data.get(#winType, or: $value.winType),
      bingoSquares: data.get(#bingoSquares, or: $value.bingoSquares),
      roundNumber: data.get(#roundNumber, or: $value.roundNumber));

  @override
  WinCopyWith<$R2, Win, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WinCopyWithImpl($value, $cast, t);
}
