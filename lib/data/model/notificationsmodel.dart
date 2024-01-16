class NotificationsModel {
  int? notificationsId;
  int? notificationsUsersid;
  int? notificationsOrdersid;
  String? notificationsTitle;
  String? notificationsBody;
  String? notificationsDatetime;

  NotificationsModel(
      {this.notificationsId,
      this.notificationsUsersid,
      this.notificationsOrdersid,
      this.notificationsTitle,
      this.notificationsBody,
      this.notificationsDatetime});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsUsersid = json['notifications_usersid'];
    notificationsOrdersid = json['notifications_ordersid'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsDatetime = json['notifications_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications_id'] = this.notificationsId;
    data['notifications_usersid'] = this.notificationsUsersid;
    data['notifications_ordersid'] = this.notificationsOrdersid;
    data['notifications_title'] = this.notificationsTitle;
    data['notifications_body'] = this.notificationsBody;
    data['notifications_datetime'] = this.notificationsDatetime;
    return data;
  }
}
