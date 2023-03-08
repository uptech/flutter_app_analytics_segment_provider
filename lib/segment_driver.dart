import 'package:flutter_segment/flutter_segment.dart';

import 'segment_interface.dart';

class SegmentDriver implements SegmentInterface {
  const SegmentDriver();

  @override
  Future<void> config({required SegmentConfig options}) async {
    return await Segment.config(options: options);
  }

  @override
  Future<void> track(
      {required String eventName,
      Map<String, dynamic>? properties,
      Map<String, dynamic>? options}) async {
    return await Segment.track(
        eventName: eventName, properties: properties, options: options);
  }

  @override
  Future<void> identify(
      {String? userId,
      Map<String, dynamic>? traits,
      Map<String, dynamic>? options}) async {
    return await Segment.identify(
        userId: userId, traits: traits, options: options);
  }
}
