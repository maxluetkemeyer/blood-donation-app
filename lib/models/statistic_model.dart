class Statistic {
  int numberOfFirstTimeDonations;
  int totalBookedAppointments;
  int aged18To27;
  int aged28To37;
  int aged38To47;
  int aged48To57;
  int aged58To68;
  int acceptedRequests;
  int rejectedRequests;
  int cancelledRequests;

  Statistic({
    this.numberOfFirstTimeDonations = 0,
    this.totalBookedAppointments = 0,
    this.aged18To27 = 0,
    this.aged28To37 = 0,
    this.aged38To47 = 0,
    this.aged48To57 = 0,
    this.aged58To68 = 0,
    this.acceptedRequests = 0,
    this.rejectedRequests = 0,
    this.cancelledRequests = 0,
  });

  Statistic copyWith({
    int? numberOfFirstTimeDonations,
    int? totalBookedAppointments,
    int? aged18To27,
    int? aged28To37,
    int? aged38To47,
    int? aged48To57,
    int? aged58To68,
    int? acceptedRequests,
    int? rejectedRequests,
    int? cancelledRequests,
  }) {
    return Statistic(
      numberOfFirstTimeDonations: numberOfFirstTimeDonations ?? this.numberOfFirstTimeDonations,
      totalBookedAppointments: totalBookedAppointments ?? this.totalBookedAppointments,
      acceptedRequests: acceptedRequests ?? this.acceptedRequests,
      aged18To27: aged18To27 ?? this.aged18To27,
      aged28To37: aged28To37 ?? this.aged28To37,
      aged38To47: aged38To47 ?? this.aged38To47,
      aged48To57: aged48To57 ?? this.aged48To57,
      aged58To68: aged58To68 ?? this.aged58To68,
      cancelledRequests: cancelledRequests ?? this.cancelledRequests,
      rejectedRequests: rejectedRequests ?? this.rejectedRequests,
    );
  }
}
