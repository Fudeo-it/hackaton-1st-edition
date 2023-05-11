class K {
  const K._();

// Chiavi DTO e Json
  static const objectKey = "object";
  static const resultsKey = "results";
  static const nextCursorKey = "next_cursor";
  static const hasMoreKey = "has_more";
  static const pageKey = "page";
  static const createdTimeKey = "created_time";
  static const lastEditedTimeKey = "last_edited_time";
  static const createdByKey = "created_by";
  static const lastEditedByKey = "last_edited_by";
  static const coverKey = "cover";
  static const iconKey = "icon";
  static const parentKey = "parent";
  static const archivedKey = "archived";
  static const propertiesKey = "properties";
  static const emojiKey = "emoji";
  static const idKey = "id";
  static const typeKey = "type";
  static const titleKey = "title";
  static const richTextKey = "rich_text";
  static const textKey = "text";
  static const selectKey = "select";
  static const urlKey = "url";
  static const nameKey = "name";
  static const annotationsKey = "annotations";
  static const plainTextKey = "plain_text";
  static const hrefKey = "href";
  static const contentKey = "content";
  static const linkKey = "link";
  static const boldKey = "bold";
  static const italicKey = "italic";
  static const strikethroughKey = "strikethrough";
  static const undelineKey = "underline";
  static const codeKey = "code";
  static const colorKey = "color";
  static const databaseIdKey = "database_id";
  static const jobPostedKey = "Job Posted";
  static const teamKey = "Team";
  static const contractKey = "Contratto";
  static const seniorityKey = "Seniority";
  static const ralKey = "RAL";
  static const namePropertyKey = "Name";
  static const qualificaKey = "Qualifica";
  static const retribuzioneKey = "Retribuzione";
  static const descrizioneOffertaKey = "Descrizione offerta";
  static const comeCandidarsiKey = "Come candidarsi";
  static const localitaKey = "Località";
  static const nomeAziendaKey = "Nome azienda";
  static const statoDiPubblicazioneKey = "Stato di pubblicazione";
  static const urlSitoWeb = "URL sito web";
  static const tempisticeKey = "Tempistiche";
  static const richiestaDiLavoroKey = "Richiesta di lavoro";
  static const budgetKey = "Budget";
  static const ndaKey = "NDA";
  static const codiceKey = "Codice";
  static const tempisticheDiPagamentoKey = "Tempistiche di pagamento";
  static const descrizioneDelProgettoKey = "Descrizione del progetto";
  static const tipoDiRelazioneKey = "Tipo di relazione";

  static const andKey = "and";
  static const orKey = "or";
  static const propertyKey = "property";
  static const equalKey = "equals";
  static const containsKey = "contains";
  static const directionKey = "direction";

  static const pageSizeKey = "page_size";
  static const startCursorKey = "start_cursor";
  static const filterKey = "filter";
  static const sortKey = "sorts";

  // Network
  static const baseUrl = "https://api.notion.com/v1";

  // RegEx
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const regexUrl =
      r"[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)";
}
