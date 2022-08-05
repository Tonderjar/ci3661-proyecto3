$nodosVisitados = []

class Nodo

    attr_reader :id, :valor
    
    attr_accessor :nodosAdyacentes

    def initialize(id, valor)
        @id = id
        @valor = valor
    end

    def to_s
        "("+@id.to_s+", "+@valor+")"
    end
end
  

class Grafo
  
    attr_reader :nodos
    attr_accessor :visitados, :V, :ady, :ultimoNodo, :camino

    def initialize(v)
        @V = v
        @ady = Array.new(v) {Array.new}
        @nodos = Array.new(v)
        @visitados = Array.new(v)
        @ultimoNodo = 0
        @camino = Array.new

        for i in 0..(v-1) do
            @ady[i] = []
            @visitados[i] = false
        end 
    end

    def agregarArista(v, w)
        @ady[v].push(w)
    end 
    
    def dfs(v, informacion)
        @camino.push(v)
        dfsUtil(v, informacion)
    end

    def dfsUtil(v, informacion)
    
        # Mark the current node as visited and print it
        @visitados[v] = true

        if @nodos[v].valor == informacion
            if v != @ultimoNodo
                puts("")
                puts("El vertice "+v.to_s+" contiene la informacion buscada")
                puts("")
                puts("El camino fue el siguiente:")
                puts(@camino)
                puts("")
                @ultimoNodo = v
                return
            end
        else
            @ady[v].each { |nodo|
    
                if (!@visitados[nodo])
                    @camino.push(nodo)
                    dfsUtil(nodo, informacion)
                    @camino.pop()
                end
            }
        end

    end
end


#Obtengo numero de vertices
puts("Introduzca el numero de vertices del grafo:")
n = gets.chomp

#Inicializo el grafo
g = Grafo.new(n.to_i)

for i in 0..(g.V-1) do
    puts("")
    puts("Introduzca la informacion para el nodo "+i.to_s+":")
    dato = gets.chomp
    nuevoNodo = Nodo.new(i, dato)
    g.nodos[i] = nuevoNodo
end

#Condicion de parada para el programa
s = true

#Mientras no pida terminar la ejecucion
while s do

    #Imprimo las opciones de acciones disponibles
    puts("Que desea hacer?")
    puts("")
    puts("  1 -> Agregar arista")
    puts("  2 -> Buscar nodo")
    puts("  3 -> Refrescar")
    puts("  4 -> Salir")
    puts("")
    entrada = gets.chomp

    if entrada == "1"

        begin
            puts("")
            puts("Introduzca la arista 'id1 id2':")
            arista = gets.chomp
            datos = arista.split
            g.agregarArista(datos[0].to_i, datos[1].to_i)
            $nodosVisitados = []
            puts("")
        rescue
            puts("Alguno de los nodos no pertenece al grafo")
        end

    elsif entrada == "2"

        g.camino = []
        puts("")
        puts("Introduzca la informacion a buscar")
        puts("")
        informacion = gets.chomp
        g.dfs(g.ultimoNodo, informacion)

    elsif entrada == "3"

        for i in 0..(g.V-1) do
            g.visitados[i] = false
            g.ultimoNodo = 0
        end
        g.camino = []

    elsif entrada == "4"

        s = false
        
    else

        puts("")
        puts("Opcion invalida")
        puts("")
        
    end
end
