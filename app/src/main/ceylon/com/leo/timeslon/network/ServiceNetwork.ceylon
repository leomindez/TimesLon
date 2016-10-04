import com.androidnetworking{
    AndroidNetworking {
        get
    }
}
import com.androidnetworking.common {
    Priority
}
import okhttp3 {
    Response
}
import com.androidnetworking.error {
    ANError
}
import com.androidnetworking.interfaces {
    OkHttpResponseListener
}


shared class ServiceNetwork() {

   object server {
        shared String baseurl = "https://api.nytimes.com/svc/topstories/v2/";
        shared {<String->String>+} baseParams = {"api-key" -> "779d0d44410f15a1305adc3ca7839156:19:74782749"};
    }

    shared void getStoriesFrom(String endpoint, Anything(ANError|Response?) callback){

        value request = get(server.baseurl);

        request.setTag(this);
        request.addPathParameter(server.baseParams.first.key, server.baseParams.first.item);
        request.setPriority(Priority.low);
        request.build().getAsOkHttpResponse(object satisfies OkHttpResponseListener {
            shared actual void onError(ANError? anError) {
                callback(anError);
            }
            shared actual void onResponse(Response? response) {
                callback(response);
            }
        });
    }
}