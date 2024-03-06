class Bookingslot {
  final String workspace_name;
  final int workspace_id;
  final String booking_date;

  Bookingslot(
      {required this.workspace_id,
      required this.workspace_name,
      required this.booking_date});

  // factory Booking.fromMap(Map<String, dynamic> e) {
  //   return Booking(
  //     booking_date: e['booking_date'],
  //     workspace_id: e['workspace_id'],
  //     workspace_name: e['workspace_name'],
  //   );
  // }

  factory Bookingslot.fromMap(Map<String, dynamic> e) {
    return Bookingslot(
        workspace_id: e['workspace_id'],
        workspace_name: e['workspace_name'],
        booking_date: e['booking_date']);
  }
}
