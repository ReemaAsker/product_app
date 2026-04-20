// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoryInitial value)?  initial,TResult Function( CategoryLoading value)?  loading,TResult Function( CategorySuccess value)?  success,TResult Function( CategoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoryInitial() when initial != null:
return initial(_that);case CategoryLoading() when loading != null:
return loading(_that);case CategorySuccess() when success != null:
return success(_that);case CategoryError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoryInitial value)  initial,required TResult Function( CategoryLoading value)  loading,required TResult Function( CategorySuccess value)  success,required TResult Function( CategoryError value)  error,}){
final _that = this;
switch (_that) {
case CategoryInitial():
return initial(_that);case CategoryLoading():
return loading(_that);case CategorySuccess():
return success(_that);case CategoryError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoryInitial value)?  initial,TResult? Function( CategoryLoading value)?  loading,TResult? Function( CategorySuccess value)?  success,TResult? Function( CategoryError value)?  error,}){
final _that = this;
switch (_that) {
case CategoryInitial() when initial != null:
return initial(_that);case CategoryLoading() when loading != null:
return loading(_that);case CategorySuccess() when success != null:
return success(_that);case CategoryError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List categories)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoryInitial() when initial != null:
return initial();case CategoryLoading() when loading != null:
return loading();case CategorySuccess() when success != null:
return success(_that.categories);case CategoryError() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List categories)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CategoryInitial():
return initial();case CategoryLoading():
return loading();case CategorySuccess():
return success(_that.categories);case CategoryError():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List categories)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CategoryInitial() when initial != null:
return initial();case CategoryLoading() when loading != null:
return loading();case CategorySuccess() when success != null:
return success(_that.categories);case CategoryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CategoryInitial implements CategoryState {
  const CategoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class CategoryLoading implements CategoryState {
  const CategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.loading()';
}


}




/// @nodoc


class CategorySuccess implements CategoryState {
  const CategorySuccess(final  List categories): _categories = categories;
  

 final  List _categories;
 List get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategorySuccessCopyWith<CategorySuccess> get copyWith => _$CategorySuccessCopyWithImpl<CategorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategorySuccess&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryState.success(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategorySuccessCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategorySuccessCopyWith(CategorySuccess value, $Res Function(CategorySuccess) _then) = _$CategorySuccessCopyWithImpl;
@useResult
$Res call({
 List categories
});




}
/// @nodoc
class _$CategorySuccessCopyWithImpl<$Res>
    implements $CategorySuccessCopyWith<$Res> {
  _$CategorySuccessCopyWithImpl(this._self, this._then);

  final CategorySuccess _self;
  final $Res Function(CategorySuccess) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(CategorySuccess(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List,
  ));
}


}

/// @nodoc


class CategoryError implements CategoryState {
  const CategoryError(this.message);
  

 final  String message;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryErrorCopyWith<CategoryError> get copyWith => _$CategoryErrorCopyWithImpl<CategoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CategoryErrorCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryErrorCopyWith(CategoryError value, $Res Function(CategoryError) _then) = _$CategoryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CategoryErrorCopyWithImpl<$Res>
    implements $CategoryErrorCopyWith<$Res> {
  _$CategoryErrorCopyWithImpl(this._self, this._then);

  final CategoryError _self;
  final $Res Function(CategoryError) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CategoryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
