import { initializeApp } from "firebase/app";
import { getAuth, 
         createUserWithEmailAndPassword, 
         signInWithEmailAndPassword, 
         signOut,
         onAuthStateChanged } from "firebase/auth";
import { getFirestore } from "firebase/firestore";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyB57IoE_JxtDQLGde8i6Regpwh2FVVcmcw",
  authDomain: "abaya-310cf.firebaseapp.com",
  projectId: "abaya-310cf",
  storageBucket: "abaya-310cf.firebasestorage.app",
  messagingSenderId: "87236198273",
  appId: "1:87236198273:web:e96784e13abb4af0dab280",
  measurementId: "G-JSH4TNDH9X"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app);

// Authentication Functions
export const signUp = async (email, password) => {
  try {
    const userCredential = await createUserWithEmailAndPassword(auth, email, password);
    return userCredential.user;
  } catch (error) {
    throw error;
  }
};

export const signIn = async (email, password) => {
  try {
    const userCredential = await signInWithEmailAndPassword(auth, email, password);
    return userCredential.user;
  } catch (error) {
    throw error;
  }
};

export const logout = async () => {
  try {
    await signOut(auth);
  } catch (error) {
    throw error;
  }
};

// Authentication State Observer
export const authStateObserver = (callback) => {
  return onAuthStateChanged(auth, callback);
};

export { auth, db };