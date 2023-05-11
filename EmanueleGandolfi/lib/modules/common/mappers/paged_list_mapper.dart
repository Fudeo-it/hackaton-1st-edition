import 'package:offertelavoroflutter_app/helpers/generic_dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/models/paged_list/paged_list.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/paged_response/notion_paged_response.dart';

class PagedListMapper<T> extends GenericDTOMapper<PagedList, T, NotionPagedResponse>{
  @override
  PagedList<T> fromDTO(NotionPagedResponse notionPagedResponse, T Function(dynamic) objectMapper) {
    return PagedList(
      hasMore: notionPagedResponse.hasMore,
      nextPageKey: notionPagedResponse.nextCursor,
      results: notionPagedResponse.results.map(objectMapper).toList()
    );
  }
}