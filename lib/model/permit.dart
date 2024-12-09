class Permit {
  String id; 
  String permitId;
  String location;
  DateTime? dateTime; 

  Permit({
    required this.id,
    required this.permitId,
    required this.location,
    this.dateTime, 
  });

  // Factory constructor to create a Permit from a Map
  factory Permit.fromMap(Map<String, dynamic> map) {
    return Permit(
      id: map['id'] ?? '',
      permitId: map['permitId'] ?? '',
      location: map['location'] ?? '',
      dateTime: map['dateTime'] != null
          ? DateTime.tryParse(map['dateTime'])
          : null,
    );
  }

  // Method to convert a Permit to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'permitId': permitId,
      'location': location,
      'dateTime': dateTime?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Permit{id: $id, permitId: $permitId, location: $location, dateTime: $dateTime}';
  }
}
