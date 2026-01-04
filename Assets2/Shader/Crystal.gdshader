shader_type spatial;


uniform float Refraction_Strength = 0.05;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform float Fresnel_Power = 1.0;
uniform float Emission_Power = 1.0;
uniform float Specular_Power = 1.0;
uniform float Roughness_Power = 0.1;
uniform float Rim_Power = 0.1;
uniform float Blur = 0.0;
uniform vec3 Taint:source_color = vec3(1.0);
void fragment() {
	vec3 view_normal = normalize((VIEW * vec3(NORMAL)).xyz);
	float fresnel = pow(1.0 - dot(NORMAL, VIEW), Fresnel_Power);
	vec2 offset = view_normal.xy * Refraction_Strength * fresnel;
	ALBEDO = texture(SCREEN_TEXTURE, SCREEN_UV + offset,Blur).rgb * Taint;
	EMISSION = texture(SCREEN_TEXTURE, SCREEN_UV + offset).rgb * Taint * Emission_Power;


	SPECULAR = Specular_Power;
	ROUGHNESS = Roughness_Power;
	RIM = Rim_Power;

}