// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FeedbackForm extends FeedbackForm {
  @override
  final String? id;
  @override
  final String? title;

  factory _$FeedbackForm([void Function(FeedbackFormBuilder)? updates]) =>
      (new FeedbackFormBuilder()..update(updates))._build();

  _$FeedbackForm._({this.id, this.title}) : super._();

  @override
  FeedbackForm rebuild(void Function(FeedbackFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedbackFormBuilder toBuilder() => new FeedbackFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedbackForm && id == other.id && title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeedbackForm')
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class FeedbackFormBuilder
    implements Builder<FeedbackForm, FeedbackFormBuilder> {
  _$FeedbackForm? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  FeedbackFormBuilder() {
    FeedbackForm._defaults(this);
  }

  FeedbackFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedbackForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeedbackForm;
  }

  @override
  void update(void Function(FeedbackFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeedbackForm build() => _build();

  _$FeedbackForm _build() {
    final _$result = _$v ?? new _$FeedbackForm._(id: id, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
