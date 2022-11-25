class DataManager {
  static final DataManager _singleton = DataManager._internal();
    DataManager._internal();


  static DataManager get shared => _singleton;
 

}