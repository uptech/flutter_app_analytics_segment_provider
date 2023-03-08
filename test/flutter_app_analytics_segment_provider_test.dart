import 'package:flutter_app_analytics/flutter_app_analytics.dart';
import 'package:flutter_app_analytics_segment_provider/flutter_app_analytics_segment_provider.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_doubles.dart';

void main() {
  group('SegmentProvider -', () {
    test('initialize', () async {
      final segmentDriver = SegmentDriverTestDouble();
      final segmentProvider =
          SegmentProvider(writeKey: 'someWriteKey', driver: segmentDriver);
      await segmentProvider.initialize();
      final config = segmentDriver.configs.first;
      expect(
          config.toMap(),
          SegmentConfig(
            writeKey: 'someWriteKey',
            trackApplicationLifecycleEvents: false,
            amplitudeIntegrationEnabled: false,
            debug: false,
          ).toMap());
    });

    test('identify', () async {
      final segmentDriver = SegmentDriverTestDouble();
      final segmentProvider =
          SegmentProvider(writeKey: 'someWriteKey', driver: segmentDriver);
      await segmentProvider.identify(
          userId: 'someUserId', properties: {'house': 'some house adddress'});
      final identify = segmentDriver.identifies.first;
      expect(identify.userId, 'someUserId');
      expect(identify.traits, {'house': 'some house adddress'});
    });

    test('track event', () async {
      final segmentDriver = SegmentDriverTestDouble();
      final segmentProvider =
          SegmentProvider(writeKey: 'someWriteKey', driver: segmentDriver);
      await segmentProvider.trackEvent(AnalyticsEvent(
          name: 'bobLeft',
          properties: {'apartment': 'some apartment address'}));
      final track = segmentDriver.tracks.first;
      expect(track.eventName, 'bobLeft');
      expect(track.properties, {'apartment': 'some apartment address'});
    });

    test('track events', () async {
      final segmentDriver = SegmentDriverTestDouble();
      final segmentProvider =
          SegmentProvider(writeKey: 'someWriteKey', driver: segmentDriver);
      await segmentProvider.trackEvents([
        AnalyticsEvent(
            name: 'bobLeft',
            properties: {'apartment': 'some apartment address'}),
        AnalyticsEvent(name: 'aliceArives')
      ]);
      final firstTrack = segmentDriver.tracks.first;
      expect(firstTrack.eventName, 'bobLeft');
      expect(firstTrack.properties, {'apartment': 'some apartment address'});
      final secondTrack = segmentDriver.tracks[1];
      expect(secondTrack.eventName, 'aliceArives');
      expect(secondTrack.properties, null);
    });
  });
}
