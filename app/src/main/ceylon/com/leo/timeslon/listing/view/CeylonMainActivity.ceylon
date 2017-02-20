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
import android.text {
    TextWatcher,
    Editable
}
import java.lang {
    CharSequence
}
import android.widget {
    EditText
}

shared class CeylonMainActivity() extends AppCompatActivity()
        satisfies TopStoriesView {

    shared actual void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.Layout.activity_main);

        value topStoriesPresenter = TopStoriesPresenter();
        topStoriesPresenter.getTopStories("home.json", this);

        assert(is EditText searchField = findViewById(R.Id.searchField),
               is RecyclerView recyclerView = findViewById(R.Id.top_stories_listing));
        searchField.addTextChangedListener(SearchArticles(recyclerView));
    }

    shared actual void showTopStories(Exception|TopStoriesResponse? response) {

        assert(is RecyclerView recyclerView = findViewById(R.Id.top_stories_listing));
        recyclerView.layoutManager = LinearLayoutManager(this);
        value topStoriesListingAdapter = TopStoriesListingAdapter();
        recyclerView.adapter = topStoriesListingAdapter;

        if (is TopStoriesResponse response) {
            topStoriesListingAdapter.setItems(response.results);
        } else {
            Log.e("Response error", response?.message);
        }
    }
}

"Receives events on text change to filter the article list"
class SearchArticles(RecyclerView view) satisfies TextWatcher {

    shared actual void afterTextChanged(Editable? s) {}
    shared actual void beforeTextChanged(CharSequence? s, Integer start, Integer count, Integer after) {}

    shared actual void onTextChanged(CharSequence seq, Integer start, Integer before, Integer count) {
        assert(is TopStoriesListingAdapter adapter = view.adapter);

        "Tells whether to search for items _excluding_ the text"
        value negate = seq.length() > 1 && seq.charAt(0) == '-';
        value text = (if (negate)
            then seq.subSequence(1, seq.length()).string
            else seq.string).trimmed.lowercased;
        adapter.displayItems(if (negate)
            then [ for (item in adapter.itemList) if (!item.matches(text)) item]
            else [ for (item in adapter.itemList) if (item.matches(text)) item]);
    }

}