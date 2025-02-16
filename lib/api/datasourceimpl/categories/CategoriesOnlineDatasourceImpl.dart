import 'package:elevate_intake2_intro/api/ApiExcuter.dart';
import 'package:elevate_intake2_intro/api/webServices/WebServices.dart';
import 'package:elevate_intake2_intro/data/datasourceContracts/categories_data_source.dart';
import 'package:elevate_intake2_intro/domain/common/Result.dart';
import 'package:elevate_intake2_intro/domain/model/category.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  WebServices client;
  CategoriesOnlineDataSourceImpl(this.client);
  @override
  Future<Result<List<Category>>> getCategories() async{
    return executeApi<List<Category>>(()async{
      var response = await client.getCategories();
      var catsList = response.data?.map((catDto) => catDto.toCategory(),).toList() ?? [];
      return catsList;
    },);
  }


}