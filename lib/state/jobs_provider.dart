import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constants/api_constants.dart';
import '../models/job_model.dart';
import '../services/api_service.dart';

// Job details state
class JobDetailsState {
  final bool isLoading;
  final String? error;
  final Job? job;

  JobDetailsState({
    this.isLoading = false,
    this.error,
    this.job,
  });

  JobDetailsState copyWith({
    bool? isLoading,
    String? error,
    Job? job,
  }) {
    return JobDetailsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      job: job ?? this.job,
    );
  }
}

// Job details notifier
class JobDetailsNotifier extends StateNotifier<JobDetailsState> {
  final ApiService _apiService = ApiService();
  final int jobId;

  JobDetailsNotifier(this.jobId) : super(JobDetailsState());

  Future<void> loadJobDetails() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _apiService.get(ApiConstants.jobDetails(jobId));
      final jobData = response.data['data'];
      final job = Job.fromJson(jobData);

      state = state.copyWith(
        isLoading: false,
        job: job,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> toggleSaveJob() async {
    if (state.job == null) return;

    try {
      await _apiService.post(ApiConstants.toggleSaveJob(jobId));
      
      // Update the job's saved status
      final currentJob = state.job!;
      final updatedJob = Job.fromJson({
        ...currentJob.toJson(),
        'is_saved': !(currentJob.isSaved ?? false),
      });

      state = state.copyWith(job: updatedJob);
    } catch (e) {
      // Handle error
    }
  }
}

// Job details provider factory
final jobDetailsProvider =
    StateNotifierProvider.family<JobDetailsNotifier, JobDetailsState, int>(
  (ref, jobId) => JobDetailsNotifier(jobId),
);

