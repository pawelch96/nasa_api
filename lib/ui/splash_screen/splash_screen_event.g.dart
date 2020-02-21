// GENERATED CODE - DO NOT MODIFY BY HAND

part of splash_screen_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashScreenInitiated extends SplashScreenInitiated {
  @override
  final String date;

  factory _$SplashScreenInitiated(
          [void Function(SplashScreenInitiatedBuilder) updates]) =>
      (new SplashScreenInitiatedBuilder()..update(updates)).build();

  _$SplashScreenInitiated._({this.date}) : super._() {
    if (date == null) {
      throw new BuiltValueNullFieldError('SplashScreenInitiated', 'date');
    }
  }

  @override
  SplashScreenInitiated rebuild(
          void Function(SplashScreenInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashScreenInitiatedBuilder toBuilder() =>
      new SplashScreenInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashScreenInitiated && date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(0, date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplashScreenInitiated')
          ..add('date', date))
        .toString();
  }
}

class SplashScreenInitiatedBuilder
    implements Builder<SplashScreenInitiated, SplashScreenInitiatedBuilder> {
  _$SplashScreenInitiated _$v;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  SplashScreenInitiatedBuilder();

  SplashScreenInitiatedBuilder get _$this {
    if (_$v != null) {
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashScreenInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SplashScreenInitiated;
  }

  @override
  void update(void Function(SplashScreenInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplashScreenInitiated build() {
    final _$result = _$v ?? new _$SplashScreenInitiated._(date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
