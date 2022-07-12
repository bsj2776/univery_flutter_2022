import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: const Center(
        User user = FirebaseAuth.getInstance().getCurrentUser();
        if (user != null) {
          for (UserInfo profile : user.getProviderData()) {
            // Id of the provider (ex: google.com)
            String providerId = profile.getProviderId();

            // UID specific to the provider
            String uid = profile.getUid();

            // Name, email address, and profile photo Url
            String name = profile.getDisplayName();
            String email = profile.getEmail();
            Uri photoUrl = profile.getPhotoUrl();
            }
        }

    ),
    );
  }
}
