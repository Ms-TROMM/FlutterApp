importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyCyBLc9J9d4BMHNwki-G0Z25tycD_mXK_w",
  authDomain: "tromm-2021.firebaseapp.com",
  projectId: "tromm-2021",
  storageBucket: "tromm-2021.appspot.com",
  messagingSenderId: "337147493152",
  appId: "1:337147493152:web:391ca74d3f24d58ffc3545",
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});
