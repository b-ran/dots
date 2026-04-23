{ pkgs, ... }:

let
  androidSdk = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [
      "35"
      "36"
    ];
    buildToolsVersions = [
      "35.0.0"
      "36.0.0"
    ];
    includeEmulator = true;
    includeSystemImages = true;
    systemImageTypes = [ "google_apis" ];
    abiVersions = [ "x86_64" ];
  };
in
{
  environment.variables = {
    ANDROID_HOME = "${androidSdk.androidsdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidSdk.androidsdk}/libexec/android-sdk";
    ANDROID_AVD_HOME = "$HOME/.config/.android/avd";
    JAVA_HOME = "${pkgs.jdk17}/lib/openjdk";
  };

  environment.systemPackages = with pkgs; [
    android-tools
    android-studio-full
    androidSdk.androidsdk
    jdk17
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
