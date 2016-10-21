import android.os {
    Bundle
}
import android.support.v7.app {
    AppCompatActivity
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
import com.leo.timeslon.listing.view {
    TopStoriesView
}

import com.leo.timeslon {
    R
}

shared class CeylonMainActivity() extends AppCompatActivity() satisfies TopStoriesView {

    shared actual void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.Layout.activity_main);

        TopStoriesPresenter topStoriesPresenter = TopStoriesPresenter();
        topStoriesPresenter.getTopStories("home.json", this);

    }

    shared actual void showTopStories(Exception|TopStoriesResponse? response) {

        assert(is RecyclerView recyclerView = findViewById(R.Id.top_stories_listing));
        recyclerView.layoutManager = LinearLayoutManager(this);
        TopStoriesListingAdapter topStoriesListingAdapter = TopStoriesListingAdapter();
        recyclerView.adapter = topStoriesListingAdapter;

        if(is TopStoriesResponse response){
            topStoriesListingAdapter.addItems(response.results);
        }else{
            Log.e("Response error", response?.message);
        }
    }
}
