abstract class IAppLifeCycleService {
  Stream<bool> get isResumedStream;
  bool get isResumed;
}