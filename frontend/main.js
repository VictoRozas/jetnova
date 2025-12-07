// Espera a que el DOM esté cargado
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('form-vuelos');
    const mensaje = document.getElementById('mensaje-disponibilidad');
    const tablaBody = document.getElementById('tabla-body');
    const emptyState = document.getElementById('empty-state');
    const loading = document.getElementById('loading');

    // Función para convertir nombres internos a nombres amigables
    function nombreAmigable(nombreInterno) {
        const mapeo = {
            'new_york': 'New York',
            'sao_paulo': 'São Paulo',
            'buenos_aires': 'Buenos Aires',
            'mexico_city': 'México City',
            'los_angeles': 'Los Angeles',
            'madrid': 'Madrid',
            'paris': 'París',
            'london': 'Londres',
            'amsterdam': 'Ámsterdam',
            'frankfurt': 'Fráncfort',
            'berlin': 'Berlín',
            'rome': 'Roma',
            'miami': 'Miami',
            'panama': 'Panamá',
            'santiago': 'Santiago',
            'bogota': 'Bogotá',
            'lima': 'Lima',
            'cusco': 'Cusco',
            'arequipa': 'Arequipa',
            'trujillo': 'Trujillo',
            'piura': 'Piura',
            'iquitos': 'Iquitos',
            'ayacucho': 'Ayacucho',
            'huancayo': 'Huancayo',
            'ica': 'Ica'
        };
        
        return mapeo[nombreInterno] || nombreInterno.toUpperCase();
    }

    // Función para mostrar/ocultar loading
    function showLoading() {
        loading.classList.remove('hidden');
    }

    function hideLoading() {
        loading.classList.add('hidden');
    }

    // Función para mostrar mensaje de estado
    function showMessage(message, type = 'info') {
        mensaje.textContent = message;
        mensaje.className = `text-center py-4 px-6 rounded-xl mb-6 font-medium`;
        
        switch(type) {
            case 'success':
                mensaje.classList.add('bg-gradient-to-r', 'from-emerald-50', 'to-green-50', 'border', 'border-emerald-200', 'text-emerald-700');
                break;
            case 'error':
                mensaje.classList.add('bg-gradient-to-r', 'from-red-50', 'to-pink-50', 'border', 'border-red-200', 'text-red-700');
                break;
            case 'warning':
                mensaje.classList.add('bg-gradient-to-r', 'from-yellow-50', 'to-orange-50', 'border', 'border-yellow-200', 'text-yellow-700');
                break;
            default:
                mensaje.classList.add('bg-gradient-to-r', 'from-blue-50', 'to-indigo-50', 'border', 'border-blue-200', 'text-blue-700');
        }
    }

    // Función para limpiar tabla
    function clearTable() {
        tablaBody.innerHTML = '';
        emptyState.classList.add('hidden');
    }

    // Función para mostrar estado vacío
    function showEmptyState() {
        tablaBody.innerHTML = '';
        emptyState.classList.remove('hidden');
    }

    // Función para crear fila de tabla con Tailwind
    function createTableRow(vuelo) {
        const tr = document.createElement('tr');
        tr.className = 'hover:bg-slate-50 transition-colors duration-200';
        
        const escalasText = vuelo.escalas.length > 0 ? vuelo.escalas.map(escala => nombreAmigable(escala)).join(' → ') : 'Directo';
        const escalasBadge = vuelo.escalas.length > 0 
            ? `<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">${vuelo.escalas.length} escala${vuelo.escalas.length > 1 ? 's' : ''}</span>`
            : '<span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">Directo</span>';

        tr.innerHTML = `
            <td class="px-6 py-4 text-sm font-medium text-slate-900">${vuelo.clave}</td>
            <td class="px-6 py-4 text-sm text-slate-700">
                <div class="flex items-center">
                    <svg class="w-4 h-4 mr-2 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    ${nombreAmigable(vuelo.origen)}
                </div>
            </td>
            <td class="px-6 py-4 text-sm text-slate-700">
                <div class="flex items-center">
                    <svg class="w-4 h-4 mr-2 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    ${nombreAmigable(vuelo.destino)}
                </div>
            </td>
            <td class="px-6 py-4 text-sm text-slate-700">
                <div class="flex items-center space-x-2">
                    ${escalasBadge}
                    ${vuelo.escalas.length > 0 ? `<span class="text-xs text-slate-500">${escalasText}</span>` : ''}
                </div>
            </td>
            <td class="px-6 py-4 text-sm font-semibold text-emerald-600">
                S/. ${vuelo.costo.toFixed(2)}
            </td>
        `;
        
        return tr;
    }

    // Función para agregar animación de entrada a las filas
    function addRowWithAnimation(row, index) {
        row.style.opacity = '0';
        row.style.transform = 'translateY(20px)';
        tablaBody.appendChild(row);
        
        setTimeout(() => {
            row.style.transition = 'all 0.3s ease';
            row.style.opacity = '1';
            row.style.transform = 'translateY(0)';
        }, index * 100);
    }

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        // Capturamos los valores del formulario
        const origen = document.getElementById('origen').value.trim().toLowerCase();
        const destino = document.getElementById('destino').value.trim().toLowerCase();
        const tipo = document.getElementById('tipo-vuelo').value;

        // Mostramos mensaje de búsqueda
        showMessage(`Buscando vuelos de ${nombreAmigable(origen)} a ${nombreAmigable(destino)} (${tipo})...`, 'info');
        showLoading();
        clearTable();

        // Aquí, más adelante, llamaremos al backend usando fetch()
        fetch('http://localhost:5000/consultar', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                origen: origen,
                destino: destino,
                tipo: tipo
            })
        })
        .then(response => response.json())
        .then(data => {
            hideLoading();
            console.log(data); // <- DEBE ESTAR AQUÍ, antes del forEach

            if (data.disponibilidad && data.vuelos.length > 0) {
                showMessage(`¡Encontramos ${data.vuelos.length} vuelo${data.vuelos.length > 1 ? 's' : ''} disponible${data.vuelos.length > 1 ? 's' : ''}!`, 'success');
                clearTable();
                
                data.vuelos.forEach((vuelo, index) => {
                    const row = createTableRow(vuelo);
                    addRowWithAnimation(row, index);
                });
            } else {
                showMessage('No se encontraron vuelos disponibles para esta ruta.', 'warning');
                showEmptyState();
            }
        })
        .catch(error => {
            hideLoading();
            showMessage('Error de conexión con el servidor. Verifica que el backend esté ejecutándose.', 'error');
            showEmptyState();
        });
    });
});
