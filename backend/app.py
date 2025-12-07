import subprocess
from flask import Flask, request, jsonify
from flask_cors import CORS

def consultar_prolog(consulta):
    comando = [
        'swipl', '-q', '-f', 'vuelos.pl', '-g', consulta, '-t', 'halt'
    ]
    resultado = subprocess.run(comando, capture_output=True, text=True)
    return resultado.stdout.strip()

app = Flask(__name__)
CORS(app)  # Permite peticiones desde el frontend

@app.route('/consultar', methods=['POST'])
def consultar_vuelos():
    data = request.get_json()
    origen = data.get('origen', '').strip().lower()
    destino = data.get('destino', '').strip().lower()
    tipo = data.get('tipo', '').strip().lower()

    vuelos = []

    if tipo == 'directo':
        origen_prolog = f"'{origen}'" if ' ' in origen else origen
        destino_prolog = f"'{destino}'" if ' ' in destino else destino
        consulta = (
            f"forall(buscar_vuelo_directo({origen_prolog},{destino_prolog},Clave,Precio), "
            f"(write(Clave),write(','),write({origen_prolog}),write(','),write({destino_prolog}),write(','),write(Precio),writeln(';')))"
        )
        respuesta = consultar_prolog(consulta)
        lineas = [linea for linea in respuesta.split(';') if linea.strip()]
        for linea in lineas:
            partes = linea.split(',')
            if len(partes) == 4:
                vuelos.append({
                    'clave': partes[0],
                    'origen': partes[1].strip("'"),
                    'destino': partes[2].strip("'"),
                    'escalas': [],
                    'costo': float(partes[3])
                })

    elif tipo == 'escala1':
        origen_prolog = f"'{origen}'" if ' ' in origen else origen
        destino_prolog = f"'{destino}'" if ' ' in destino else destino
        consulta = (
            f"forall(buscar_vuelo_escala1({origen_prolog},{destino_prolog},Clave1,Clave2,Escala1,PrecioTotal), "
            f"(write(Clave1),write(','),write({origen_prolog}),write(','),write(Escala1),write(','),"
            f"write(Clave2),write(','),write(Escala1),write(','),write({destino_prolog}),write(','),"
            f"write(PrecioTotal),writeln(';')))"
        )
        respuesta = consultar_prolog(consulta)
        lineas = [linea for linea in respuesta.split(';') if linea.strip()]
        for linea in lineas:
            partes = linea.split(',')
            if len(partes) == 7:
                vuelos.append({
                    'clave': f"{partes[0]}->{partes[3]}",
                    'origen': partes[1].strip("'"),
                    'destino': partes[5].strip("'"),
                    'escalas': [partes[2].strip("'")],
                    'costo': float(partes[6])
                })

    elif tipo == 'escala2':
        origen_prolog = f"'{origen}'" if ' ' in origen else origen
        destino_prolog = f"'{destino}'" if ' ' in destino else destino
        consulta = (
            f"forall(buscar_vuelo_escala2({origen_prolog},{destino_prolog},Clave1,Clave2,Clave3,Escala1,Escala2,PrecioTotal), "
            f"(write(Clave1),write(','),write({origen_prolog}),write(','),write(Escala1),write(','),"
            f"write(Clave2),write(','),write(Escala1),write(','),write(Escala2),write(','),"
            f"write(Clave3),write(','),write(Escala2),write(','),write({destino_prolog}),write(','),"
            f"write(PrecioTotal),writeln(';')))"
        )
        respuesta = consultar_prolog(consulta)
        lineas = [linea for linea in respuesta.split(';') if linea.strip()]
        for linea in lineas:
            partes = linea.split(',')
            if len(partes) >= 9:
                vuelos.append({
                    'clave': f"{partes[0]}->{partes[3]}->{partes[6]}",
                    'origen': partes[1].strip("'"),
                    'destino': partes[8].strip("'"),
                    'escalas': [partes[2].strip("'"), partes[5].strip("'")],
                    'costo': float(partes[9])
                })

    elif tipo == 'escala3':
        origen_prolog = f"'{origen}'" if ' ' in origen else origen
        destino_prolog = f"'{destino}'" if ' ' in destino else destino
        consulta = (
            f"forall(buscar_vuelo_escala3({origen_prolog},{destino_prolog},Clave1,Clave2,Clave3,Clave4,Escala1,Escala2,Escala3,PrecioTotal), "
            f"(write(Clave1),write(','),write({origen_prolog}),write(','),write(Escala1),write(','),"
            f"write(Clave2),write(','),write(Escala1),write(','),write(Escala2),write(','),"
            f"write(Clave3),write(','),write(Escala2),write(','),write(Escala3),write(','),"
            f"write(Clave4),write(','),write(Escala3),write(','),write({destino_prolog}),write(','),"
            f"write(PrecioTotal),writeln(';')))"
        )
        respuesta = consultar_prolog(consulta)
        lineas = [linea.strip() for linea in respuesta.split(';') if linea.strip()]
        for linea in lineas:
            partes = linea.split(',')
            if len(partes) == 13:
                vuelos.append({
                    'clave': f"{partes[0]}->{partes[3]}->{partes[6]}->{partes[9]}",
                    'origen': partes[1].strip("'"),
                    'destino': partes[11].strip("'"),
                    'escalas': [partes[2].strip("'"), partes[5].strip("'"), partes[8].strip("'")],
                    'costo': float(partes[12])
                })

    disponibilidad = len(vuelos) > 0
    return jsonify({'disponibilidad': disponibilidad, 'vuelos': vuelos})

@app.route('/test', methods=['GET'])
def test():
    return jsonify({'mensaje': 'Backend funcionando correctamente'})

if __name__ == '__main__':
    print("Iniciando servidor Flask en puerto 5000...")
    app.run(port=5000, debug=True)