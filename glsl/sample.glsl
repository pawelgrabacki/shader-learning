

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
vec2 position = vec2(0.5,0.5);


vec3 pallete (float t){


    vec3 a =vec3(0.5,0.5,0.5);
    vec3 b =vec3(0.5,0.5,0.5);
    vec3 c =vec3(1.0,1.0,1.0);
    vec3 d =vec3(0.263,0.416,0.557);

    return a + b*cos( 6.28318*(c*t+d) );//color pallete
}

void main() {




	vec2 uv = gl_FragCoord.xy/u_resolution;
    uv.x *= u_resolution.x/u_resolution.y;//normalize uv
    uv = uv-0.5;
    uv = uv*4.0;
    uv = fract(uv);
    uv-= 0.5;

    vec2 uv0 = uv;

  
    float d = length(uv);//circle
    
      vec3 col = pallete(length(uv0)+u_time);
    
    d = sin(d*8.+u_time)/8.; //circle movement
    d = abs(d);
   
   
    d = 0.02/d;


    col *= d;


	gl_FragColor = vec4(col,1.0);
}