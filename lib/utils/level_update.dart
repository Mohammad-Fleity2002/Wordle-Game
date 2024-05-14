import 'package:test_flutter_1_1/API_Connections/api_connection.dart';
import 'package:test_flutter_1_1/utils/calculate_stats.dart';

void setCode() async{

  int  level = 0;
  final stats = await  getStats();
  if  (stats != null) {
    level = (stats[5]);
  }
  if (level==4) {
    code = "666";
  }else if(level>=3){
    code="665";
  }else if(level>=2) {
    code = "664";
  }else if(level>=1) {
    code = "663";
  }else {
    code = "662";
  }
  print("code: $code");
  print_data();
}