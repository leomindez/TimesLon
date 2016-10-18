import android.os {
    Bundle
}
import android.support.v7.app {
    AppCompatActivity
}
import com.leo.timeslon.network {
    ServiceNetwork
}

import android.support.v7.widget {
    RecyclerView,
    LinearLayoutManager
}
import com.leo.timeslon.listing.model {
    TopStoriesResponse
}
import com.leo.timeslon.listing.adapter {
    TopStoriesListingAdapter
}

import android.util {
    Log
}

shared class CeylonMainActivity() extends AppCompatActivity() {

    shared actual void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.Layout.activity_main);

        ServiceNetwork serviceNetwork = ServiceNetwork();
        serviceNetwork.getStoriesFrom<TopStoriesResponse>("home.json", (Exception|TopStoriesResponse? response) {

            assert(is RecyclerView recyclerView = findViewById(R.Id.top_stories_listing));
            recyclerView.layoutManager = LinearLayoutManager(this);
            TopStoriesListingAdapter topStoriesListingAdapter = TopStoriesListingAdapter();
            recyclerView.adapter = topStoriesListingAdapter;
            if(is TopStoriesResponse response){
                topStoriesListingAdapter.addItems(response.results);
            }else{
                Log.e("Response error", response?.message);
            }
        });

    }
}
