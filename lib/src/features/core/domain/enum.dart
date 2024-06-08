enum OrderStatus {
  accepte,
  affecte,
  refuse,
  enPreparation,
  enCours,
  livre,
}

enum MerchantTypes { restaurant, others }

extension MerchantTypesExtension on MerchantTypes {
  String get value {
    switch (this) {
      case MerchantTypes.restaurant:
        return "Restaurant";
      case MerchantTypes.others:
        return "autres";
    }
  }
}

extension OrderStatusExtension on OrderStatus {
  String get value {
    switch (this) {
      case OrderStatus.affecte:
        return "Affecte";
      case OrderStatus.accepte:
        return "Accepte";
      case OrderStatus.refuse:
        return "refuse";
      case OrderStatus.enPreparation:
        return "EnPrepartion";
      case OrderStatus.enCours:
        return "Encours";
      case OrderStatus.livre:
        return "Livre";
    }
  }
}
