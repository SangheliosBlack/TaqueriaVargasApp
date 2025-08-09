
class ProductOrderEntity {

  int id;
  int complements;
  int quantity;

    ProductOrderEntity({
        required this.id,
        required this.complements,
        required this.quantity,
    });

    Map<String, dynamic> toJson() => {
        "id": id,
        "complements": complements,
        "quantity": quantity,
    };
}
