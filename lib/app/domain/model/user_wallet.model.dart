class UserWallet {
  dynamic availableBalance;
  String? currencyCode;
  dynamic totalBalance;
  String? walletCode;

  UserWallet({
    this.availableBalance,
    this.currencyCode,
    this.totalBalance,
    this.walletCode,
  });

  UserWallet.fromJson(Map<String, dynamic> json) {
    availableBalance = json['availableBalance'];
    currencyCode = json['currencyCode'];
    totalBalance = json['totalBalance'];
    walletCode = json['walletCode'];
  }
}
