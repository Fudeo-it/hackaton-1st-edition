class RichTextAnnotation {
  final bool bold;
  final bool italic;
  final bool strikethrough;
  final bool underline;
  final bool code;
  final String? colorString;

  RichTextAnnotation({
    required this.bold,
    required this.italic,
    required this.strikethrough,
    required this.underline,
    required this.code,
    this.colorString,
  });

  bool isPlain() {
    if (bold || italic || strikethrough || underline || code) {
      return false;
    }
    return true;
  }
}
