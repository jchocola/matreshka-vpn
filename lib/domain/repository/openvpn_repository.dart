abstract class OpenvpnRepository {
  Future<void> initialize();
  Future<void> connect();
  Future<void> disconnect();
}
