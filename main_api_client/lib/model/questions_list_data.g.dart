// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'questions_list_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<QuestionsListData> _$questionsListDataSerializer =
    new _$QuestionsListDataSerializer();

class _$QuestionsListDataSerializer
    implements StructuredSerializer<QuestionsListData> {
  @override
  final Iterable<Type> types = const [QuestionsListData, _$QuestionsListData];
  @override
  final String wireName = 'QuestionsListData';

  @override
  Iterable<Object> serialize(Serializers serializers, QuestionsListData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.responsible;
    if (value != null) {
      result
        ..add('responsible')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.question;
    if (value != null) {
      result
        ..add('question')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.answer;
    if (value != null) {
      result
        ..add('answer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalCount;
    if (value != null) {
      result
        ..add('total_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.next;
    if (value != null) {
      result
        ..add('next')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prev;
    if (value != null) {
      result
        ..add('prev')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  QuestionsListData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionsListDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'responsible':
          result.responsible = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total_count':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prev':
          result.prev = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$QuestionsListData extends QuestionsListData {
  @override
  final int id;
  @override
  final String date;
  @override
  final String responsible;
  @override
  final String tags;
  @override
  final String question;
  @override
  final String answer;
  @override
  final int totalCount;
  @override
  final String next;
  @override
  final String prev;

  factory _$QuestionsListData(
          [void Function(QuestionsListDataBuilder) updates]) =>
      (new QuestionsListDataBuilder()..update(updates)).build();

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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), date.hashCode),
                                responsible.hashCode),
                            tags.hashCode),
                        question.hashCode),
                    answer.hashCode),
                totalCount.hashCode),
            next.hashCode),
        prev.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionsListData')
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
  _$QuestionsListData _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _responsible;
  String get responsible => _$this._responsible;
  set responsible(String responsible) => _$this._responsible = responsible;

  String _tags;
  String get tags => _$this._tags;
  set tags(String tags) => _$this._tags = tags;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  String _answer;
  String get answer => _$this._answer;
  set answer(String answer) => _$this._answer = answer;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  String _next;
  String get next => _$this._next;
  set next(String next) => _$this._next = next;

  String _prev;
  String get prev => _$this._prev;
  set prev(String prev) => _$this._prev = prev;

  QuestionsListDataBuilder() {
    QuestionsListData._initializeBuilder(this);
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
  void update(void Function(QuestionsListDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionsListData build() {
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
