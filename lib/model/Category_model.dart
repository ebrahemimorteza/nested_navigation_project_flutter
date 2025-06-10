class Category_model{
  int? id;
  String? category_product_title;
  String? category_product_parent;
  String? category_product_picIcon;
  String? category_product_price;
  String? category_product_price_after_discount;
  String? category_product_active;
  Category_model({
  required this.id,
  required this.category_product_title,
  required this.category_product_picIcon,
  required this.category_product_price,
  required this.category_product_price_after_discount,
  required this.category_product_active,
  });
  Category_model.fromJson(Map<String ,dynamic> json){
    id=json['id'];
    category_product_title=json['category_product_title'];
    category_product_picIcon=json['category_product_picIcon'];
    category_product_price=json['category_product_price'];
    category_product_price_after_discount=json['category_product_price_after_discount'];
    category_product_active=json['category_product_active'];
  }
}