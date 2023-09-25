import '../Model/HistoryResponse.dart';


abstract class HistoryStates{}
class HistoryInitialState extends HistoryStates{}
class HistoryLoadingState extends HistoryStates{}
class  HistorySuccessState extends HistoryStates{
  HistoryResponse historyResponse;
  HistorySuccessState(this.historyResponse);
}
class  HistoryFailState extends HistoryStates{
  String? message;
  HistoryFailState(this.message);
}
