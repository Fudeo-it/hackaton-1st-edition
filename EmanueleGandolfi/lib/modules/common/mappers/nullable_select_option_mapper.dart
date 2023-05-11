import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/select_option_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/select_option/notion_select_option.dart';

class NullableSelectOptionMapper extends DTOMapper<SelectOption?, NotionSelectOption?> {
  @override
  SelectOption? fromDTO(NotionSelectOption? notionSelectOption) {
    if(notionSelectOption == null) return null;
    return SelectOptionMapper().fromDTO(notionSelectOption);
  }
}