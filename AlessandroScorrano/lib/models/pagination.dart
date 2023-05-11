class Pagination {
  final String? nextCursor;
  final bool hasMore;

  const Pagination({
    required this.nextCursor,
    required this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> data) =>
      Pagination(nextCursor: data['next_cursor'], hasMore: data['has_more']);
}
