public static class Constants {
    static final int MAX_LAYER = 4;
    static final int MAX_ITEMS = 5; // must be less than 9
    static int CHUNK_W; // Will be set to half of width
    static final int RENDER_CHUNK_RADIUS = 0; // max # chunks from the current on-screen chunks that will be rendered
    static final int LIVE_CHUNK_RADIUS = 2; // max # chunks away from the current on-screen chunks that will be updated
    static final boolean MINIMIZE_GRAPHICS = false; // minimize details

    static final float TRAMPOLINE_SPAWN_CHANCE = 0.25; // [0, 1]
    static final int TRAMPOLINE_W = 100;
    static final int TRAMPOLINE_H = 20;

    static final float FLAG_SPAWN_CHANCE = 1;

    static final int BLOCK_UNIT = 40;

    // Debugging
    static final boolean SPAWN_ENEMIES = true; // default: true
    static final boolean CONSTANT_DAYTIME = false; // default: false
    static final boolean ALLOW_FLYING = false; // default: false
}