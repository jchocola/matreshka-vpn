abstract class VPNRepository {
  Future<void> initialize();
  Future<void> connect();
  Future<void> disconnect();
}
