import android.app {
    Application
}

import com.github.asifmujteba.easyvolley {
    EasyVolley {
        initialize,
        dispose
    }
}

shared class TimesLonApp() extends Application() {
    shared actual void onCreate() {
        initialize(this);
        super.onCreate();
    }

    shared actual void onTerminate() {
        dispose();
        super.onTerminate();
    }
}