// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_badge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileBadge extends UserProfileBadge {
  @override
  final String code;
  @override
  final String name;
  @override
  final String? group;
  @override
  final String? icon;
  @override
  final String? svg;
  @override
  final num? count;
  @override
  final String? label;
  @override
  final String? link;
  @override
  final JsonObject? extra;
  @override
  final BuiltList<UserProfileBadge>? subs;

  factory _$UserProfileBadge(
          [void Function(UserProfileBadgeBuilder)? updates]) =>
      (new UserProfileBadgeBuilder()..update(updates))._build();

  _$UserProfileBadge._(
      {required this.code,
      required this.name,
      this.group,
      this.icon,
      this.svg,
      this.count,
      this.label,
      this.link,
      this.extra,
      this.subs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'UserProfileBadge', 'code');
    BuiltValueNullFieldError.checkNotNull(name, r'UserProfileBadge', 'name');
  }

  @override
  UserProfileBadge rebuild(void Function(UserProfileBadgeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileBadgeBuilder toBuilder() =>
      new UserProfileBadgeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileBadge &&
        code == other.code &&
        name == other.name &&
        group == other.group &&
        icon == other.icon &&
        svg == other.svg &&
        count == other.count &&
        label == other.label &&
        link == other.link &&
        extra == other.extra &&
        subs == other.subs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, svg.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, extra.hashCode);
    _$hash = $jc(_$hash, subs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileBadge')
          ..add('code', code)
          ..add('name', name)
          ..add('group', group)
          ..add('icon', icon)
          ..add('svg', svg)
          ..add('count', count)
          ..add('label', label)
          ..add('link', link)
          ..add('extra', extra)
          ..add('subs', subs))
        .toString();
  }
}

class UserProfileBadgeBuilder
    implements Builder<UserProfileBadge, UserProfileBadgeBuilder> {
  _$UserProfileBadge? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _group;
  String? get group => _$this._group;
  set group(String? group) => _$this._group = group;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _svg;
  String? get svg => _$this._svg;
  set svg(String? svg) => _$this._svg = svg;

  num? _count;
  num? get count => _$this._count;
  set count(num? count) => _$this._count = count;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  JsonObject? _extra;
  JsonObject? get extra => _$this._extra;
  set extra(JsonObject? extra) => _$this._extra = extra;

  ListBuilder<UserProfileBadge>? _subs;
  ListBuilder<UserProfileBadge> get subs =>
      _$this._subs ??= new ListBuilder<UserProfileBadge>();
  set subs(ListBuilder<UserProfileBadge>? subs) => _$this._subs = subs;

  UserProfileBadgeBuilder() {
    UserProfileBadge._defaults(this);
  }

  UserProfileBadgeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _name = $v.name;
      _group = $v.group;
      _icon = $v.icon;
      _svg = $v.svg;
      _count = $v.count;
      _label = $v.label;
      _link = $v.link;
      _extra = $v.extra;
      _subs = $v.subs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileBadge other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileBadge;
  }

  @override
  void update(void Function(UserProfileBadgeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileBadge build() => _build();

  _$UserProfileBadge _build() {
    _$UserProfileBadge _$result;
    try {
      _$result = _$v ??
          new _$UserProfileBadge._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'UserProfileBadge', 'code'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserProfileBadge', 'name'),
              group: group,
              icon: icon,
              svg: svg,
              count: count,
              label: label,
              link: link,
              extra: extra,
              subs: _subs?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subs';
        _subs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfileBadge', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
