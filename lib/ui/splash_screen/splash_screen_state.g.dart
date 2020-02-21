// GENERATED CODE - DO NOT MODIFY BY HAND

part of splash_screen_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashScreenState extends SplashScreenState {
  @override
  final bool isLoading;
  @override
  final PictureOfTheDayResponse result;
  @override
  final String error;

  factory _$SplashScreenState(
          [void Function(SplashScreenStateBuilder) updates]) =>
      (new SplashScreenStateBuilder()..update(updates)).build();

  _$SplashScreenState._({this.isLoading, this.result, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SplashScreenState', 'isLoading');
    }
    if (result == null) {
      throw new BuiltValueNullFieldError('SplashScreenState', 'result');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SplashScreenState', 'error');
    }
  }

  @override
  SplashScreenState rebuild(void Function(SplashScreenStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashScreenStateBuilder toBuilder() =>
      new SplashScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashScreenState &&
        isLoading == other.isLoading &&
        result == other.result &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isLoading.hashCode), result.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplashScreenState')
          ..add('isLoading', isLoading)
          ..add('result', result)
          ..add('error', error))
        .toString();
  }
}

class SplashScreenStateBuilder
    implements Builder<SplashScreenState, SplashScreenStateBuilder> {
  _$SplashScreenState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  PictureOfTheDayResponseBuilder _result;
  PictureOfTheDayResponseBuilder get result =>
      _$this._result ??= new PictureOfTheDayResponseBuilder();
  set result(PictureOfTheDayResponseBuilder result) => _$this._result = result;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SplashScreenStateBuilder();

  SplashScreenStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _result = _$v.result?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashScreenState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SplashScreenState;
  }

  @override
  void update(void Function(SplashScreenStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplashScreenState build() {
    _$SplashScreenState _$result;
    try {
      _$result = _$v ??
          new _$SplashScreenState._(
              isLoading: isLoading, result: result.build(), error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SplashScreenState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
