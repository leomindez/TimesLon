import android.os {
    Bundle
}
import android.support.v7.app {
    AppCompatActivity
}
import com.leo.timeslon.network {
    ServiceNetwork
}
import com.androidnetworking.error {
    ANError
}
import okhttp3 {
    Response
}
import android.util {
    Log
}

shared class CeylonMainActivity() extends AppCompatActivity() {

    shared actual void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.Layout.activity_main);

        ServiceNetwork().getStoriesFrom("home.json", (ANError|Response? response) {

        });
    }
}
