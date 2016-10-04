import android.app {
    Application
}
import com.androidnetworking {
    AndroidNetworking {
        initialize
    }
}
class TimesLonApp() extends Application() {
    shared actual void onCreate(){
        super.onCreate();
        initialize(this);
    }
}