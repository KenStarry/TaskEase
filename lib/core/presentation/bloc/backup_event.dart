part of 'backup_bloc.dart';

@immutable
sealed class BackupEvent {}

final class BackupToFirebaseEvent extends BackupEvent {
  final List<TaskModel> allTasks;

  BackupToFirebaseEvent({required this.allTasks});
}
