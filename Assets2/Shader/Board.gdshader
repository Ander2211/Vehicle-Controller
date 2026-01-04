shader_type canvas_item;

uniform float size : hint_range(1.0, 100.0) = 25.0;
uniform vec4 color1 : source_color = vec4(1.0, 1.0, 1.0, 1.0); 
uniform vec4 color2 : source_color = vec4(0.7, 0.7, 0.7, 1.0);
uniform float speed : hint_range(0.0, 10.0) = 1.0;
uniform float direction_x : hint_range(-1.0, 1.0) = 1.0; // Horizontal movement
uniform float direction_y : hint_range(-1.0, 1.0) = 1.0; // Vertical movement

void fragment() {
    vec2 pos = FRAGCOORD.xy / size;
    float time_offset = TIME * speed;

    // Use the slider values for direction and normalize them
    vec2 direction = normalize(vec2(direction_x, direction_y));
    vec2 movement = direction * time_offset;

    pos -= movement;
    pos = floor(pos);

    float pattern_mask = mod(pos.x + mod(pos.y, 2.0), 2.0);
    COLOR = mix(color1, color2, pattern_mask);
}
