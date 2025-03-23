part of 'customer_bloc.dart';

enum Status { initial, loading, success, failure }

class CustomerState extends Equatable {
  final Status status;
  final List<MarketModel>? markets;
  final List<CustomerReqModel>? request;
  final List? orders;
  const CustomerState({
    required this.status,
    this.markets,
    this.request,
    this.orders,
  });

  factory CustomerState.initial() => const CustomerState(
    status: Status.initial,
    markets: [],
    request: [],
    orders: [],
  );
  @override
  List<Object> get props => [status, markets!, request!, orders!];

  CustomerState copyWith({
    Status? status,
    List<MarketModel>? markets,
    List<CustomerReqModel>? request,
    List? orders,
  }) {
    return CustomerState(
      status: status ?? this.status,
      markets: markets ?? this.markets,
      request: request ?? this.request,
      orders: orders ?? this.orders,
    );
  }
}
