part of 'backup_bloc.dart';

@immutable
sealed class BackupState extends Equatable {}

final class BackupInitial extends BackupState {
  @override
  List<Object?> get props => [];
}

final class BackupLoading extends BackupState {
  @override
  List<Object?> get props => [];
}

final class BackupSuccess extends BackupState {
  @override
  List<Object?> get props => [];
}

final class BackupFailed extends BackupState {

  final String errorMessage;

  BackupFailed({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

