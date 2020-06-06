#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D img;
uniform vec2 imgResolution;
uniform vec2 u_resolution;
varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform bool flag;

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution.xy;
  vec4 color = texture2D(img, vertTexCoord.st);
  float average = (color.x+color.y+color.z)/3;
  float weightedAverage = float(0.2126*color.x+0.7152*color.y+0.0722*color.z);
  gl_FragColor = flag ? vec4(average, average, average, 1.0) : vec4(weightedAverage, weightedAverage, weightedAverage, 1.0);
}