// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'leaderboard.dart';

class LeaderboardMapper extends ClassMapperBase<Leaderboard> {
  LeaderboardMapper._();

  static LeaderboardMapper? _instance;
  static LeaderboardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LeaderboardMapper._());
      PlayerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Leaderboard';

  static String _$owner(Leaderboard v) => v.owner;
  static const Field<Leaderboard, String> _f$owner = Field('owner', _$owner);
  static List<String> _$hasAccess(Leaderboard v) => v.hasAccess;
  static const Field<Leaderboard, List<String>> _f$hasAccess =
      Field('hasAccess', _$hasAccess);
  static List<Player> _$players(Leaderboard v) => v.players;
  static const Field<Leaderboard, List<Player>> _f$players =
      Field('players', _$players);
  static String _$name(Leaderboard v) => v.name;
  static const Field<Leaderboard, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Leaderboard> fields = const {
    #owner: _f$owner,
    #hasAccess: _f$hasAccess,
    #players: _f$players,
    #name: _f$name,
  };

  static Leaderboard _instantiate(DecodingData data) {
    return Leaderboard(
        owner: data.dec(_f$owner),
        hasAccess: data.dec(_f$hasAccess),
        players: data.dec(_f$players),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Leaderboard fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Leaderboard>(map);
  }

  static Leaderboard fromJson(String json) {
    return ensureInitialized().decodeJson<Leaderboard>(json);
  }
}

mixin LeaderboardMappable {
  String toJson() {
    return LeaderboardMapper.ensureInitialized()
        .encodeJson<Leaderboard>(this as Leaderboard);
  }

  Map<String, dynamic> toMap() {
    return LeaderboardMapper.ensureInitialized()
        .encodeMap<Leaderboard>(this as Leaderboard);
  }

  LeaderboardCopyWith<Leaderboard, Leaderboard, Leaderboard> get copyWith =>
      _LeaderboardCopyWithImpl(this as Leaderboard, $identity, $identity);
  @override
  String toString() {
    return LeaderboardMapper.ensureInitialized()
        .stringifyValue(this as Leaderboard);
  }

  @override
  bool operator ==(Object other) {
    return LeaderboardMapper.ensureInitialized()
        .equalsValue(this as Leaderboard, other);
  }

  @override
  int get hashCode {
    return LeaderboardMapper.ensureInitialized().hashValue(this as Leaderboard);
  }
}

extension LeaderboardValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Leaderboard, $Out> {
  LeaderboardCopyWith<$R, Leaderboard, $Out> get $asLeaderboard =>
      $base.as((v, t, t2) => _LeaderboardCopyWithImpl(v, t, t2));
}

abstract class LeaderboardCopyWith<$R, $In extends Leaderboard, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get hasAccess;
  ListCopyWith<$R, Player, PlayerCopyWith<$R, Player, Player>> get players;
  $R call(
      {String? owner,
      List<String>? hasAccess,
      List<Player>? players,
      String? name});
  LeaderboardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LeaderboardCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Leaderboard, $Out>
    implements LeaderboardCopyWith<$R, Leaderboard, $Out> {
  _LeaderboardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Leaderboard> $mapper =
      LeaderboardMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get hasAccess =>
      ListCopyWith($value.hasAccess, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(hasAccess: v));
  @override
  ListCopyWith<$R, Player, PlayerCopyWith<$R, Player, Player>> get players =>
      ListCopyWith($value.players, (v, t) => v.copyWith.$chain(t),
          (v) => call(players: v));
  @override
  $R call(
          {String? owner,
          List<String>? hasAccess,
          List<Player>? players,
          String? name}) =>
      $apply(FieldCopyWithData({
        if (owner != null) #owner: owner,
        if (hasAccess != null) #hasAccess: hasAccess,
        if (players != null) #players: players,
        if (name != null) #name: name
      }));
  @override
  Leaderboard $make(CopyWithData data) => Leaderboard(
      owner: data.get(#owner, or: $value.owner),
      hasAccess: data.get(#hasAccess, or: $value.hasAccess),
      players: data.get(#players, or: $value.players),
      name: data.get(#name, or: $value.name));

  @override
  LeaderboardCopyWith<$R2, Leaderboard, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LeaderboardCopyWithImpl($value, $cast, t);
}
