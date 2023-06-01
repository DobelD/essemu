enum StatusMessage { terima, selesai, proses, antar, tolak, batal }

extension StatusMessageExtension on StatusMessage {
  String get text {
    switch (this) {
      case StatusMessage.terima:
        return 'Your order has been entered';
      case StatusMessage.selesai:
        return 'Your order is complete';
      case StatusMessage.proses:
        return 'Your order is being processed';
      case StatusMessage.antar:
        return 'Your order is on its way';
      case StatusMessage.tolak:
        return 'Your order has been rejected';
      case StatusMessage.batal:
        return 'Your order is cancelled';
      default:
        return 'Status Tidak Diketahui';
    }
  }
}
