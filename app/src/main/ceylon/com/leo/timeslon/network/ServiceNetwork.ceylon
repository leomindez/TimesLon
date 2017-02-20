
import com.github.asifmujteba.easyvolley {
    ASFRequestListener
    , EasyVolley {
      withGlobalQueue
    }
}

import com.google.gson {
    JsonObject,
    Gson
}

import ceylon.interop.java { javaClass }

shared class ServiceNetwork() {

    "Just an object to store parameters in"
    by("Leo Mendez")
    shared object server {
        shared  String baseurl = "https://api.nytimes.com/svc/topstories/v2/";
        shared {<String->String>+} baseParams = {"api-key" -> "779d0d44410f15a1305adc3ca7839156:19:74782749"};
    }

    shared void getStoriesFrom<ResponseModel>(
            "The endpoint from which to retrieve the stories"
            String endpoint,
            "The function to invoke on successful response"
            void callback(Exception | ResponseModel? r))
            given ResponseModel satisfies Object {
        value gq = withGlobalQueue()
            .load(server.baseurl + endpoint);
        for (k->v in server.baseParams) {
            gq.addParam(k, v);
        }
        gq.asJsonObject()
            .setCallback(object satisfies ASFRequestListener<JsonObject> {
                shared actual void onFailure(Exception? e) {
                    callback(e);
                }
                shared actual void onSuccess(JsonObject? response) {
                    callback(Gson().fromJson(response?.string, javaClass<ResponseModel>()));
                }
        }).start();
    }


    shared void getStories(String endpoint, Anything(Exception | JsonObject?) callback){
        withGlobalQueue()
            .load(server.baseurl + endpoint)
            .addParam(server.baseParams.first.key, server.baseParams.first.item)
            .asJsonObject()
            .setCallback(object satisfies ASFRequestListener<JsonObject> {
                onFailure = callback;
                onSuccess = callback;
        }).start();
    }
}