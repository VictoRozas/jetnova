document.addEventListener('DOMContentLoaded', function() {
  const dniInput = document.getElementById('dni');
  const nombreInput = document.getElementById('nombre');
  const apellidosInput = document.getElementById('apellidos');
  const msgError = document.getElementById('msg-error');

  dniInput.addEventListener('blur', function() {
    const dni = dniInput.value.trim();
    if (/^\d{8}$/.test(dni)) {
      fetch(`https://apiperu.dev/api/dni/${dni}?api_token=7cd978c935a48747949c0e81d77cba033c6e73b9e9b7084f5e42b76a2ef7340f`)
        .then(r => r.json())
        .then(datos => {
          if (datos.success && datos.data) {
            nombreInput.value = datos.data.nombres.toUpperCase();
            apellidosInput.value = `${datos.data.apellido_paterno} ${datos.data.apellido_materno}`.toUpperCase();
            msgError.classList.add('hidden');
          } else {
            msgError.textContent = 'DNI no encontrado en RENIEC.';
            msgError.classList.remove('hidden');
            nombreInput.value = '';
            apellidosInput.value = '';
          }
        })
        .catch(() => {
          msgError.textContent = 'Error consultando RENIEC.';
          msgError.classList.remove('hidden');
          nombreInput.value = '';
          apellidosInput.value = '';
        });
    } else if (dni.length > 0) {
      msgError.textContent = 'DNI inválido. Debe tener 8 dígitos.';
      msgError.classList.remove('hidden');
      nombreInput.value = '';
      apellidosInput.value = '';
    }
  });
});
