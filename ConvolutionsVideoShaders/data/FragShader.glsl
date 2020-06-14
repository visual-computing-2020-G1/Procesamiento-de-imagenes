#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D img;
uniform vec2 texOffset;
varying vec4 vertColor;
varying vec4 vertTexCoord;
uniform bool flag;

void main() {
  vec2 tc0 = vertTexCoord.st + vec2(-texOffset.s, -texOffset.t);
  vec2 tc1 = vertTexCoord.st + vec2(         0.0, -texOffset.t);
  vec2 tc2 = vertTexCoord.st + vec2(+texOffset.s, -texOffset.t);
  vec2 tc3 = vertTexCoord.st + vec2(-texOffset.s,          0.0);
  vec2 tc4 = vertTexCoord.st + vec2(         0.0,          0.0);
  vec2 tc5 = vertTexCoord.st + vec2(+texOffset.s,          0.0);
  vec2 tc6 = vertTexCoord.st + vec2(-texOffset.s, +texOffset.t);
  vec2 tc7 = vertTexCoord.st + vec2(         0.0, +texOffset.t);
  vec2 tc8 = vertTexCoord.st + vec2(+texOffset.s, +texOffset.t);

  vec4 col0 = texture2D(img, tc0);
  vec4 col1 = texture2D(img, tc1);
  vec4 col2 = texture2D(img, tc2);
  vec4 col3 = texture2D(img, tc3);
  vec4 col4 = texture2D(img, tc4);
  vec4 col5 = texture2D(img, tc5);
  vec4 col6 = texture2D(img, tc6);
  vec4 col7 = texture2D(img, tc7);
  vec4 col8 = texture2D(img, tc8);

  vec4 sharpen = (col0*1 + col1*-2 + col2*1 + col3*-2 + col4*5 + col5*-2 + col6*1 + col7*-2 + col8*1);
  vec4 edgeDetection = (col0*-1 + col1*-1 + col2*-1 + col3*-1 + col4*9 + col5*-1 + col6*-1 + col7*-1 + col8*-1);
  gl_FragColor = flag ? vec4(edgeDetection.rgb, 1.0) : sharpen;
}