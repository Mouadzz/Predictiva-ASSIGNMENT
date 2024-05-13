part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

// final class WallpaperListLoading extends DashboardState {}

// final class WallpaperListLoaded extends DashboardState {
//   WallpaperListLoaded({required this.newWallpaperList});

//   final WallpaperListEntity newWallpaperList;
// }

// final class WallpaperListError extends DashboardState {
//   WallpaperListError({required this.failure});

//   final Failure failure;
// }
