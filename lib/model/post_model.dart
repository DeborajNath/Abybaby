class PostData {
  late int id;
  late int sequence;
  late String category;
  late String icon;
  late int status;
  late String lnBn;
  late String lnHn;
  late String createdAt;
  late String updatedAt;
  PostData({
    required this.id,
    required this.sequence,
    required this.category,
    required this.icon,
    required this.status,
    required this.lnBn,
    required this.lnHn,
    required this.createdAt,
    required this.updatedAt,
  });

  PostData.fromMap(Map<String, dynamic> json) {
    id = json['id'] ?? json['ID'];
    sequence = json['sequence'] ?? json['SEQUENCE'];
    category = json['category'] ?? json['CATEGORY'];
    icon = json['icon'] ?? json['ICON'];
    status = json['status'] ?? json['STATUS'];
    lnBn = json['ln_bn'] ?? json['LN_BN'];
    lnHn = json['ln_hn'] ?? json['LN_HN'];
    createdAt = json['created_at'] ?? json['CREATED_AT'];
    updatedAt = json['updated_at'] ?? json['UPDATED_AT'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sequence'] = sequence;
    data['category'] = category;
    data['icon'] = icon;
    data['status'] = status;
    data['ln_bn'] = lnBn;
    data['ln_hn'] = lnHn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
