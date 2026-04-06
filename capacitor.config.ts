import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'org.mirajoco.moneymoves',
  appName: 'Money Moves',
  webDir: 'tools/money-moves',
  server: {
    url: 'https://www.mirajoco.org/tools/money-moves/dashboard',
    cleartext: false,
    androidScheme: 'https',
  },
  android: {
    allowMixedContent: false,
    backgroundColor: '#122012',
  },
  ios: {
    backgroundColor: '#122012',
    contentInset: 'automatic',
    scrollEnabled: true,
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 2000,
      backgroundColor: '#122012',
      androidSplashResourceName: 'splash',
      showSpinner: false,
    },
  },
};

export default config;
