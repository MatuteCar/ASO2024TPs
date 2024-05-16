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

## Codigo funcionando 

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0; 

void *comer_hamburguesa(void *tid)
{
    while (1 == 1)
    { 
        while(turno != (int)tid); 
        // INICIO DE LA ZONA CRÍTICA
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
            pthread_exit(NULL); // forzar terminacion del hilo
        }
        // SALIDA DE LA ZONA CRÍTICA   
        turno = (turno + 1) % NUMBER_OF_THREADS; 
    }
}

int main(int argc, char *argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, ret;
    printf("Hola!, soy el hilo principal. Estoy creando los hilos\n");
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}

