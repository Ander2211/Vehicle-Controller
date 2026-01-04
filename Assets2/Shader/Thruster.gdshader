shader_type spatial;

render_mode depth_draw_always, blend_mix;

uniform vec4 main_color: source_color;
uniform sampler2D noise_texture: source_color;
uniform vec4 emission : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float emission_energy = 1.0;
uniform float scroll_speed = 1.0;
uniform float alpha_threshold = 0.0;
uniform bool use_threshold = false;
uniform bool invert_boost_direction = false;

void fragment() {
	vec2 moving_uv = UV;
	vec4 noise = texture(noise_texture, moving_uv);
	
	if (invert_boost_direction) {
		moving_uv.y += TIME * scroll_speed;
	} else{
		moving_uv.y -= TIME * scroll_speed;
	}
	
	float noise_value = texture(noise_texture, moving_uv).r;

	ALBEDO = main_color.rgb;
	EMISSION = emission.rgb * emission_energy * noise.rgb;
	float alpha = main_color.a * noise_value;

	if (use_threshold && alpha < alpha_threshold) {
		discard;
	} else {
		ALPHA = alpha;
	}
}
