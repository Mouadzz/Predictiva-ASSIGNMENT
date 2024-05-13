import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
      // {
      // required this.getWallpaperList,
      // }
      )
      : super(DashboardInitial()) {
    // on<GetWallpaperListEvent>(_getWallpaperListHandler);
  }

  // final GetWallpaperList getWallpaperList;

  // Future<void> _getWallpaperListHandler(
  //   GetWallpaperListEvent event,
  //   Emitter<DashboardState> emit,
  // ) async {
  //   emit(WallpaperListLoading());
  //   final failureOrWallpapers = await getWallpaperList.call(
  //     params: GetWallpaperListParams(page: event.page),
  //   );
  //   failureOrWallpapers.fold(
  //     (newFailure) => emit(WallpaperListError(failure: newFailure)),
  //     (newWallpaperList) =>
  //         emit(WallpaperListLoaded(newWallpaperList: newWallpaperList)),
  //   );
  // }
}
