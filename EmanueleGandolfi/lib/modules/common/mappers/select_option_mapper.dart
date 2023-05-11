import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/helpers/notion_color.dart';
import 'package:offertelavoroflutter_app/modules/notion_api/dtos/select_option/notion_select_option.dart';

class SelectOptionMapper extends DTOMapper<SelectOption, NotionSelectOption> {
  @override
  SelectOption fromDTO(NotionSelectOption notionSelectOption) {
    return SelectOption(
      id: notionSelectOption.id,
      name: notionSelectOption.name,
      color: NotionColor.parseNotionColor(notionSelectOption.color),
    );
  }
}