class Layer {
    ArrayList<Displayable> items;
    ArrayList<Movable> dynamic;

    Layer() {
        items = new ArrayList<>();
        dynamic = new ArrayList<>();
    }

    public void submitDynamicItem(Movable m) {
        dynamic.add(m);
    }
    public void startFrame() {
        dynamic.clear();
    }

    int getNumItems() {
        return items.size() + dynamic.size();
    }

    void add(Displayable d) {
        items.add(d);
    }

    void display(PVector offset) {
        for (Displayable d : items) {
            if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                d.display();
            }
        }
        for (Movable d : dynamic) {
            if (d.pos.x >= offset.x && d.pos.x <= offset.x + width) {
                d.display();
            }
        }
    }
}