#ifdef GL_ES
precision mediump float;
#endif


uniform vec2 u_resolution;

void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;

    vec3 basew = vec3(1.0);

    vec3 color1 = vec3(0.7, 0.05, 0.2314);
    vec3 color2 = vec3(0.2118, 0.7373, 0.1294);

    float mixFunction = step(0.5, st.y);

    vec3 color = mix(basew, color1, mixFunction);

    gl_FragColor = vec4(color, 1.);
}