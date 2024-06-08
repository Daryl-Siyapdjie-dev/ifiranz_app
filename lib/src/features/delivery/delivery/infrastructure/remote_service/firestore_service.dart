import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/position_response.dart';

class FirestoreService {
  final CollectionReference _userPositionsCollection = FirebaseFirestore.instance.collection('livreur_positions');

  Future<void> setLivreurPosition({required latitude, required longitude, required int idCommande, required String status}) async {
    try {
      await _userPositionsCollection.doc(idCommande.toString()).set({'latitude': latitude, 'longitude': longitude, 'status': status});
    } catch (e) {
      print('Error adding user position to Firestore: $e');
    }
  }

  Stream<PositionResponse> streamUserPositions({required int idCommande}) {
    StreamController<PositionResponse> controller = StreamController.broadcast();

    _userPositionsCollection.doc(idCommande.toString()).snapshots().listen((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null) {
          final latitude = data['latitude'] as double? ?? 0.0;
          final longitude = data['longitude'] as double? ?? 0.0;
          final status = data['status'] as String? ?? 'nothing';
          final position = PositionResponse(latitude: latitude, longitude: longitude, status: status);
          controller.add(position);
        }
      }
    });

    return controller.stream;
  }
}
