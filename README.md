## CODIGOS ESCRITOS EN PYTHON

###  Punto A :
Luego de ejecutar los códigos **"conhilos.py"** y **"sinhilos.py"**  varias veces, se puede notar que el tiempo de ejecución puede variar significativamente entre ellos y también entre diferentes ejecuciones del mismo codigo.

##### "conhilos.py"

- La previsibilidad del tiempo de ejecución puede ser menor que **"sinhilos.py"** debido a las tareas ejecutadas en diferentes hilos.
- La competencia por recursos del sistema operativo pueden afectar a la previsibilidad.

##### "sinhilos.py"

- Como las tareas se ejecutan secuencialmente, el tiempo de ejecución tiende a ser mas predecible en comparacion con el enfoque con hilos.
- Factores externos como la carga del sistema pueden influir en el tiempo total de ejecución.


####  Conclusión
Mientras que **"sinhilos/py"** tiene una mayor previsibilidad en el tiempo de ejecucion, **"conhilos.py"** puede tener una previsibilidad menor debido a la concurrencia.
La previsibilidad puede variar según el entorno de ejecución.




### Punto B :

En comparación con algunos compañeros sobre el tiempo de ejecucion, notamos una similutud grande en ambos codigos.

### Punto C :

Cuando se ejecuta el código con las líneas comentadas, es menos probable que ocurran condiciones de carrera.
Lo que lleva a resultados mas consistentes en la variable **"acumulador"**
Mientras tanto, al descomentar las lineas 11, 12, 19 y 20, aumenta la posibilidad de condiciones de carrera debido a la competencia por el recurso compartido.
Lo que puede causar resultados impredecibles y diferentes  valores finales para **"acumulador"** en cada ejecución.
