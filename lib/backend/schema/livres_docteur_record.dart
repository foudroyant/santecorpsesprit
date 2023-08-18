import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivresDocteurRecord extends FirestoreRecord {
  LivresDocteurRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "sous_titre" field.
  String? _sousTitre;
  String get sousTitre => _sousTitre ?? '';
  bool hasSousTitre() => _sousTitre != null;

  // "descriptions" field.
  List<String>? _descriptions;
  List<String> get descriptions => _descriptions ?? const [];
  bool hasDescriptions() => _descriptions != null;

  // "liens" field.
  List<String>? _liens;
  List<String> get liens => _liens ?? const [];
  bool hasLiens() => _liens != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _sousTitre = snapshotData['sous_titre'] as String?;
    _descriptions = getDataList(snapshotData['descriptions']);
    _liens = getDataList(snapshotData['liens']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livres_docteur');

  static Stream<LivresDocteurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivresDocteurRecord.fromSnapshot(s));

  static Future<LivresDocteurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivresDocteurRecord.fromSnapshot(s));

  static LivresDocteurRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LivresDocteurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivresDocteurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivresDocteurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivresDocteurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LivresDocteurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLivresDocteurRecordData({
  String? titre,
  String? sousTitre,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'sous_titre': sousTitre,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class LivresDocteurRecordDocumentEquality
    implements Equality<LivresDocteurRecord> {
  const LivresDocteurRecordDocumentEquality();

  @override
  bool equals(LivresDocteurRecord? e1, LivresDocteurRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titre == e2?.titre &&
        e1?.sousTitre == e2?.sousTitre &&
        listEquality.equals(e1?.descriptions, e2?.descriptions) &&
        listEquality.equals(e1?.liens, e2?.liens) &&
        e1?.image == e2?.image;
  }

  @override
  int hash(LivresDocteurRecord? e) => const ListEquality()
      .hash([e?.titre, e?.sousTitre, e?.descriptions, e?.liens, e?.image]);

  @override
  bool isValidKey(Object? o) => o is LivresDocteurRecord;
}
