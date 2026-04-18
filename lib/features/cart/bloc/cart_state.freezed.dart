// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Updated value)?  updated,TResult Function( _Loading value)?  loading,TResult Function( _CheckoutSuccess value)?  checkoutSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _Loading() when loading != null:
return loading(_that);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Updated value)  updated,required TResult Function( _Loading value)  loading,required TResult Function( _CheckoutSuccess value)  checkoutSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Updated():
return updated(_that);case _Loading():
return loading(_that);case _CheckoutSuccess():
return checkoutSuccess(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Updated value)?  updated,TResult? Function( _Loading value)?  loading,TResult? Function( _CheckoutSuccess value)?  checkoutSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _Loading() when loading != null:
return loading(_that);case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( List<Product> products,  double totalPrice)?  updated,TResult Function()?  loading,TResult Function( double total)?  checkoutSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updated() when updated != null:
return updated(_that.products,_that.totalPrice);case _Loading() when loading != null:
return loading();case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that.total);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( List<Product> products,  double totalPrice)  updated,required TResult Function()  loading,required TResult Function( double total)  checkoutSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Updated():
return updated(_that.products,_that.totalPrice);case _Loading():
return loading();case _CheckoutSuccess():
return checkoutSuccess(_that.total);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( List<Product> products,  double totalPrice)?  updated,TResult? Function()?  loading,TResult? Function( double total)?  checkoutSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Updated() when updated != null:
return updated(_that.products,_that.totalPrice);case _Loading() when loading != null:
return loading();case _CheckoutSuccess() when checkoutSuccess != null:
return checkoutSuccess(_that.total);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class _Updated implements CartState {
  const _Updated({required final  List<Product> products, required this.totalPrice}): _products = products;
  

 final  List<Product> _products;
 List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  double totalPrice;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),totalPrice);

@override
String toString() {
  return 'CartState.updated(products: $products, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 List<Product> products, double totalPrice
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? totalPrice = null,}) {
  return _then(_Updated(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Loading implements CartState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.loading()';
}


}




/// @nodoc


class _CheckoutSuccess implements CartState {
  const _CheckoutSuccess({required this.total});
  

 final  double total;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSuccessCopyWith<_CheckoutSuccess> get copyWith => __$CheckoutSuccessCopyWithImpl<_CheckoutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSuccess&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'CartState.checkoutSuccess(total: $total)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CheckoutSuccessCopyWith(_CheckoutSuccess value, $Res Function(_CheckoutSuccess) _then) = __$CheckoutSuccessCopyWithImpl;
@useResult
$Res call({
 double total
});




}
/// @nodoc
class __$CheckoutSuccessCopyWithImpl<$Res>
    implements _$CheckoutSuccessCopyWith<$Res> {
  __$CheckoutSuccessCopyWithImpl(this._self, this._then);

  final _CheckoutSuccess _self;
  final $Res Function(_CheckoutSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(_CheckoutSuccess(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Error implements CartState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CartState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
