#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;
    st-= 0.5;

    // using smoothstep to make a line
    float y = length(st - vec2(0.1)); 
    float circ = smoothstep(0.2, 0.2-0.01, y);
    circ -= smoothstep(0.19, 0.19 - 0.01, y);
    vec3 color = vec3(y);

    float pct = plot(st,y);
    // float pct2 = plot(st, y2);
    // color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
    color = vec3(circ);

    gl_FragColor = vec4(color,1.0);
}