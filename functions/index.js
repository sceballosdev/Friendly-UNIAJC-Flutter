const functions = require('firebase-functions');

// Import and initialize the Firebase Admin SDK
const admin = require('firebase-admin');
admin.initializeApp();

// TODO(DEVELOPER): Write the sendNotifications Function here.
exports.sendNotifications = functions.firestore.document('userLocations/{userLocationId}')
    .onUpdate(async (snapshot) => {
        // Notification details.
        console.log('snapshot '+snapshot.after);
        console.log('data '+snapshot.after.data());
        const userData = snapshot.after.data();
        const payload = {
            notification: {
                title: `${userData.name} se ha activado en el mapa`,
                body: `La dirección de ${userData.name} es ${userData.address}`,
                icon: userData.photoUrl || '/images/profile_placeholder.png',
            }
        };

        // Get the list of device tokens.
        const allTokens = await admin.firestore().collection('fcmTokens').get();
        const tokens = [];
        allTokens.forEach((tokenDoc) => {
            tokens.push(tokenDoc.id)
        });

        if (tokens.length > 0) {
            // Send notifications to all tokens.
            const response = await admin.messaging().sendToDevice(tokens, payload);
            await cleanupTokens(response, tokens);
            console.log('Notifications have been sent and tokens cleaned up.');
        }
    });


// Cleans up the tokens that are no longer valid.
function cleanupTokens(response, tokens) {
    // For each notification we check if there was an error.
    const tokensDelete = [];
    response.results.forEach((result, index) => {
        const error = result.error;
        if (error) {
            console.error('Failure sending notifications to', tokens[index], error);
            // Cleanup the tokens who are not registered anymore.
            if (error.code === 'messaging/invalid-registration-token' ||
                error.code === 'messaging/registration-token-not-registered') {
                const deleteTask = admin.firestore().collection('messages').doc(tokens[index]).delete();
                tokensDelete.push(deleteTask);
            }
        }
    });

    return Promise.all(tokensDelete);
}
