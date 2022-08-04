class Nodo

    attr_reader :valor, :info

    def initialize(valor, info)
        @valor = valor
        @info = info
        @nodosAdyacentes = []
    end

    def agregarArista(nodoAdyacente)
        @nodosAdyacentes << nodoAdyacente
    end

    def to_s
        "("+@valor.to_s+", "+@info+")"
    end
end
  

class Grafo
  
    attr_reader :nodos

    def initialize
        @nodos = []
    end

    def agregarNodo(nodo)
        @nodos[nodo.valor] = nodo
    end

    def agregarArista(nodo1, nodo2)
        @nodos[nodo1].agregarArista(@nodos[nodo2])
        @nodos[nodo2].agregarArista(@nodos[nodo1])
    end

    def dfs
        #dfs
    end

    def to_s
        #Quizas implementar
    end


end

#Inicializo el grafo
g = Grafo.new

#Condicion de parada para el programa
s = true

#Mientras no pida terminar la ejecucion
while s do

    #Imprimo las opciones de acciones disponibles
    puts("Que desea hacer?")
    puts("")
    puts("  1 -> Agregar nodo")
    puts("  2 -> Agregar arista")
    puts("  3 -> Buscar nodo")
    puts("  4 -> Salir")
    puts("")
    entrada = gets.chomp

    if entrada == "1"

        puts("")
        puts("Introduzca el vertice 'id info':")
        nodo = gets.chomp
        datos = nodo.split
        nuevoNodo = Nodo.new(datos[0].to_i, datos[1])
        g.agregarNodo(nuevoNodo)
        puts(g)
        puts("")

    elsif entrada == "2"

        puts("")
        puts("Introduzca la arista 'id1 id2':")
        arista = gets.chomp
        datos = arista.split
        g.agregarArista(datos[0].to_i, datos[1].to_i)
        puts("")

    elsif entrada == "3"

        puts("Opcion3")

    elsif entrada == "4"

        s = false

    else

        puts("")
        puts("Opcion invalida")
        puts("")

    end
end
