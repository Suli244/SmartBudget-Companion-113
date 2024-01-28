class BudgetResponse {
  late bool boolValue;
  late BudgetOtvetModel budgetResponseDto;

  BudgetResponse({
    required this.boolValue,
    required this.budgetResponseDto,
  });

  BudgetResponse.fromJson(Map<String, dynamic> json) {
    boolValue = json['brs_strt'];
    budgetResponseDto = BudgetOtvetModel.fromJson(json['bk_json']);
  }
}

class BudgetOtvetModel {
  String? trv;
  String? vrt;
  String? qwwe;
  String? nty;
  String? cwe;
  String? tyr;
  String? nyt;

  BudgetOtvetModel(
      {this.trv, this.vrt, this.qwwe, this.nty, this.cwe, this.tyr, this.nyt});

  BudgetOtvetModel.fromJson(Map<String, dynamic> json) {
    trv = json['trv'];
    vrt = json['vrt'];
    qwwe = json['qwwe'];
    nty = json['nty'];
    cwe = json['cwe'];
    tyr = json['tyr'];
    nyt = json['nyt'];
  }
}
