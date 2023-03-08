import 'package:flutter_segment/flutter_segment.dart';

// Note: Sadly the Segment library is written in such a way that it is not
// easily mocked/stubbed within tests. This is a side effect of how they
// have chosen to use static methods and a global singleton approach.
// To get around this we can define our own interface for the portion of
// the API we care about and then implement our own Segment
abstract class SegmentInterface {
  Future<void> config({required SegmentConfig options});
  Future<void> track(
      {required String eventName,
      Map<String, dynamic>? properties,
      Map<String, dynamic>? options});
  Future<void> identify(
      {String? userId,
      Map<String, dynamic>? traits,
      Map<String, dynamic>? options});
}
