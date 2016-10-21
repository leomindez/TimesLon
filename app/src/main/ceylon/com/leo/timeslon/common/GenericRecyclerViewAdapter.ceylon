import android.support.v7.widget {
    RecyclerView {
        Adapter = Adapter
    }
}
import android.view {
    ViewGroup
}
import java.util {
    ArrayList
}

 abstract shared class GenericRecyclerViewAdapter<Holder, Item>(variable ArrayList<Item> items = ArrayList<Item>()) extends Adapter<Holder>() given Holder satisfies RecyclerView.ViewHolder {

     shared formal Holder createHolder(ViewGroup? view);
     shared formal void bindView(Holder holder, Item item);

     shared actual Holder onCreateViewHolder(ViewGroup? parent, Integer viewType) => createHolder(parent);

     shared actual void onBindViewHolder(Holder holder, Integer position)  => bindView(holder, items.get(position));

     shared actual Integer itemCount {
            return items.size();
         }


     shared Item? getItem(Integer position) => items.get(position);

     shared void addItem(Item item) {
         items.add(item);
         notifyDataSetChanged();
     }

     shared void deteleItem(Integer position) {
         items.remove(position);
         notifyDataSetChanged();
     }

      shared void addItems(ArrayList<Item> otherItems) {
          items.addAll(otherItems);
          notifyDataSetChanged();
      }
}