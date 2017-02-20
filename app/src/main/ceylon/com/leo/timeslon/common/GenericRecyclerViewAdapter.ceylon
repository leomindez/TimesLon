import android.support.v7.widget {
    RecyclerView {
        Adapter = Adapter
    }
}
import android.view {
    ViewGroup
}
import java.util {
    JList=List,
    ArrayList
}

abstract shared class GenericRecyclerViewAdapter<Holder, Item>(
        JList<Item> items = ArrayList<Item>())
        extends Adapter<Holder>()
        given Holder satisfies RecyclerView.ViewHolder {

    "An immutable copy of the items specified at creation time"
    variable [Item*] itemSequence = [];

    shared formal Holder createHolder(ViewGroup? view);
    shared formal void bindView(Holder holder, Item item);

    shared actual Holder onCreateViewHolder(
        ViewGroup? parent, Integer viewType)
            => createHolder(parent);

    shared actual void onBindViewHolder(Holder holder, Integer position)
            => bindView(holder, items.get(position));

    shared actual Integer itemCount {
        return items.size();
    }

    shared Item? getItem(Integer position) => items.get(position);

    shared void addItem(Item item) {
        items.add(item);
        notifyDataSetChanged();
    }

    shared void deleteItem(Integer position) {
        items.remove(position);
        notifyDataSetChanged();
    }

    "Sets the items on the list."
    shared void setItems(JList<Item> otherItems) {
        items.clear();
        items.addAll(otherItems);
        itemSequence = [*otherItems];
        notifyDataSetChanged();
    }

    "Displays the specified items, while keeping a reference to the original items
     set in `setItems`."
    shared void displayItems([Item*] newItems) {
        items.clear();
        for (i in newItems) {
            items.add(i);
        }
        notifyDataSetChanged();
    }
    shared [Item*] itemList => itemSequence;
}