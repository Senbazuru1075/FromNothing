import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// The Cloud Functions for Firebase SDK to create Cloud Functions and set up triggers.

admin.initializeApp();
const db = admin.firestore();

exports.getOnboardingItems = functions.https.onRequest((req, res) => {
    return db.collection('OnboardingItems').get()
        .then((snapshot: any) => {
            let data = snapshot.docs.map((doc: any) => doc.data());
            res.json(data);
        })
        .catch((err: any) => {
            console.log('Error getting onboarding data documents', err);
            res.status(500).json({ error: err });
        });
});