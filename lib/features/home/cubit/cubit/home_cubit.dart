import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_ganeral/features/home/models/top_headlines_model.dart';
import 'package:news_ganeral/features/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeRepo homeRepo = HomeRepo();
  Future<void> getTopHeadLines() async {
    emit(HomeLoading());
    try {
      final response = await homeRepo.getTopHeadLineArticle();
      emit(HomeSuccess(response));
    } catch (e) {
      emit(HomeErorr(e.toString()));
    }
  }
}
