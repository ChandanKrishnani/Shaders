   uniform mat4 projectionMatrix;
   uniform mat4 viewMatrix;
   uniform mat4 modelMatrix;
   uniform vec2 uFrequency;
   uniform float uTime;

    attribute vec3 position;
    attribute  vec2 aRandom;
   attribute vec2 uv;
   //  varying float vRandom;
   // varying to pass data from frgment to vertex

   varying vec2 vUv;

   varying float vElevation;

    void main() 
     {
      // vec4 modelPosition = modelMatrix * vec4(position,1);
      // vec4 viewPosition = viewMatrix * modelPosition;
      // vec4 projectedPosition = 



      vec4 modelPosition = modelMatrix * vec4(position , 1.0);
      float elevation = sin(modelPosition.x * uFrequency.x + uTime) * 0.1;
      elevation += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;
      modelPosition.z += elevation;
      vElevation = elevation;

      // modelPosition.y +=uTime;

      // To create a spiky effect on the vertices of materrials
      // modelPosition.z += aRandom * 0.1;
      
      vec4 viewPosition = viewMatrix * modelPosition;
      vec4 projectedPosition = projectionMatrix * viewPosition;
       gl_Position = projectedPosition;
         vUv  = uv;
      // vRandom = aRandom;
      //   gl_Position =  projectionMatrix * viewMatrix * modelMatrix * vec4(position , 1.0);
     }




     // ModeMatrix apply tarnsformation relative to mesh (position , rotation , scale )
   //   viewMatrix apply tarnsformation relative to camera (position , rotation , field of view , near , far)
   //   projectionMatrix  tarnsform the coordinates into the clip space coordinates

   // we have model