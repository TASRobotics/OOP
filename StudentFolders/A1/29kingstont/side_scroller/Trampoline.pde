public class Trampoline extends Platform {
    Trampoline(PVector pos, int w, int h) {
        super(pos, w, h);
    }

    @Override
    public void display() {
        fill(0, 255, 243);
        noStroke();

        rect(getPos().x, getPos().y, getW(), getH());
    }
}