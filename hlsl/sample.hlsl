
float2 iResolution;
float2 iMouse;
float iTime;


float4 main(in float2 uv:TEXCOORD0) : SV_TARGET
{


  uv.x *= iResolution.x/iResolution.y;
  uv = uv -0.5;


   float d = length(uv);



    d  = smoothstep(0.4,1.0,d);
    d = step(d,0.01); //circle



  
   
    return float4(d,d,d,1);
}
