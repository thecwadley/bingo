// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'caller.dart';

class CallerMapper extends ClassMapperBase<Caller> {
  CallerMapper._();

  static CallerMapper? _instance;
  static CallerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CallerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Caller';

  static String _$email(Caller v) => v.email;
  static const Field<Caller, String> _f$email = Field('email', _$email);
  static List<String> _$leaderboards(Caller v) => v.leaderboards;
  static const Field<Caller, List<String>> _f$leaderboards =
      Field('leaderboards', _$leaderboards);

  @override
  final MappableFields<Caller> fields = const {
    #email: _f$email,
    #leaderboards: _f$leaderboards,
  };

  static Caller _instantiate(DecodingData data) {
    return Caller(
        email: data.dec(_f$email), leaderboards: data.dec(_f$leaderboards));
  }

  @override
  final Function instantiate = _instantiate;

  static Caller fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Caller>(map);
  }

  static Caller fromJson(String json) {
    return ensureInitialized().decodeJson<Caller>(json);
  }
}

mixin CallerMappable {
  String toJson() {
    return CallerMapper.ensureInitialized().encodeJson<Caller>(this as Caller);
  }

  Map<String, dynamic> toMap() {
    return CallerMapper.ensureInitialized().encodeMap<Caller>(this as Caller);
  }

  CallerCopyWith<Caller, Caller, Caller> get copyWith =>
      _CallerCopyWithImpl(this as Caller, $identity, $identity);
  @override
  String toString() {
    return CallerMapper.ensureInitialized().stringifyValue(this as Caller);
  }

  @override
  bool operator ==(Object other) {
    return CallerMapper.ensureInitialized().equalsValue(this as Caller, other);
  }

  @override
  int get hashCode {
    return CallerMapper.ensureInitialized().hashValue(this as Caller);
  }
}

extension CallerValueCopy<$R, $Out> on ObjectCopyWith<$R, Caller, $Out> {
  CallerCopyWith<$R, Caller, $Out> get $asCaller =>
      $base.as((v, t, t2) => _CallerCopyWithImpl(v, t, t2));
}

abstract class CallerCopyWith<$R, $In extends Caller, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get leaderboards;
  $R call({String? email, List<String>? leaderboards});
  CallerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CallerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Caller, $Out>
    implements CallerCopyWith<$R, Caller, $Out> {
  _CallerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Caller> $mapper = CallerMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get leaderboards => ListCopyWith(
          $value.leaderboards,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(leaderboards: v));
  @override
  $R call({String? email, List<String>? leaderboards}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (leaderboards != null) #leaderboards: leaderboards
      }));
  @override
  Caller $make(CopyWithData data) => Caller(
      email: data.get(#email, or: $value.email),
      leaderboards: data.get(#leaderboards, or: $value.leaderboards));

  @override
  CallerCopyWith<$R2, Caller, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CallerCopyWithImpl($value, $cast, t);
}
