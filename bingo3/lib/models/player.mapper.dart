// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player.dart';

class PlayerMapper extends ClassMapperBase<Player> {
  PlayerMapper._();

  static PlayerMapper? _instance;
  static PlayerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerMapper._());
      WinMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Player';

  static String _$name(Player v) => v.name;
  static const Field<Player, String> _f$name = Field('name', _$name);
  static List<String> _$aliases(Player v) => v.aliases;
  static const Field<Player, List<String>> _f$aliases =
      Field('aliases', _$aliases);
  static List<DateTime> _$attended(Player v) => v.attended;
  static const Field<Player, List<DateTime>> _f$attended =
      Field('attended', _$attended);
  static List<Win> _$wins(Player v) => v.wins;
  static const Field<Player, List<Win>> _f$wins = Field('wins', _$wins);

  @override
  final MappableFields<Player> fields = const {
    #name: _f$name,
    #aliases: _f$aliases,
    #attended: _f$attended,
    #wins: _f$wins,
  };

  static Player _instantiate(DecodingData data) {
    return Player(
        name: data.dec(_f$name),
        aliases: data.dec(_f$aliases),
        attended: data.dec(_f$attended),
        wins: data.dec(_f$wins));
  }

  @override
  final Function instantiate = _instantiate;

  static Player fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Player>(map);
  }

  static Player fromJson(String json) {
    return ensureInitialized().decodeJson<Player>(json);
  }
}

mixin PlayerMappable {
  String toJson() {
    return PlayerMapper.ensureInitialized().encodeJson<Player>(this as Player);
  }

  Map<String, dynamic> toMap() {
    return PlayerMapper.ensureInitialized().encodeMap<Player>(this as Player);
  }

  PlayerCopyWith<Player, Player, Player> get copyWith =>
      _PlayerCopyWithImpl(this as Player, $identity, $identity);
  @override
  String toString() {
    return PlayerMapper.ensureInitialized().stringifyValue(this as Player);
  }

  @override
  bool operator ==(Object other) {
    return PlayerMapper.ensureInitialized().equalsValue(this as Player, other);
  }

  @override
  int get hashCode {
    return PlayerMapper.ensureInitialized().hashValue(this as Player);
  }
}

extension PlayerValueCopy<$R, $Out> on ObjectCopyWith<$R, Player, $Out> {
  PlayerCopyWith<$R, Player, $Out> get $asPlayer =>
      $base.as((v, t, t2) => _PlayerCopyWithImpl(v, t, t2));
}

abstract class PlayerCopyWith<$R, $In extends Player, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get aliases;
  ListCopyWith<$R, DateTime, ObjectCopyWith<$R, DateTime, DateTime>>
      get attended;
  ListCopyWith<$R, Win, WinCopyWith<$R, Win, Win>> get wins;
  $R call(
      {String? name,
      List<String>? aliases,
      List<DateTime>? attended,
      List<Win>? wins});
  PlayerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PlayerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Player, $Out>
    implements PlayerCopyWith<$R, Player, $Out> {
  _PlayerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Player> $mapper = PlayerMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get aliases =>
      ListCopyWith($value.aliases, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(aliases: v));
  @override
  ListCopyWith<$R, DateTime, ObjectCopyWith<$R, DateTime, DateTime>>
      get attended => ListCopyWith($value.attended,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(attended: v));
  @override
  ListCopyWith<$R, Win, WinCopyWith<$R, Win, Win>> get wins => ListCopyWith(
      $value.wins, (v, t) => v.copyWith.$chain(t), (v) => call(wins: v));
  @override
  $R call(
          {String? name,
          List<String>? aliases,
          List<DateTime>? attended,
          List<Win>? wins}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (aliases != null) #aliases: aliases,
        if (attended != null) #attended: attended,
        if (wins != null) #wins: wins
      }));
  @override
  Player $make(CopyWithData data) => Player(
      name: data.get(#name, or: $value.name),
      aliases: data.get(#aliases, or: $value.aliases),
      attended: data.get(#attended, or: $value.attended),
      wins: data.get(#wins, or: $value.wins));

  @override
  PlayerCopyWith<$R2, Player, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PlayerCopyWithImpl($value, $cast, t);
}
