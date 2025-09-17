class SearchHistoryModel {
  
  static const String tableName = 'search_history';

  
  static const String columnId = 'id';
  static const String columnSearchHistory = 'search_history';

  
  final int? primaryKey;
  final String? searchHistory;

  const SearchHistoryModel({
    this.primaryKey,
    this.searchHistory,
  });

  
  Map<String, dynamic> toMap() {
    return {
      columnId: primaryKey,
      columnSearchHistory: searchHistory,
    };
  }

  
  factory SearchHistoryModel.fromMap(Map<String, dynamic> map) {
    return SearchHistoryModel(
      primaryKey: map[columnId],
      searchHistory: map[columnSearchHistory],
    );
  }

  
  static const String createTableQuery = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnSearchHistory TEXT
    );
  ''';
}
