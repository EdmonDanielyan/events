// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionOption extends SubscriptionOption {
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final int? limit;
  @override
  final int? left;
  @override
  final DateTime? dateStart;
  @override
  final DateTime? dateEnd;
  @override
  final bool? available;

  factory _$SubscriptionOption(
          [void Function(SubscriptionOptionBuilder)? updates]) =>
      (new SubscriptionOptionBuilder()..update(updates))._build();

  _$SubscriptionOption._(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.limit,
      this.left,
      this.dateStart,
      this.dateEnd,
      this.available})
      : super._();

  @override
  SubscriptionOption rebuild(
          void Function(SubscriptionOptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionOptionBuilder toBuilder() =>
      new SubscriptionOptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionOption &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        limit == other.limit &&
        left == other.left &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        available == other.available;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, left.hashCode);
    _$hash = $jc(_$hash, dateStart.hashCode);
    _$hash = $jc(_$hash, dateEnd.hashCode);
    _$hash = $jc(_$hash, available.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionOption')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('image', image)
          ..add('limit', limit)
          ..add('left', left)
          ..add('dateStart', dateStart)
          ..add('dateEnd', dateEnd)
          ..add('available', available))
        .toString();
  }
}

class SubscriptionOptionBuilder
    implements Builder<SubscriptionOption, SubscriptionOptionBuilder> {
  _$SubscriptionOption? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _left;
  int? get left => _$this._left;
  set left(int? left) => _$this._left = left;

  DateTime? _dateStart;
  DateTime? get dateStart => _$this._dateStart;
  set dateStart(DateTime? dateStart) => _$this._dateStart = dateStart;

  DateTime? _dateEnd;
  DateTime? get dateEnd => _$this._dateEnd;
  set dateEnd(DateTime? dateEnd) => _$this._dateEnd = dateEnd;

  bool? _available;
  bool? get available => _$this._available;
  set available(bool? available) => _$this._available = available;

  SubscriptionOptionBuilder() {
    SubscriptionOption._defaults(this);
  }

  SubscriptionOptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _image = $v.image;
      _limit = $v.limit;
      _left = $v.left;
      _dateStart = $v.dateStart;
      _dateEnd = $v.dateEnd;
      _available = $v.available;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionOption other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionOption;
  }

  @override
  void update(void Function(SubscriptionOptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionOption build() => _build();

  _$SubscriptionOption _build() {
    final _$result = _$v ??
        new _$SubscriptionOption._(
            id: id,
            title: title,
            description: description,
            image: image,
            limit: limit,
            left: left,
            dateStart: dateStart,
            dateEnd: dateEnd,
            available: available);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
