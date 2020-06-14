# Computación visual 2020-1
<!-- 
| Integrante  | Correo   |
|---|---|
| Johnathan Leon Andres Leon Rodriguez | jaleonro@unal.edu.co   |
|Nicolás Parra Ramos| niparrrara@unal.edu.co | -->

# Contenido
## 1. Procesamiento de imagenes
### 1.1 Imagen
- Conversión a escala de grises [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScale)
- Conversión a escala de grises con **shaders** [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScaleShaders/GrayScaleShaders)
- Máscaras de convolución [Folder](https://github.com/-visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/Convolutions/Convolutions)
- Máscaras de convolución con **shaders** [Folder](https://github.com/-visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsShaders/ConvolutionsShaders)
- Conversión a ASCII [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ImgToASCII)
- Histograma [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/histograma)

### 1.2 Video

- Escala de grises [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScaleVideo/GrayScaleVideo)
- Escala de grises con **shaders** [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/GrayScaleVideoShaders)
- Máscara de convolución [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsVideo)
- Máscara de convulución con **shaders** [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/ConvolutionsVideoShaders)
- Conversión a ASCII [Folder](https://github.com/visual-computing-2020-G1/Procesamiento-de-imagenes/tree/master/AsciiVideo )
# 2. Proyecto de visualización de datos del dataset citibike
- React app [Repo]()
- Processing app [Repo]()

#  Resultados
## Imagen
### Conversión a escala de grises
Se usan dos tecnicas para la conversión de la imagen a escala de grises, la primera es con el promedio RGB y la segunda es luma $0.2126R + 0.7152G + 0722B$.<br>
Se puede cambiar del modo oprimiendo la tecla 'c'.
- Promedio <br>
![](/mdImages/imgAVG.PNG)
- Luma
<br>
![](/mdImages/imgLuma.PNG)

## Conversión a escala de grises con **shaders**

Se puede cambiar de modo aplicando la tecla <code>c</code>.
- Promedio y luma 
  <br>
![](/mdImages/imgAVGShader.PNG  =200x400)![](/mdImages/imgLumaShader.PNG =200x400)

## Máscaras de convolución sin y con shaders

Se aplican dos mascaras de convoluciones distintas llamadas sharpen y edge detectión, estan definidas por las matrices: <br>
$$
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
$$
![](/mdImages/edgeDetection.png  =200x400)![](/mdImages/sharper.png =200x400)

## Conversión a ASCII
Se convierte la imagen <code>980px-Fire_breathing_2_Luc_Viatour.jpg</code> a ASCII con la siguiente expresión
    <code>  .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLunT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q</code>
donse se busca mapear con el brillo de cada pixel. <br>
![](/mdImages/imgtoAscii.png)

## Histograma
Es posible observar el histograma de brillo, promedio RGB, Luma(weight), R,G y B de 7 imagenes distintas.

- Click para cambiar de imagen.
-  <code>r </code> y <code> t </code> para cambiar el nivel R.
-  <code>g </code> y <code> h </code> para cambiar el nivel G.
-  <code>b </code> y <code> n </code> para cambiar el nivel B. <br>
![](/mdImages/histograma.png)

