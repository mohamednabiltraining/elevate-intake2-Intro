import 'package:elevate_intake2_intro/api/ApiExcuter.dart';
import 'package:elevate_intake2_intro/api/webServices/ApiClient.dart';
import 'package:elevate_intake2_intro/api/webServices/WebServices.dart';
import 'package:elevate_intake2_intro/data/datasourceContracts/brands_data_source.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:BrandsOnlineDatasource)
class BrandsOnlineDatasourceImpl implements BrandsOnlineDatasource{
  WebServices client;
  BrandsOnlineDatasourceImpl(this.client);
  @override
  Future<Result<List<Brand>>> getBrands() async{
    return executeApi<List<Brand>>(()async{
      var response = await client.getBrands();
      var catsList = response.data?.map((brandDto) => brandDto.toBrand(),).toList() ?? [];
      return catsList;
    },);
  }


}