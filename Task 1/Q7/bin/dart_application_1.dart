void main(List<String> arguments) {
  final adminRoomAccess = AdminRoomAccess();
  final result = adminRoomAccess(hasAccessCard: true, knowsPassword: false);
  print(result);
}

class AdminRoomAccess {
  String call({required bool hasAccessCard, required bool knowsPassword}) {
    if (hasAccessCard && knowsPassword) {
      return 'Door Opened';
    }
    return 'Access Restricted';
  }
}
