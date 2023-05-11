extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool isUrl() {
  // Usa Uri.parse per analizzare la stringa e creare un oggetto Uri
  Uri uri = Uri.parse(this);
  
  // Controlla se l'oggetto Uri ha uno schema valido per un URL
  return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
}
}