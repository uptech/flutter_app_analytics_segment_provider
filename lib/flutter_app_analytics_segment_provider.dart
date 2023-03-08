library flutter_app_analytics_segment_provider;

import 'package:flutter_app_analytics/flutter_app_analytics.dart';
import 'package:flutter_segment/flutter_segment.dart';

/// A Segment Provider for Flutter app analytics.
class SegmentProvider implements AnalyticsProvider {
  String _writeKey = '';
  String? _userId;

  bool _initialized = false;

  SegmentProvider({
    required String writeKey,
    String? userId,
  }) {
    _writeKey = writeKey;
    _userId = userId;
  }

  initialize() async {
    if (_initialized) {
      return;
    }
    await Segment.config(
      options: SegmentConfig(
        writeKey: _writeKey,
        trackApplicationLifecycleEvents: false,
        amplitudeIntegrationEnabled: false,
        debug: false,
      ),
    );
    _initialized = true;
  }

  @override
  Future<void> identify({
    String? userId,
    Map<String, dynamic>? properties,
  }) async {
    initialize();
    if (userId != null && properties != null) {
      await Segment.identify(userId: _userId, traits: properties);
    } else if (userId != null) {
      await Segment.identify(userId: _userId);
    } else if (properties != null) {
      await Segment.identify(traits: properties);
    }
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    initialize();
    await Segment.track(eventName: event.name, properties: event.properties);
  }

  @override
  Future<void> trackEvents(List<AnalyticsEvent> events) async {
    initialize();
    await Future.forEach<AnalyticsEvent>(events, (event) => trackEvent(event));
  }
}
