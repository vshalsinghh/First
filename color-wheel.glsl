#ifdef GL_ES
precision mediump float;
#endif

#define TWO_PI 6.28318530718


uniform vec2 u_resolution;
uniform float u_time;

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix( vec3(1.0), rgb, c.y);
}


void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    vec3 color = vec3(1.);

    // use polar coordinates and normalize value
    vec2 toCenter = vec2(0.5) - st;
    float angle = atan(toCenter.y, toCenter.x);
    float radius = length(toCenter) * 2.;

    // angle is value in -3.14 to 3.14
    // divide  angle by 2pi to get -0.5 to 0.5, add 0.5 to normalize
    float normalizedangle = (angle/TWO_PI)+0.5;

    // increase the radius of 1 angle
    normalizedangle = pow(normalizedangle, abs(sin(u_time * 0.2)));
    
    // make the color wheel green opp of red like google's cw
    // normalizedangle = pow(normalizedangle, 1.5);
    color = hsb2rgb(vec3(normalizedangle,radius,1.0)) ;

    gl_FragColor = vec4(color, 1.);
}