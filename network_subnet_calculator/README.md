  <h1>🚀 Network Subnet Calculator - Flutter Setup Guide</h1>

  <p>
    This page explains how to set up the full Flutter development environment to build, test, and release the 
    <strong>Network Subnet Calculator</strong> app.
  </p>

  <hr/>

  <h2>🧰 1. Install Required Tools</h2>

  <h3>📦 Install Flutter SDK</h3>
  <p>Download and install Flutter from the official site:</p>
  <p><a href="https://flutter.dev/docs/get-started/install" target="_blank">flutter.dev/docs/get-started/install</a></p>
  <pre><code>choco install flutter</code></pre>
  <p>🔁 Restart your terminal after installing, and add Flutter to your system <code>PATH</code> if needed.</p>

  <h3>🧰 Install Android Studio</h3>
  <p>Download from: <a href="https://developer.android.com/studio" target="_blank">developer.android.com/studio</a></p>
  <p>Then:</p>
  <ul>
    <li>Go to <strong>Settings > Plugins</strong></li>
    <li>Install both <strong>Flutter</strong> and <strong>Dart</strong> plugins</li>
    <li>Restart Android Studio</li>
  </ul>

  <hr/>

  <h2>🔧 2. Set Up Flutter</h2>

  <h3>✅ Check if Flutter is ready:</h3>
  <pre><code>flutter doctor</code></pre>
  <p>This will show you any missing dependencies. Follow the suggestions until everything has a green checkmark ✔.</p>

  <hr/>

  <h2>📁 3. Clone the Project</h2>
  <pre><code>git clone https://github.com/Kalhara2000/Network-Subnet-Calculator--Flutter-App.git
cd Network-Subnet-Calculator--Flutter-App/network_subnet_calculator</code></pre>

  <hr/>

  <h2>📦 4. Get Dependencies</h2>
  <pre><code>flutter pub get</code></pre>

  <hr/>

  <h2>🖼 5. Generate Launcher Icons (Android)</h2>
  <p>Ensure <code>flutter_launcher_icons</code> is configured in your <code>pubspec.yaml</code> file.</p>
  <pre><code>flutter pub run flutter_launcher_icons</code></pre>

  <hr/>

  <h2>🧪 6. Run the App (Debug Mode)</h2>
  <p>To test your app on an emulator or physical device:</p>
  <pre><code>flutter run</code></pre>

  <hr/>

  <h2>🏗 7. Build for Release</h2>

  <h3>📱 Build APK</h3>
  <pre><code>flutter build apk --release</code></pre>
  <p>Output: <code>build/app/outputs/flutter-apk/app-release.apk</code></p>

  <h3>📦 Build Android App Bundle (AAB)</h3>
  <pre><code>flutter build appbundle --release</code></pre>
  <p>Output: <code>build/app/outputs/bundle/release/app-release.aab</code></p>
  <p>Use this file to upload your app to the Play Store.</p>

  <hr/>

  <h2>📋 Summary of Useful Commands</h2>
  <table border="1" cellpadding="8" cellspacing="0">
    <thead>
      <tr style="background-color:#e3f2fd">
        <th>Purpose</th>
        <th>Command</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Check setup</td><td><code>flutter doctor</code></td></tr>
      <tr><td>Get packages</td><td><code>flutter pub get</code></td></tr>
      <tr><td>Run app</td><td><code>flutter run</code></td></tr>
      <tr><td>Generate launcher icons</td><td><code>flutter pub run flutter_launcher_icons</code></td></tr>
      <tr><td>Build release APK</td><td><code>flutter build apk --release</code></td></tr>
      <tr><td>Build AAB file</td><td><code>flutter build appbundle --release</code></td></tr>
    </tbody>
  </table>

  <hr/>

  <h2>📌 Tip</h2>
  <p>Use Android Studio or Visual Studio Code for better experience with:</p>
  <ul>
    <li>Hot Reload</li>
    <li>Widget Inspector</li>
    <li>Debugging tools</li>
  </ul>

  <hr/>

  <p style="color: gray;">
    © 2025 Thamindu Kalhara – Made with ❤️ using Flutter.
  </p>
