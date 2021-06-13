class Expense {
  String id;
  String title;
  double expenseAmount;
  String description;

  Expense(
      {this.id, this.title, this.expenseAmount, this.description});

  Expense.fromJson(Map<String, dynamic> json, String id) {
    this.id = id;
    title = json['title'];
    expenseAmount = json['expenseAmount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['expenseAmount'] = this.expenseAmount;
    data['description'] = this.description;
    return data;
  }
}