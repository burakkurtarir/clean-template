abstract class INavigationService {
  Future<void> navigate(String path, {Object data});
  Future<void> navigateAndClear(String path, {Object data});
}
