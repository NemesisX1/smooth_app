class Command {
  String clientName;
  String location;
  int amount;
  String flavourName;
  int qty;

  Command({
    this.amount = 0,
    this.clientName = "Nom du client",
    this.location = "Cotonou",
    this.flavourName = "",
    this.qty = 0,
  });
}
