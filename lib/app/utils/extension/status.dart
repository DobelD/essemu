enum Status { terima, selesai, proses, antar, tolak, batal }

extension StatusExtension on Status {
  String get text {
    switch (this) {
      case Status.terima:
        return 'Pesanan sudah diterima';
      case Status.selesai:
        return 'Pesanan sudah selesai';
      case Status.proses:
        return 'Pesanan sedang diproses';
      case Status.antar:
        return 'Pesanan sedang diantar';
      case Status.tolak:
        return 'Pesanan ditolak';
      case Status.batal:
        return 'Pesanan dibatalkan';
      default:
        return 'Status Tidak Diketahui';
    }
  }
}
