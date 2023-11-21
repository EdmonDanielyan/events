// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_list_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestionsListData extends QuestionsListData {
  @override
  final int? id;
  @override
  final String? date;
  @override
  final String? responsible;
  @override
  final String? tags;
  @override
  final String? question;
  @override
  final String? answer;
  @override
  final int? totalCount;
  @override
  final String? next;
  @override
  final String? prev;

  factory _$QuestionsListData(
          [void Function(QuestionsListDataBuilder)? updates]) =>
      (new QuestionsListDataBuilder()..update(updates))._build();

  _$QuestionsListData._(
      {this.id,
      this.date,
      this.responsible,
      this.tags,
      this.question,
      this.answer,
      this.totalCount,
      this.next,
      this.prev})
      : super._();

  @override
  QuestionsListData rebuild(void Function(QuestionsListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionsListDataBuilder toBuilder() =>
      new QuestionsListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionsListData &&
        id == other.id &&
        date == other.date &&
        responsible == other.responsible &&
        tags == other.tags &&
        question == other.question &&
        answer == other.answer &&
        totalCount == other.totalCount &&
        next == other.next &&
        prev == other.prev;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, responsible.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, answer.hashCode);
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, next.hashCode);
    _$hash = $jc(_$hash, prev.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'QuestionsListData')
          ..add('id', id)
          ..add('date', date)
          ..add('responsible', responsible)
          ..add('tags', tags)
          ..add('question', question)
          ..add('answer', answer)
          ..add('totalCount', totalCount)
          ..add('next', next)
          ..add('prev', prev))
        .toString();
  }
}

class QuestionsListDataBuilder
    implements Builder<QuestionsListData, QuestionsListDataBuilder> {
  _$QuestionsListData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _responsible;
  String? get responsible => _$this._responsible;
  set responsible(String? responsible) => _$this._responsible = responsible;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  String? _next;
  String? get next => _$this._next;
  set next(String? next) => _$this._next = next;

  String? _prev;
  String? get prev => _$this._prev;
  set prev(String? prev) => _$this._prev = prev;

  QuestionsListDataBuilder() {
    QuestionsListData._defaults(this);
  }

  QuestionsListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _date = $v.date;
      _responsible = $v.responsible;
      _tags = $v.tags;
      _question = $v.question;
      _answer = $v.answer;
      _totalCount = $v.totalCount;
      _next = $v.next;
      _prev = $v.prev;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionsListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionsListData;
  }

  @override
  void update(void Function(QuestionsListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  QuestionsListData build() => _build();

  _$QuestionsListData _build() {
    final _$result = _$v ??
        new _$QuestionsListData._(
            id: id,
            date: date,
            responsible: responsible,
            tags: tags,
            question: question,
            answer: answer,
            totalCount: totalCount,
            next: next,
            prev: prev);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
