#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float time;

void main()
{
    // Calcula el desplazamiento vertical basado en una función sinusoidal
    float speed = 0.5; // Velocidad más lentaa
    float offset = sin(time * speed) * 0.1; // Amplitud de la oscilación
    vec3 pos = aPos;
    pos.y += offset; // Aplica el desplazamiento a la coordenada Y

    // Aplica las transformaciones de modelo, vista y proyección
    gl_Position = projection * view * model * vec4(pos, 1.0);

    // Pasa las coordenadas de textura sin cambios
    TexCoords = aTexCoords;
}
