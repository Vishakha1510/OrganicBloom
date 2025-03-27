class CartItem {
  final String id;
  final Map<String, dynamic> itemData;
  final String categoryId;
  int qty;

  CartItem({
    required this.id,
    required this.itemData,
    required this.categoryId,
    this.qty = 1,
  });

  double getPrice() {
    double p = double.tryParse(itemData["price"]) ?? 0.0;
    return p;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "id": id,
      "itemData": itemData,
      "qty": qty,
      "categoryId": categoryId
    };
    return data;
  }

  factory CartItem.fromMap(Map<String, dynamic> data) {
    return CartItem(
        id: data["id"],
        itemData: data["itemData"],
        categoryId: data["categoryId"],
        qty: data["qty"]);
  }
}
