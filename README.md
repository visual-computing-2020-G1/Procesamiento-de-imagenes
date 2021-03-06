# Computación visual 2020-1

| Integrante  | Correo   |
|---|---|
| Johnathan Leon Andres Leon Rodriguez | jaleonro@unal.edu.co   |
|Nicolás Parra Ramos| niparrrara@unal.edu.co |
|Daniel Felipe Leyva| dfleyvad@unal.edu.co |

# Contenido
## 1. Objetivos
## 2. Metodología
## 3. Procesamiento de imagenes
### 3.1 Imagen
- Conversión a escala de grises [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScale)
- Conversión a escala de grises con **shaders** [Folder](https://github.com/visual-computing-2020-G1/**Procesamiento**-de-imagenes/tree/master/GrayScaleShaders/GrayScaleShaders)
- Máscaras de convolución [Folder](https://github.com/-visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/Convolutions/Convolutions)
- Máscaras de convolución con **shaders** [Folder](https://github.com/-visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsShaders/ConvolutionsShaders)
- Conversión a ASCII [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ImgToASCII)
- Histograma [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/histograma)

### 3.2 Video

- Escala de grises [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScaleVideo/GrayScaleVideo)
- Escala de grises con **shaders** [Folder](https:/****/github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScaleVideoShaders)
- Máscara de convolución [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsVideo)
- Máscara de convulución con **shaders** [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsVideoShaders)
- Conversión a ASCII [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/VideoToAscii )

# 4. Conclusiones

# 5. Proyecto de visualización de datos del dataset citibike
- React app [Repo](https://github.com/visual-computing-2020-G1/visualizations), [Pagina web](https://visual-computing-2020-g1.github.io/visualizations/).
- Processing app [Repo](https://github.com/visual-computing-2020-G1/Visualizacion-con-Processing).


#  1. Objetivos
- Conocer las generalidades del procesamiento de imagenes en processing tanto por hardware como por software a traves de ejercicios practicos.
- Comparar la eficiencia computacional del metodo por hardware y el metodo por software
- Explorar posibles ideas para un proyecto relacionado con la materia

# 2. Metodología
Metodología:
- Para la medición de la eficiencia computacional se eligio como medida el promedio del Frame rate, el cual fue obtenido almacenando el valor del Frame rate en cada iteración  del metodo draw para 1000 iteraciones y luego dividiendo la suma total por el valor del Frame count.
- Se ejecuto cada programa sin tener ningun otro abierto
  
#  3. Resultados
## 3.1 Imagen


### Conversión a escala de grises
Se usan dos tecnicas para la conversión de la imagen a escala de grises, la primera es con el promedio RGB y la segunda es luma 0.2126R + 0.7152G + 0722B.<br>
Se puede cambiar del modo oprimiendo la tecla 'c'.
- Promedio <br>
![](/mdImages/imgAVG.PNG)
- Luma <br>
![](/mdImages/imgLuma.PNG)

## Conversión a escala de grises con **shaders**

Se puede cambiar de modo aplicando la tecla <code>c</code>.
- Promedio y luma 
  <br>
![](/mdImages/imgAVGShader.PNG)![](/mdImages/imgLumaShader.PNG)

### Máscaras de convolución sin y con shaders

Se aplican dos mascaras de convoluciones distintas llamadas sharpen y edge detectión, estan definidas por las matrices: <br>
![](/mdImages/matrix.PNG)
<!-- $$
edgeDetection  = 
\begin{pmatrix}
-1 & -1 & -1\\
-1 & 9 & -1\\
-1 & -1 & -1
\end{pmatrix}
sharpen  = 
\begin{pmatrix}
1 & -2 & 1\\
-2 & 5 & -2\\
1 & -2 & 1
\end{pmatrix}
$$ -->
![](/mdImages/edgeDetection.png)![](/mdImages/sharper.png)
## Conversión a ASCII
Se convierte la imagen <code>980px-Fire_breathing_2_Luc_Viatour.jpg</code> a ASCII con la siguiente expresión
    <code>  .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLunT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q</code>
donse se busca mapear con el brillo de cada pixel. <br>
![](/mdImages/imgToAscii.png)

### Histograma
Es posible observar el histograma de brillo, promedio RGB, Luma(weight), R,G y B de 7 imagenes distintas.

- Click para cambiar de imagen.
-  <code>r </code> y <code> t </code> para cambiar el nivel R.
-  <code>g </code> y <code> h </code> para cambiar el nivel G.
-  <code>b </code> y <code> n </code> para cambiar el nivel B. <br>
![](/mdImages/histograma.png)

##  3.2 Video
### Conversión a escala de grises
Se procede a convertir el video <code>toma2.mp4</code> diponible [aquí](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/blob/master/GrayScaleVideo/GrayScaleVideo/data/toma2.mp4) a escala de grises usando el promedio y luma. 
- Sin **shaders** <br>
![](/mdImages/grayScaleVideo.PNG)
- con **shaders** <br>
![](/mdImages/grayScaleVideoShaders.PNG)<br>
Los resultados con shaders parecen más eficientes, el procesamiento sin ellos parace menos eficaz en cada frame.
- La conversión de video a escala de grises es más efectiva con **shaders** comparado con el metodo convencional, puesto  que el segundo no cumple  con eficacia la tarea en tiempo real sin embargo el meotodo convecional  tiene un framerate ligeramente superior.
  

### Mascaras de convolución

![](/mdImages/videoConv.PNG)

### ASCII
![](/mdImages/ASCIIVIDEO.PNG)

  
| Especificación| |
|---|---|
| Grafica| Intel HD Graphics 510   |
| Memoria (VRAM)| 128MB |
| Memoria compartida| 4040MB |
| Memoria | 81292 |
| CPU| Intel Pentium(R) 4405U @2.10GHz (4 CPUS)|
  
![](/mdImages/GroupColumn-20200616.svg)

### Medición del limite de hardware
![](/mdImages/FrameLimit.jpeg)

## Conclusiones
- Aunque los shaders pueden simplificar la programación de operaciones como la convolución y la conversion a escala de grises, también dificultan
la implementación de otras como la conversión a ASCII, porque no permiten consultar información de otro hilo y no hay registro de los resultados de 
operaciones anteriores. 
- El poder computacional que ofrece el paralelismo y la optimización de operaciones de los shaders se encuentra restringido a la capacidad del hardware, 
sino se cuenta con una capacidad de computo suficiente se desperdicia su poder. Por más que se optimice no se puede lograr gran diferenci con implementaciones por software si ya se ha alcanzado el limite de la maquina.
- La poca diferencia entre las versiones de software y hardware de los ejercicios se puede explicar por el limite de la capacidad de computo 
de la GPU para las operaciones realizadas, es decir, para los dos casos se esta sobre el limite superior del frame rate y no se puede ir más alla.
Tambien, como en el caso de la escala de grises pueden haber operaciones que resulten más eficientes en su implementación por software.
- Los shaders son una herramienta muy poderosa para la computación visual porque permiten controlar las operaciones a un nivel muy bajo, posibilitando 
implementar funciones de gran complejidad al dividirlas y paralelizarlas en partes más pequeñas y menos complejas.
- Los shaders mejoran notablemente el rendimiento del procesamiento de imagenes y video en tiempo real.
