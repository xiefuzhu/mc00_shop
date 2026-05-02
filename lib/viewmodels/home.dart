class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json["id"] ?? "", imageUrl: json["imageUrl"] ?? "");
  }
}

//flutter 必须强制转换 没有隐式转换
