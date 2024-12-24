// Import the functions you need from the SDKs
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.15.0/firebase-app.js";
import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/9.15.0/firebase-auth.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.15.0/firebase-analytics.js";

// Your Firebase configuration
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
const analytics = getAnalytics(app);
const auth = getAuth(app);

// Sign Up Function
document.getElementById('signupForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const email = document.getElementById('signupEmail').value;
    const password = document.getElementById('signupPassword').value;

    try {
        const userCredential = await createUserWithEmailAndPassword(auth, email, password);
        const user = userCredential.user;
        console.log("User signed up:", user);
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Successfully signed up!',
        });
        // Redirect to the dashboard
        redirectToDashboard();
    } catch (error) {
        console.error("Error signing up:", error.message);
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: error.message,
        });
    }
});

// Sign In Function
document.getElementById('signinForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const email = document.getElementById('signinEmail').value;
    const password = document.getElementById('signinPassword').value;

    try {
        const userCredential = await signInWithEmailAndPassword(auth, email, password);
        const user = userCredential.user;
        console.log("User signed in:", user);
        Swal.fire({
            icon: 'success',
            title: 'Welcome Back!',
            text: 'Successfully signed in!',
        });
        // Redirect to the dashboard
        redirectToDashboard();
    } catch (error) {
        console.error("Error signing in:", error.message);
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: error.message,
        });
    }
});

// Redirect to dashboard function
function redirectToDashboard() {
    window.location.href = 'dashboard.html';
}

// Toggle between Sign Up and Sign In forms
window.toggleForm = function(formType) {
    const signupForm = document.getElementById('signupForm');
    const signinForm = document.getElementById('signinForm');
    
    if (formType === 'signin') {
        signupForm.style.display = 'none';
        signinForm.style.display = 'block';
    } else {
        signinForm.style.display = 'none';
        signupForm.style.display = 'block';
    }
}