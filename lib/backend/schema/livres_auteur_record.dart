import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivresAuteurRecord extends FirestoreRecord {
  LivresAuteurRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "format" field.
  String? _format;
  String get format => _format ?? '';
  bool hasFormat() => _format != null;

  // "descriptions" field.
  List<String>? _descriptions;
  List<String> get descriptions => _descriptions ?? const [];
  bool hasDescriptions() => _descriptions != null;

  // "pied_de_page" field.
  List<String>? _piedDePage;
  List<String> get piedDePage => _piedDePage ?? const [];
  bool hasPiedDePage() => _piedDePage != null;

  // "liens" field.
  List<String>? _liens;
  List<String> get liens => _liens ?? const [];
  bool hasLiens() => _liens != null;

  // "avis" field.
  List<AvisStruct>? _avis;
  List<AvisStruct> get avis => _avis ?? const [];
  bool hasAvis() => _avis != null;

  // "exemples" field.
  List<String>? _exemples;
  List<String> get exemples => _exemples ?? const [];
  bool hasExemples() => _exemples != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _format = snapshotData['format'] as String?;
    _descriptions = getDataList(snapshotData['descriptions']);
    _piedDePage = getDataList(snapshotData['pied_de_page']);
    _liens = getDataList(snapshotData['liens']);
    _avis = getStructList(
      snapshotData['avis'],
      AvisStruct.fromMap,
    );
    _exemples = getDataList(snapshotData['exemples']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livres_auteur');

  static Stream<LivresAuteurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LivresAuteurRecord.fromSnapshot(s));

  static Future<LivresAuteurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LivresAuteurRecord.fromSnapshot(s));

  static LivresAuteurRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LivresAuteurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LivresAuteurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LivresAuteurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LivresAuteurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LivresAuteurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLivresAuteurRecordData({
  String? titre,
  String? format,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'format': format,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class LivresAuteurRecordDocumentEquality
    implements Equality<LivresAuteurRecord> {
  const LivresAuteurRecordDocumentEquality();

  @override
  bool equals(LivresAuteurRecord? e1, LivresAuteurRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titre == e2?.titre &&
        e1?.format == e2?.format &&
        listEquality.equals(e1?.descriptions, e2?.descriptions) &&
        listEquality.equals(e1?.piedDePage, e2?.piedDePage) &&
        listEquality.equals(e1?.liens, e2?.liens) &&
        listEquality.equals(e1?.avis, e2?.avis) &&
        listEquality.equals(e1?.exemples, e2?.exemples) &&
        e1?.image == e2?.image;
  }

  @override
  int hash(LivresAuteurRecord? e) => const ListEquality().hash([
        e?.titre,
        e?.format,
        e?.descriptions,
        e?.piedDePage,
        e?.liens,
        e?.avis,
        e?.exemples,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is LivresAuteurRecord;
}
