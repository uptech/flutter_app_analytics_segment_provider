import 'package:flutter_app_analytics_segment_provider/flutter_app_analytics_segment_provider.dart';
import 'package:flutter_segment/flutter_segment.dart';

class IdentifySpy {
  String? userId;
  Map<String, dynamic>? traits;
  Map<String, dynamic>? options;
  IdentifySpy(this.userId, this.traits, this.options);
}

class TrackSpy {
  String eventName;
  Map<String, dynamic>? properties;
  Map<String, dynamic>? options;
  TrackSpy(this.eventName, this.properties, this.options);
}

class SegmentDriverTestDouble implements SegmentInterface {
  List<SegmentConfig> configs = [];
  List<IdentifySpy> identifies = [];
  List<TrackSpy> tracks = [];
  SegmentDriverTestDouble();

  @override
  Future<void> config({required SegmentConfig options}) async {
    configs.add(options);
  }

  @override
  Future<void> track(
      {required String eventName,
      Map<String, dynamic>? properties,
      Map<String, dynamic>? options}) async {
    tracks.add(TrackSpy(eventName, properties, options));
  }

  @override
  Future<void> identify(
      {String? userId,
      Map<String, dynamic>? traits,
      Map<String, dynamic>? options}) async {
    identifies.add(IdentifySpy(userId, traits, options));
  }
}
