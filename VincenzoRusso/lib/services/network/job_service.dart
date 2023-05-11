import 'package:dio/dio.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/notion_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:offertelavoroflutter_app/services/network/dto/query_notion_request.dart';

part 'job_service.g.dart';

@RestApi()
abstract class JobService {
  factory JobService(
    Dio dio, {
    String baseUrl,
  }) = _JobService;

  @POST("/databases/283d2760f81548f0a7baca4b3e58d7d8/query")
  Future<NotionResponse> fetchJobList(@Body() QueryNotionRequest request);

  @POST("/databases/e6a8a6760e3d4430b20a15d16f75f92e/query")
  Future<NotionResponse> fetchFreelanceList(@Body() QueryNotionRequest request);

  @GET("/pages/{id}")
  Future<JobDTO> jobByID(@Path("id") String id);
}
