% REGLA IMPLEMENTADA:
% =============================================================================
% SOLO LIMA PUEDE TENER VUELOS DIRECTOS A EUROPA
% Las otras ciudades peruanas (Cusco, Arequipa, Trujillo, etc.) pueden tener 
% vuelos directos solo a Sudamérica, pero NO a Europa.
% Para llegar desde esas otras ciudades a Europa, se necesita al menos una escala.
% Ciudades europeas: madrid, paris, london, amsterdam, frankfurt, berlin, rome
% =============================================================================

% Mapeo de ciudades peruanas
nombre_ciudad(lima, lima).
nombre_ciudad(cusco, cusco).
nombre_ciudad(arequipa, arequipa).
nombre_ciudad(trujillo, trujillo).
nombre_ciudad(piura, piura).
nombre_ciudad(iquitos, iquitos).
nombre_ciudad(ayacucho, ayacucho).
nombre_ciudad(huancayo, huancayo).
nombre_ciudad(ica, ica).

% Mapeo de ciudades internacionales 
nombre_ciudad('new york', new_york).
nombre_ciudad('new_york', new_york).
nombre_ciudad('newyork', new_york).
nombre_ciudad('sao paulo', sao_paulo).
nombre_ciudad('sao_paulo', sao_paulo).
nombre_ciudad('saopaulo', sao_paulo).
nombre_ciudad('buenos aires', buenos_aires).
nombre_ciudad('buenos_aires', buenos_aires).
nombre_ciudad('buenosaires', buenos_aires).
nombre_ciudad('mexico city', mexico_city).
nombre_ciudad('mexico_city', mexico_city).
nombre_ciudad('mexicocity', mexico_city).
nombre_ciudad('los angeles', los_angeles).
nombre_ciudad('los_angeles', los_angeles).
nombre_ciudad('losangeles', los_angeles).

% Mapeo de ciudades europeas
nombre_ciudad(madrid, madrid).
nombre_ciudad(paris, paris).
nombre_ciudad(londres, londres).
nombre_ciudad(amsterdam, amsterdam).
nombre_ciudad(frankfurt, frankfurt).
nombre_ciudad(berlin, berlin).
nombre_ciudad(roma, roma).

% Mapeo de otras ciudades
nombre_ciudad(miami, miami).
nombre_ciudad(panama, panama).
nombre_ciudad(santiago, santiago).
nombre_ciudad(bogota, bogota).

% =============================================================================

% --- LISTA DE CIUDADES PRINCIPALES DE PERÚ ---
ciudad_peru(lima).
ciudad_peru(cusco).
ciudad_peru(arequipa).
ciudad_peru(trujillo).
ciudad_peru(piura).
ciudad_peru(iquitos).
ciudad_peru(ayacucho).
ciudad_peru(huancayo).
ciudad_peru(ica).


% --- VUELOS NACIONALES (directos entre ciudades principales de Perú) ---

vuelo(v01, lima, cusco, 150).
vuelo(v02, lima, arequipa, 120).
vuelo(v03, lima, trujillo, 100).
vuelo(v04, lima, piura, 110).
vuelo(v05, lima, iquitos, 130).
vuelo(v06, lima, ayacucho, 110).
vuelo(v07, lima, huancayo, 105).
vuelo(v08, lima, ica, 115).

vuelo(v09, cusco, lima, 150).
vuelo(v10, arequipa, lima, 120).
vuelo(v11, trujillo, lima, 100).
vuelo(v12, piura, lima, 110).
vuelo(v13, iquitos, lima, 130).
vuelo(v14, ayacucho, lima, 110).
vuelo(v15, huancayo, lima, 105).
vuelo(v16, ica, lima, 115).

% --- VUELOS NACIONALES DIRECTOS ENTRE CIUDADES SECUNDARIAS DE PERÚ ---

vuelo(v17, cusco, arequipa, 100).
vuelo(v18, arequipa, cusco, 100).
vuelo(v19, trujillo, piura, 90).
vuelo(v20, piura, trujillo, 90).
vuelo(v21, cusco, trujillo, 150).
vuelo(v22, trujillo, cusco, 150).
vuelo(v23, arequipa, trujillo, 140).
vuelo(v24, trujillo, arequipa, 140).
vuelo(v25, arequipa, piura, 160).
vuelo(v26, piura, arequipa, 160).
vuelo(v27, cusco, piura, 155).
vuelo(v28, piura, cusco, 155).
vuelo(v29, iquitos, ayacucho, 135).
vuelo(v30, ayacucho, iquitos, 135).
vuelo(v31, huancayo, ica, 120).
vuelo(v32, ica, huancayo, 120).
vuelo(v33, arequipa, iquitos, 190).
vuelo(v34, iquitos, arequipa, 190).
vuelo(v35, ayacucho, trujillo, 95).
vuelo(v36, trujillo, ayacucho, 95).
vuelo(v37, arequipa, ayacucho, 145).
vuelo(v38, ayacucho, arequipa, 145).
vuelo(v39, cusco, ayacucho, 155).
vuelo(v40, ayacucho, cusco, 155).
vuelo(v41, piura, iquitos, 160).
vuelo(v42, iquitos, piura, 160).
vuelo(v43, trujillo, huancayo, 130).
vuelo(v44, huancayo, trujillo, 130).
vuelo(v45, ica, arequipa, 130).
vuelo(v46, arequipa, ica, 130).
vuelo(v47, huancayo, cusco, 130).
vuelo(v48, cusco, huancayo, 130).
vuelo(v49, piura, ayacucho, 140).
vuelo(v50, ayacucho, piura, 140).
vuelo(v51, huancayo, arequipa, 130).
vuelo(v52, arequipa, huancayo, 130).
vuelo(v53, ayacucho, huancayo, 130).
vuelo(v54, huancayo, ayacucho, 120).
vuelo(v55, piura, huancayo, 135).



% --- VUELOS INTERNACIONALES DESDE CIUDADES DE PERÚ ---

% Lima internacional
vuelo(v100, lima, miami, 600).
vuelo(v101, lima, panama, 400).
vuelo(v102, lima, mexico_city, 450).
vuelo(v103, lima, new_york, 700).
vuelo(v104, lima, madrid, 850).
vuelo(v105, lima, amsterdam, 950).
vuelo(v106, lima, frankfurt, 970).
vuelo(v107, lima, londres, 900).
vuelo(v108, lima, paris, 900).
vuelo(v109, lima, berlin, 980).
vuelo(v110, lima, roma, 920).
vuelo(v111, lima, sao_paulo, 300).
vuelo(v112, lima, buenos_aires, 350).
vuelo(v113, lima, santiago, 250).
vuelo(v114, lima, bogota, 320).
vuelo(v115, lima, los_angeles, 750).

% Cusco internacional
vuelo(v116, cusco, miami, 670).
vuelo(v117, cusco, panama, 420).
vuelo(v118, cusco, mexico_city, 480).
vuelo(v119, cusco, new_york, 770).
vuelo(v125, cusco, sao_paulo, 430).
vuelo(v126, cusco, buenos_aires, 380).
vuelo(v127, cusco, santiago, 270).
vuelo(v128, cusco, bogota, 330).
vuelo(v129, cusco, los_angeles, 820).

% Arequipa internacional
vuelo(v130, arequipa, miami, 670).
vuelo(v131, arequipa, panama, 410).
vuelo(v132, arequipa, mexico_city, 490).
vuelo(v133, arequipa, new_york, 800).
vuelo(v139, arequipa, sao_paulo, 440).
vuelo(v140, arequipa, buenos_aires, 400).
vuelo(v141, arequipa, santiago, 300).
vuelo(v142, arequipa, bogota, 350).
vuelo(v143, arequipa, los_angeles, 830).

% Trujillo internacional
vuelo(v144, trujillo, miami, 660).
vuelo(v145, trujillo, panama, 400).
vuelo(v146, trujillo, mexico_city, 495).
vuelo(v147, trujillo, new_york, 810).
vuelo(v153, trujillo, sao_paulo, 450).
vuelo(v154, trujillo, buenos_aires, 410).
vuelo(v155, trujillo, santiago, 320).
vuelo(v156, trujillo, bogota, 360).
vuelo(v157, trujillo, los_angeles, 850).

% Piura internacional
vuelo(v158, piura, miami, 650).
vuelo(v159, piura, panama, 390).
vuelo(v160, piura, mexico_city, 495).
vuelo(v161, piura, new_york, 815).
vuelo(v167, piura, sao_paulo, 460).
vuelo(v168, piura, buenos_aires, 420).
vuelo(v169, piura, santiago, 330).
vuelo(v170, piura, bogota, 375).
vuelo(v171, piura, los_angeles, 870).

% Iquitos internacional
vuelo(v172, iquitos, miami, 700).
vuelo(v173, iquitos, panama, 430).
vuelo(v174, iquitos, mexico_city, 500).
vuelo(v175, iquitos, new_york, 860).
vuelo(v181, iquitos, sao_paulo, 480).
vuelo(v182, iquitos, buenos_aires, 450).
vuelo(v183, iquitos, santiago, 355).
vuelo(v184, iquitos, bogota, 390).
vuelo(v185, iquitos, los_angeles, 890).

% Ayacucho internacional
vuelo(v186, ayacucho, miami, 640).
vuelo(v187, ayacucho, panama, 390).
vuelo(v188, ayacucho, mexico_city, 480).
vuelo(v189, ayacucho, new_york, 800).
vuelo(v195, ayacucho, sao_paulo, 470).
vuelo(v196, ayacucho, buenos_aires, 440).
vuelo(v197, ayacucho, santiago, 340).
vuelo(v198, ayacucho, bogota, 370).
vuelo(v199, ayacucho, los_angeles, 860).

% Huancayo internacional
vuelo(v200, huancayo, miami, 700).
vuelo(v201, huancayo, panama, 440).
vuelo(v202, huancayo, mexico_city, 510).
vuelo(v203, huancayo, new_york, 880).
vuelo(v209, huancayo, sao_paulo, 490).
vuelo(v210, huancayo, buenos_aires, 470).
vuelo(v211, huancayo, santiago, 390).
vuelo(v212, huancayo, bogota, 410).
vuelo(v213, huancayo, los_angeles, 910).

% Ica internacional
vuelo(v214, ica, miami, 730).
vuelo(v215, ica, panama, 460).
vuelo(v216, ica, mexico_city, 520).
vuelo(v217, ica, new_york, 900).
vuelo(v223, ica, sao_paulo, 500).
vuelo(v224, ica, buenos_aires, 490).
vuelo(v225, ica, santiago, 410).
vuelo(v226, ica, bogota, 420).
vuelo(v227, ica, los_angeles, 930).

% --- CONEXIONES INTERNACIONALES ENTRE HUBS ---

vuelo(v300, miami, madrid, 670).
vuelo(v301, miami, paris, 680).
vuelo(v302, miami, londres, 700).
vuelo(v303, miami, frankfurt, 710).
vuelo(v304, miami, amsterdam, 720).
vuelo(v305, miami, new_york, 180).
vuelo(v306, panama, madrid, 600).
vuelo(v307, panama, miami, 220).
vuelo(v308, panama, amsterdam, 780).
vuelo(v309, panama, new_york, 450).
vuelo(v310, madrid, londres, 150).
vuelo(v311, madrid, paris, 140).
vuelo(v312, madrid, berlin, 170).
vuelo(v313, madrid, frankfurt, 120).
vuelo(v314, madrid, roma, 160).
vuelo(v315, paris, berlin, 130).
vuelo(v316, amsterdam, berlin, 120).
vuelo(v317, londres, berlin, 110).
vuelo(v318, new_york, londres, 690).
vuelo(v319, new_york, paris, 720).
vuelo(v320, new_york, frankfurt, 710).
vuelo(v321, new_york, amsterdam, 690).
vuelo(v322, frankfurt, berlin, 90).
vuelo(v323, frankfurt, roma, 110).
vuelo(v324, frankfurt, madrid, 120).
vuelo(v325, roma, berlin, 130).
vuelo(v326, roma, paris, 110).

% PREDICADO CON ESCALAS UNICAS
escalas_unicas([]).
escalas_unicas([H|T]) :-
    \+ member(H, T),  % Verifica que H no esté ya en la lista
    escalas_unicas(T).


% --- DETERMINAR SI UNA RUTA ES INTERNACIONAL ---
es_internacional(Origen, Destino) :-
    ( \+ ciudad_peru(Origen) ; \+ ciudad_peru(Destino) ).

    

%-------------------------------------------------------------------------------- 

% --- REGLAS DE BÚSQUEDA DE VUELOS --- 

% Vuelos directos (nacionales e internacionales)
buscar_vuelo_directo(Origen, Destino, Clave, Precio) :-
    nombre_ciudad(Origen, OrigenInterno),
    nombre_ciudad(Destino, DestinoInterno),
    vuelo(Clave, OrigenInterno, DestinoInterno, Precio).

%--------------------------------------------------------------------------


	% Vuelos con 1 escala (SOLO internacionales y sin escala nacional)
buscar_vuelo_escala1(Origen, Destino, Clave1, Clave2, Escala1, PrecioTotal) :-
    nombre_ciudad(Origen, OrigenInterno),
    nombre_ciudad(Destino, DestinoInterno),
    es_internacional(OrigenInterno, DestinoInterno),
    vuelo(Clave1, OrigenInterno, Escala1, Precio1),
    vuelo(Clave2, Escala1, DestinoInterno, Precio2),
    OrigenInterno \= Escala1, Escala1 \= DestinoInterno, OrigenInterno \= DestinoInterno,
    \+ ciudad_peru(Escala1),
    PrecioTotal is Precio1 + Precio2.


buscar_vuelo_escala2(Origen, Destino, Clave1, Clave2, Clave3, Escala1, Escala2, PrecioTotal) :-
    nombre_ciudad(Origen, OrigenInterno),
    nombre_ciudad(Destino, DestinoInterno),
    es_internacional(OrigenInterno, DestinoInterno),
    vuelo(Clave1, OrigenInterno, Escala1, Precio1),
    vuelo(Clave2, Escala1, Escala2, Precio2),
    vuelo(Clave3, Escala2, DestinoInterno, Precio3),
    OrigenInterno \= Escala1, Escala1 \= Escala2, Escala2 \= DestinoInterno, OrigenInterno \= DestinoInterno,
    Escala1 \= DestinoInterno, Escala2 \= DestinoInterno, 
    \+ ciudad_peru(Escala1), \+ ciudad_peru(Escala2),
    PrecioTotal is Precio1 + Precio2 + Precio3.



% LA ESCALA 3 YA ESTA CORREGIDA 
buscar_vuelo_escala3(Origen, Destino, Clave1, Clave2, Clave3, Clave4,
                     Escala1, Escala2, Escala3, PrecioTotal) :-
    nombre_ciudad(Origen, OrigenInterno),
    nombre_ciudad(Destino, DestinoInterno),
    es_internacional(OrigenInterno, DestinoInterno),
    vuelo(Clave1, OrigenInterno, Escala1, Precio1),
    vuelo(Clave2, Escala1, Escala2, Precio2),
    vuelo(Clave3, Escala2, Escala3, Precio3),
    vuelo(Clave4, Escala3, DestinoInterno, Precio4),
    OrigenInterno \= Escala1, Escala1 \= Escala2, Escala2 \= Escala3,
    OrigenInterno \= DestinoInterno,
    Escala1 \= DestinoInterno, Escala2 \= DestinoInterno, Escala3 \= DestinoInterno,
    escalas_unicas([Escala1, Escala2, Escala3]),  % Verifica que las escalas sean únicas
    \+ ciudad_peru(Escala1), \+ ciudad_peru(Escala2), \+ ciudad_peru(Escala3),
    PrecioTotal is Precio1 + Precio2 + Precio3 + Precio4.



% REGLA (PREDICADO) AUXILIAR (POSIACASO) % en caso solo eliminar
escalas_validas(Origen, Destino, Escalas) :-
    \+ member(Destino, Escalas),
    \+ member(Origen, Escalas),
    all_different(Escalas),
    forall(member(E, Escalas), \+ ciudad_peru(E)).

all_different([]).
all_different([H|T]) :- \+ member(H, T), all_different(T).
