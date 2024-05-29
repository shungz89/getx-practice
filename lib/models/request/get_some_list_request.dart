class GetSomeListRequest {
  String? page;

  GetSomeListRequest({
    this.page,
  });

  factory GetSomeListRequest.fromJson(Map<String, dynamic> json) =>
      GetSomeListRequest(
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}
