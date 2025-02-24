part of '../../models.dart';

class AdditionalProperties extends Model {
  final Map<String, dynamic> data;

  AdditionalProperties({
    required this.data,
  });

  factory AdditionalProperties.fromMap(Map<String, dynamic> map) {
    return AdditionalProperties(
      data: map,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }
}
