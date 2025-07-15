<body style="font-family: sans-serif; line-height: 1.6; max-width: 800px; margin: 0 auto; padding: 20px;">

  <h1>📱 Network Subnet Calculator</h1>
  <p>
    A Flutter-based mobile app that calculates subnet allocations for multiple departments based on required host counts.
    Ideal for network engineers, students, or IT administrators who frequently perform subnetting.
  </p>

  <hr />

  <h2>🎯 Features</h2>
  <ul>
    <li>Input base network in CIDR format (e.g., <code>192.168.1.0/24</code>)</li>
    <li>Add any number of departments with host requirements</li>
    <li>Automatically generates:
      <ul>
        <li>Network Address</li>
        <li>Broadcast Address</li>
        <li>Subnet Mask</li>
        <li>IP Range</li>
        <li>CIDR Notation</li>
        <li>Total Usable Hosts</li>
      </ul>
    </li>
    <li>Light and Dark theme support</li>
    <li>Clean and responsive UI</li>
    <li>Clear error messages for invalid inputs</li>
    <li>Developed by: <strong>Thamindu Kalhara</strong></li>
  </ul>

  <hr />

  <h2>🛠 Built With</h2>
  <ul>
    <li><strong>Flutter</strong> SDK 3.6.1</li>
    <li><strong>Dart</strong></li>
    <li><strong>Android Studio Ladybug (2024.2.2)</strong></li>
    <li><strong>Java 17</strong></li>
    <li>📦 Dependencies:
      <ul>
        <li><code>cupertino_icons: ^1.0.8</code></li>
        <li><code>flutter_launcher_icons: ^0.14.4</code></li>
      </ul>
    </li>
  </ul>

  <hr />

  <h2>📷 Screenshots</h2>
  <p><em>(Add screenshots of the app here in the <code>screenshots/</code> folder)</em>
  
  
  <img width="557" height="969" alt="Dark mode interface" src="https://github.com/user-attachments/assets/9f22828d-d951-4c5d-99d1-3b2cbce58015" />

  
  
  
  </p>

  <hr />

  <h2>🚀 Getting Started</h2>
  <h3>1. Clone the Repo</h3>
  <pre><code>git clone https://github.com/Kalhara2000/Network-Subnet-Calculator--Flutter-App.git
cd network_subnet_calculator</code></pre>

  <h3>2. Install Dependencies</h3>
  <pre><code>flutter pub get</code></pre>

  <h3>3. Run the App (Debug Mode)</h3>
  <pre><code>flutter run</code></pre>

  <hr />

  <h2>📦 Build for Release</h2>
  <p><strong>To generate a release APK:</strong></p>
  <pre><code>flutter build apk --release</code></pre>

  <p><strong>To generate an Android App Bundle (AAB):</strong></p>
  <pre><code>flutter build appbundle --release</code></pre>

  <hr />

  <h2>📁 Assets</h2>
  <p>Ensure these image assets are included for launcher icon generation:</p>
  <pre><code>
assets/app_icons/android.png
assets/app_icons/ic_launcher_background.png
assets/app_icons/ic_launcher_foreground.png
  </code></pre>

  <hr />

  <h2>🌐 License</h2>
  <p>MIT License. Free to use, modify, and distribute.</p>

  <hr />

  <h2>🙋‍♂️ Author</h2>
  <p>
    👨‍💻 Thamindu Kalhara <br />
    📫 <em>[Add your LinkedIn or email here]</em> <br />
    🔗 <a href="https://github.com/your-username">https://github.com/your-username</a>
  </p>

</body>
</html>
