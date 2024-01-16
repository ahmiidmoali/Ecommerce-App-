class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersDeliveryprice;
  int? ordersPaymentmethod;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersStatus;
  int? ordersRate;
  String? ordersComment;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersDeliveryprice,
      this.ordersPaymentmethod,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersStatus,
      this.ordersRate,
      this.ordersComment});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersStatus = json['orders_status'];
    ordersRate = json['orders_rate'];
    ordersComment = json['orders_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_deliveryprice'] = this.ordersDeliveryprice;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_status'] = this.ordersStatus;
    data['orders_rate'] = this.ordersRate;
    data['orders_comment'] = this.ordersComment;
    return data;
  }
}
