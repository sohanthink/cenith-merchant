class DescribeYourBusinessModel {
  final int? index;

  DescribeYourBusinessModel({required this.index});

  factory DescribeYourBusinessModel.fromJson(Map<String, dynamic> json) {
    return DescribeYourBusinessModel(index: json['index']);
  }

  Map<String, dynamic> toJson() {
    return {'index': index};
  }
}
