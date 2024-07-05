// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LivreAuteurStruct extends FFFirebaseStruct {
  LivreAuteurStruct({
    String? titre,
    String? format,
    String? image,
    List<String>? descriptions,
    List<String>? exemples,
    List<AvisStruct>? avis,
    List<String>? piedDePage,
    List<String>? liens,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titre = titre,
        _format = format,
        _image = image,
        _descriptions = descriptions,
        _exemples = exemples,
        _avis = avis,
        _piedDePage = piedDePage,
        _liens = liens,
        super(firestoreUtilData);

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  set titre(String? val) => _titre = val;

  bool hasTitre() => _titre != null;

  // "format" field.
  String? _format;
  String get format => _format ?? '';
  set format(String? val) => _format = val;

  bool hasFormat() => _format != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "descriptions" field.
  List<String>? _descriptions;
  List<String> get descriptions => _descriptions ?? const [];
  set descriptions(List<String>? val) => _descriptions = val;

  void updateDescriptions(Function(List<String>) updateFn) {
    updateFn(_descriptions ??= []);
  }

  bool hasDescriptions() => _descriptions != null;

  // "exemples" field.
  List<String>? _exemples;
  List<String> get exemples => _exemples ?? const [];
  set exemples(List<String>? val) => _exemples = val;

  void updateExemples(Function(List<String>) updateFn) {
    updateFn(_exemples ??= []);
  }

  bool hasExemples() => _exemples != null;

  // "avis" field.
  List<AvisStruct>? _avis;
  List<AvisStruct> get avis => _avis ?? const [];
  set avis(List<AvisStruct>? val) => _avis = val;

  void updateAvis(Function(List<AvisStruct>) updateFn) {
    updateFn(_avis ??= []);
  }

  bool hasAvis() => _avis != null;

  // "pied_de_page" field.
  List<String>? _piedDePage;
  List<String> get piedDePage => _piedDePage ?? const [];
  set piedDePage(List<String>? val) => _piedDePage = val;

  void updatePiedDePage(Function(List<String>) updateFn) {
    updateFn(_piedDePage ??= []);
  }

  bool hasPiedDePage() => _piedDePage != null;

  // "liens" field.
  List<String>? _liens;
  List<String> get liens => _liens ?? const [];
  set liens(List<String>? val) => _liens = val;

  void updateLiens(Function(List<String>) updateFn) {
    updateFn(_liens ??= []);
  }

  bool hasLiens() => _liens != null;

  static LivreAuteurStruct fromMap(Map<String, dynamic> data) =>
      LivreAuteurStruct(
        titre: data['titre'] as String?,
        format: data['format'] as String?,
        image: data['image'] as String?,
        descriptions: getDataList(data['descriptions']),
        exemples: getDataList(data['exemples']),
        avis: getStructList(
          data['avis'],
          AvisStruct.fromMap,
        ),
        piedDePage: getDataList(data['pied_de_page']),
        liens: getDataList(data['liens']),
      );

  static LivreAuteurStruct? maybeFromMap(dynamic data) => data is Map
      ? LivreAuteurStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'titre': _titre,
        'format': _format,
        'image': _image,
        'descriptions': _descriptions,
        'exemples': _exemples,
        'avis': _avis?.map((e) => e.toMap()).toList(),
        'pied_de_page': _piedDePage,
        'liens': _liens,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titre': serializeParam(
          _titre,
          ParamType.String,
        ),
        'format': serializeParam(
          _format,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'descriptions': serializeParam(
          _descriptions,
          ParamType.String,
          isList: true,
        ),
        'exemples': serializeParam(
          _exemples,
          ParamType.String,
          isList: true,
        ),
        'avis': serializeParam(
          _avis,
          ParamType.DataStruct,
          isList: true,
        ),
        'pied_de_page': serializeParam(
          _piedDePage,
          ParamType.String,
          isList: true,
        ),
        'liens': serializeParam(
          _liens,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static LivreAuteurStruct fromSerializableMap(Map<String, dynamic> data) =>
      LivreAuteurStruct(
        titre: deserializeParam(
          data['titre'],
          ParamType.String,
          false,
        ),
        format: deserializeParam(
          data['format'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        descriptions: deserializeParam<String>(
          data['descriptions'],
          ParamType.String,
          true,
        ),
        exemples: deserializeParam<String>(
          data['exemples'],
          ParamType.String,
          true,
        ),
        avis: deserializeStructParam<AvisStruct>(
          data['avis'],
          ParamType.DataStruct,
          true,
          structBuilder: AvisStruct.fromSerializableMap,
        ),
        piedDePage: deserializeParam<String>(
          data['pied_de_page'],
          ParamType.String,
          true,
        ),
        liens: deserializeParam<String>(
          data['liens'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'LivreAuteurStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LivreAuteurStruct &&
        titre == other.titre &&
        format == other.format &&
        image == other.image &&
        listEquality.equals(descriptions, other.descriptions) &&
        listEquality.equals(exemples, other.exemples) &&
        listEquality.equals(avis, other.avis) &&
        listEquality.equals(piedDePage, other.piedDePage) &&
        listEquality.equals(liens, other.liens);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [titre, format, image, descriptions, exemples, avis, piedDePage, liens]);
}

LivreAuteurStruct createLivreAuteurStruct({
  String? titre,
  String? format,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LivreAuteurStruct(
      titre: titre,
      format: format,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LivreAuteurStruct? updateLivreAuteurStruct(
  LivreAuteurStruct? livreAuteur, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    livreAuteur
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLivreAuteurStructData(
  Map<String, dynamic> firestoreData,
  LivreAuteurStruct? livreAuteur,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (livreAuteur == null) {
    return;
  }
  if (livreAuteur.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && livreAuteur.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final livreAuteurData =
      getLivreAuteurFirestoreData(livreAuteur, forFieldValue);
  final nestedData =
      livreAuteurData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = livreAuteur.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLivreAuteurFirestoreData(
  LivreAuteurStruct? livreAuteur, [
  bool forFieldValue = false,
]) {
  if (livreAuteur == null) {
    return {};
  }
  final firestoreData = mapToFirestore(livreAuteur.toMap());

  // Add any Firestore field values
  livreAuteur.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLivreAuteurListFirestoreData(
  List<LivreAuteurStruct>? livreAuteurs,
) =>
    livreAuteurs?.map((e) => getLivreAuteurFirestoreData(e, true)).toList() ??
    [];
