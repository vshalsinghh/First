#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14

uniform float u_time;
uniform vec2 u_resolution;

vec3 colorA = vec3(0.149,0.141,0.912);

void main(){

    vec2 st = gl_FragCoord.xy / u_resolution;
    // st-= 0.5;
    // st *= u_resolution.x / u_resolution.y;

    vec3 color1 = vec3(0.9137, 0.0431, 0.8549);

    vec3 color2 = vec3(0.4745, 0.8824, 0.9569);

    vec3 color3 = vec3(0.0353, 0.3294, 0.6863);

    vec3 color4 = vec3(0.0667, 0.851, 0.1176);
    vec3 color5 = vec3(0.851, 0.851, 0.0667);
    vec3 color6 = vec3(0.9412, 0.6431, 0.1647);
    vec3 color7 = vec3(0.9412, 0.2941, 0.1647);

    vec3 color = vec3(1.);

    

    float yval = 0.2;
    float sinVal = u_time * 0.4;
    yval = sinVal;

    float modval =  mod(u_time, 2.0) - st.y;

    float pct =  cos(abs( st.y - u_time * 0.4));

    float position = (mod(u_time * 0.4, 2. *  PI) ) - 2.8; 
    // pct = modval;
    
    
    
    float d = length(vec2(st.x, st.y) - vec2(0.5, 0.));

    float circle = 1. - smoothstep(0., 0.6- 0.1, d);

    pct = st.y;

    // flag
    // float newy = st.y;

    //rainbow
    float newy =  smoothstep(0., 0.2, circle);
    // color = mix(color, color1, pct) ;
    // color = mix(color, color2, pct);
    // color = mix(color, color3, pct);

    //  color = mix(color, color1, smoothstep(0., 0.2, circle));

    color = mix(color, vec3(1.), smoothstep(-0.001, 0.01, newy));
    
     color = mix(color, color1, smoothstep(-0.001, 0.02, newy));
     color = mix(color, color2, smoothstep(0.12, 0.14, newy));
     color = mix(color, color3, smoothstep(0.26, 0.28, newy));
     color = mix(color, color4, smoothstep(0.40, 0.42, newy));
     color = mix(color, color5, smoothstep(0.54, 0.56, newy));
     color = mix(color, color6, smoothstep(0.68, 0.82, newy));
     color = mix(color, color7, smoothstep(0.82, 0.99, newy));
     color = mix(color, vec3(1.), smoothstep(0.99, 1., newy));


    gl_FragColor = vec4(color,  1.0);
}