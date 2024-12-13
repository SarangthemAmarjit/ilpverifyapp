import '../model/permit.dart';

List<Permit> dummypermit = [ 

  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
  Permit(id: "dupli", permitId: "12345", location: "locations",dateTime: DateTime.now()),
];

  // List of steps represented as a list of maps
  List<Map<String, String>> QrscanningSteps = [
    {
      "step": "1",
      "title": "Open the App",
      "description": "Launch the app that supports ILP QR code scanning on your smartphone."
    },
    {
      "step": "2",
      "title": "Navigate to Scan Section",
      "description": "Go to the section of the app where QR code scanning is available. Usually labeled as 'Scan QR' or similar."
    },
    {
      "step": "3",
      "title": "Allow Camera Permissions",
      "description": "If prompted, grant the app permission to access your device's camera."
    },
    {
      "step": "4",
      "title": "Align QR Code",
      "description": "Position the ILP QR code within the frame of the camera viewfinder displayed on the app."
    },
    {
      "step": "5",
      "title": "Initiate Scan",
      "description": "Hold your device steady and let the app scan the QR code automatically."
    },
    {
      "step": "6",
      "title": "Verify Details",
      "description": "Once scanned, the app will display the ILP details. Verify the information shown."
    },
    {
      "step": "7",
      "title": "Save or Proceed",
      "description": "You can choose to save the scanned details or proceed with the next action as required by the app."
    }
  ];