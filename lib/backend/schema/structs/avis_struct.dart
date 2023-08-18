// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvisStruct extends FFFirebaseStruct {
  AvisStruct({
    String? commentaire,
    String? lecteur,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _commentaire = commentaire,
        _lecteur = lecteur,
        super(firestoreUtilData);

  // "commentaire" field.
  String? _commentaire;
  String get commentaire => _commentaire ?? '';
  set commentaire(String? val) => _commentaire = val;
  bool hasCommentaire() => _commentaire != null;

  // "lecteur" field.
  String? _lecteur;
  String get lecteur => _lecteur ?? '';
  set lecteur(String? val) => _lecteur = val;
  bool hasLecteur() => _lecteur != null;

  static AvisStruct fromMap(Map<String, dynamic> data) => AvisStruct(
        commentaire: data['commentaire'] as String?,
        lecteur: data['lecteur'] as String?,
      );

  static AvisStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AvisStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'commentaire': _commentaire,
        'lecteur': _lecteur,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'commentaire': serializeParam(
          _commentaire,
          ParamType.String,
        ),
        'lecteur': serializeParam(
          _lecteur,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvisStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvisStruct(
        commentaire: deserializeParam(
          data['commentaire'],
          ParamType.String,
          false,
        ),
        lecteur: deserializeParam(
          data['lecteur'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvisStruct &&
        commentaire == other.commentaire &&
        lecteur == other.lecteur;
  }

  @override
  int get hashCode => const ListEquality().hash([commentaire, lecteur]);
}

AvisStruct createAvisStruct({
  String? commentaire,
  String? lecteur,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvisStruct(
      commentaire: commentaire,
      lecteur: lecteur,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvisStruct? updateAvisStruct(
  AvisStruct? avis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    avis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvisStructData(
  Map<String, dynamic> firestoreData,
  AvisStruct? avis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (avis == null) {
    return;
  }
  if (avis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && avis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final avisData = getAvisFirestoreData(avis, forFieldValue);
  final nestedData = avisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = avis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvisFirestoreData(
  AvisStruct? avis, [
  bool forFieldValue = false,
]) {
  if (avis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(avis.toMap());

  // Add any Firestore field values
  avis.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvisListFirestoreData(
  List<AvisStruct>? aviss,
) =>
    aviss?.map((e) => getAvisFirestoreData(e, true)).toList() ?? [];
