#ifdef GL_ES
 precision mediump float;
#endif

uniform vec2 u_resolution;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    // Each result will return 1.0 (white) or 0.0 (black).
    // float left = step(0.1,st.x);   // Similar to ( X greater than 0.1 )
    // float bottom = step(0.1,st.y); // Similar to ( Y greater than 0.1 )


    // float top = step(0.1, 1.0 - st.y);
    // float right = step(0.1, 1.0 - st.x);
    // The multiplication of left*bottom will be similar to the logical AND.
    // color = vec3( left * bottom * top * right );

    // bottom -left
    vec2 bl = step(vec2(0.1), st);

    vec2 tr = step(vec2(0.1), 1.0 - st);

    float pct = bl.x * bl.y * tr.x * tr.y;


    color = vec3(pct);


    gl_FragColor = vec4(color,1.0);
}