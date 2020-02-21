// GENERATED CODE - DO NOT MODIFY BY HAND

part of picture_of_the_day_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PictureOfTheDayResponse> _$pictureOfTheDayResponseSerializer =
    new _$PictureOfTheDayResponseSerializer();

class _$PictureOfTheDayResponseSerializer
    implements StructuredSerializer<PictureOfTheDayResponse> {
  @override
  final Iterable<Type> types = const [
    PictureOfTheDayResponse,
    _$PictureOfTheDayResponse
  ];
  @override
  final String wireName = 'PictureOfTheDayResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PictureOfTheDayResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.copyright != null) {
      result
        ..add('copyright')
        ..add(serializers.serialize(object.copyright,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.explanation != null) {
      result
        ..add('explanation')
        ..add(serializers.serialize(object.explanation,
            specifiedType: const FullType(String)));
    }
    if (object.hdurl != null) {
      result
        ..add('hdurl')
        ..add(serializers.serialize(object.hdurl,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PictureOfTheDayResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PictureOfTheDayResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'copyright':
          result.copyright = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'explanation':
          result.explanation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hdurl':
          result.hdurl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PictureOfTheDayResponse extends PictureOfTheDayResponse {
  @override
  final String copyright;
  @override
  final String date;
  @override
  final String explanation;
  @override
  final String hdurl;
  @override
  final String url;
  @override
  final String title;

  factory _$PictureOfTheDayResponse(
          [void Function(PictureOfTheDayResponseBuilder) updates]) =>
      (new PictureOfTheDayResponseBuilder()..update(updates)).build();

  _$PictureOfTheDayResponse._(
      {this.copyright,
      this.date,
      this.explanation,
      this.hdurl,
      this.url,
      this.title})
      : super._();

  @override
  PictureOfTheDayResponse rebuild(
          void Function(PictureOfTheDayResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PictureOfTheDayResponseBuilder toBuilder() =>
      new PictureOfTheDayResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PictureOfTheDayResponse &&
        copyright == other.copyright &&
        date == other.date &&
        explanation == other.explanation &&
        hdurl == other.hdurl &&
        url == other.url &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, copyright.hashCode), date.hashCode),
                    explanation.hashCode),
                hdurl.hashCode),
            url.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PictureOfTheDayResponse')
          ..add('copyright', copyright)
          ..add('date', date)
          ..add('explanation', explanation)
          ..add('hdurl', hdurl)
          ..add('url', url)
          ..add('title', title))
        .toString();
  }
}

class PictureOfTheDayResponseBuilder
    implements
        Builder<PictureOfTheDayResponse, PictureOfTheDayResponseBuilder> {
  _$PictureOfTheDayResponse _$v;

  String _copyright;
  String get copyright => _$this._copyright;
  set copyright(String copyright) => _$this._copyright = copyright;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _explanation;
  String get explanation => _$this._explanation;
  set explanation(String explanation) => _$this._explanation = explanation;

  String _hdurl;
  String get hdurl => _$this._hdurl;
  set hdurl(String hdurl) => _$this._hdurl = hdurl;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  PictureOfTheDayResponseBuilder();

  PictureOfTheDayResponseBuilder get _$this {
    if (_$v != null) {
      _copyright = _$v.copyright;
      _date = _$v.date;
      _explanation = _$v.explanation;
      _hdurl = _$v.hdurl;
      _url = _$v.url;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PictureOfTheDayResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PictureOfTheDayResponse;
  }

  @override
  void update(void Function(PictureOfTheDayResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PictureOfTheDayResponse build() {
    final _$result = _$v ??
        new _$PictureOfTheDayResponse._(
            copyright: copyright,
            date: date,
            explanation: explanation,
            hdurl: hdurl,
            url: url,
            title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
