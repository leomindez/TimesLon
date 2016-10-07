import android.app {
    Application
}
import com.github.asifmujteba.easyvolley { EasyVolley {
    initialize,
    dispose
} }

class TimesLonApp() extends Application() {
    shared actual void onCreate(){
        initialize(this);
        super.onCreate();
    }

    shared actual void onTerminate(){
        dispose();
        super.onTerminate();
    }
}