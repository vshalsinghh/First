#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_resolution;
uniform vec2 u_camera;

float circle(vec2 st, vec2 p, float r){
    //p- position of circle, st- uv coords, r-radius
    float d = length(st - p);

    float value = smoothstep(r, r - 0.001, d);


    return value;
}

float band(float low, float high, float blur, float axis){
    float aband = smoothstep(high, high - blur, axis);
    aband -= smoothstep( -low, -low - blur, axis);

    return aband;
}

// float square(ve)

float rectangle(vec2 st, float top, float bottom, float left, float right, float blur){
    
    float bandx = band(left, right, blur, st.x);
    float bandy =  band(bottom, top, blur, st.y);
    return bandx * bandy;
}



void main() {
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    st -= 0.5;
    st.x *= u_resolution.x / u_resolution.y;

    // float pct = circle(st, vec2(0.,0.), 0.5);

    float pct = smoothstep(0.3, 0.3-0.01, st.x);
    pct -= smoothstep( -0.2, -0.2 - 0.01, st.x);

    float pcty = smoothstep(0.3, 0.3-0.01, st.y);
    pcty -= smoothstep( -0.2, -0.2 - 0.01, st.y);



    float box = rectangle(st, 0.4, 0.4, 0.3 , 0.3, 0.001);

    // float mask = band(0.2, 0.2, 0.001, st.x);
    st.y += 0.2;

    vec3 color = vec3(box);
    

	gl_FragColor = vec4(color,1.0);
}
