class GroceryListModel {
  final String name;
  int count;
  final int price;
  final String details;

  GroceryListModel(
    this.name,
    this.count,
    this.price,
    this.details,
  );

  @override
  bool operator ==(other) {
    return (other is GroceryListModel) &&
        other.name == name &&
        other.price == price &&
        other.details == details;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode ^ details.hashCode;
}
