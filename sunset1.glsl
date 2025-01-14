#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14

uniform float u_time;
uniform vec2 u_resolution;

vec3 colorA = vec3(0.149,0.141,0.912);

void main(){

    vec2 st = gl_FragCoord.xy / u_resolution;
    st-= 0.5;
    st *= u_resolution.x / u_resolution.y;

    vec3 color1 = vec3(0.851, 0.1333, 0.0667);

    vec3 color2 = vec3(0.7529, 0.3216, 0.0392);

    vec3 color3 = vec3(0.0078, 0.102, 0.2157);

    vec3 color4 = vec3(0.851, 0.1333, 0.0667);

    vec3 color = vec3(0.);

    

    float yval = 0.2;
    float sinVal = u_time * 0.4;
    yval = sinVal;

    float modval =  mod(u_time, 2.0) - st.y;

    float pct =  cos(abs( st.y - u_time * 0.4));

    float position = (mod(u_time * 0.4, 2. *  PI) ) - 2.8; 
    // pct = modval;
    
    
    
    float d = length(vec2(st.x, st.y ) - vec2(0., position));

    float circle = 1. - smoothstep(0.1, 0.1- 0.05, d);

    



    // color = mix(color, color1, pct) ;
    // color = mix(color, color2, pct);
    // color = mix(color, color3, pct);
     color = mix(color1, color2, pct);
     color = mix(color2, color3, pct) * circle;


    gl_FragColor = vec4(color,  1.0);
}