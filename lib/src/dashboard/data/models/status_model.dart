class Status {
  Status({required this.msg});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      msg: json['msg'] as String,
    );
  }

  final String msg;
}
