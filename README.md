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
### Mascaras de convolución

![](/mdImages/videoConv.PNG)

### ASCII
![](/mdImages/ASCIIVIDEO.PNG)

![](/mdImages/GroupColumn-20200616.svg)


## Conclusiones
- La conversión de video a escala de grises es más efectiva con **shaders** comparado con el metodo convencional, puesto  que el segundo no cumple  con eficacia la tarea en tiempo real sin embargo el meotodo convecional  tiene un framerate ligeramente superior.
  

