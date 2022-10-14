import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'index_state.dart';

class IndexCubit extends Cubit<IndexState> {
  IndexCubit() : super(IndexState(indexValue: 0));
  void changeIndex(int index) => emit(IndexState(indexValue: index));
}
