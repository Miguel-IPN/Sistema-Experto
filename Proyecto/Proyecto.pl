% ==========================================
% FITLOGIC - SISTEMA COMPLETO Y DEFINITIVO
% Archivo: Proyecto.pl
% ==========================================

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).

:- set_setting(http:cors, [*]).

:- http_handler(root(api/generar_rutina), options_handler, [method(options)]).
:- http_handler(root(api/generar_rutina), generar_rutina_handler, [method(post)]).

% Rutas directas absolutas (Previene el Error 500 de http_files)
:- http_handler(root('Interfaz.html'), http_reply_file('Interfaz.html', []), []).
:- http_handler(root('logo.png'), http_reply_file('logo.png', []), []).
:- http_handler(root(.), http_redirect(moved, root('Interfaz.html')), []).

% ==========================================
% 1. BASE DE CONOCIMIENTO (190 HECHOS)
% ==========================================

% ----------------- PECHO -----------------
% Peso corporal
ejercicio(flexiones_apoyo_rodillas, pecho, principiante, peso_corporal).
ejercicio(flexiones_inclinadas_banco, pecho, principiante, peso_corporal).
ejercicio(flexiones_estandar, pecho, principiante, peso_corporal).
ejercicio(flexiones_en_pared, pecho, principiante, peso_corporal).
ejercicio(isometria_plancha_brazos_extendidos, pecho, principiante, peso_corporal).
ejercicio(lagartijas_diamante, pecho, intermedio, peso_corporal).
ejercicio(flexiones_declinadas, pecho, intermedio, peso_corporal).
ejercicio(flexiones_abiertas_pausa, pecho, intermedio, peso_corporal).
ejercicio(flexiones_arquero, pecho, avanzado, peso_corporal).
ejercicio(flexiones_pliometricas_aplauso, pecho, avanzado, peso_corporal).
ejercicio(flexiones_a_una_mano_asistidas, pecho, avanzado, peso_corporal).

% Mancuernas
ejercicio(press_plano_mancuernas_ligero, pecho, principiante, mancuernas).
ejercicio(aperturas_planas_mancuernas, pecho, principiante, mancuernas).
ejercicio(pullover_mancuerna_banco, pecho, principiante, mancuernas).
ejercicio(press_inclinado_mancuernas, pecho, intermedio, mancuernas).
ejercicio(aperturas_inclinadas_mancuernas, pecho, intermedio, mancuernas).
ejercicio(press_agarre_neutro_mancuernas, pecho, intermedio, mancuernas).
ejercicio(press_declinado_mancuernas_pesado, pecho, avanzado, mancuernas).
ejercicio(press_unilateral_mancuerna_isometrico, pecho, avanzado, mancuernas).
ejercicio(aperturas_profundas_pausa_abajo, pecho, avanzado, mancuernas).

% Barras
ejercicio(press_banca_plano_guiado, pecho, principiante, barras).
ejercicio(press_suelo_floor_press_barra, pecho, principiante, barras).
ejercicio(landmine_press_pecho_de_pie, pecho, principiante, barras).
ejercicio(press_banca_plano_olimpico, pecho, intermedio, barras).
ejercicio(press_banca_inclinado_barra, pecho, intermedio, barras).
ejercicio(press_banca_agarre_cerrado, pecho, intermedio, barras).
ejercicio(press_banca_declinado_pesado, pecho, avanzado, barras).
ejercicio(press_banca_con_pausa_competicion, pecho, avanzado, barras).
ejercicio(press_guillotina_al_cuello, pecho, avanzado, barras).

% Maquinas
ejercicio(press_pecho_sentado_maquina, pecho, principiante, maquinas).
ejercicio(aperturas_pec_deck_maquina, pecho, principiante, maquinas).
ejercicio(press_inclinado_convergente, pecho, principiante, maquinas).
ejercicio(cruce_poleas_altura_media, pecho, intermedio, maquinas).
ejercicio(press_hammer_strength_plano, pecho, intermedio, maquinas).
ejercicio(cruce_poleas_bajas_ascendente, pecho, intermedio, maquinas).
ejercicio(cruce_poleas_altas_isometrico, pecho, avanzado, maquinas).
ejercicio(press_hammer_unilateral_pesado, pecho, avanzado, maquinas).
ejercicio(fondos_en_maquina_asistida_lastrada, pecho, avanzado, maquinas).

% ----------------- ESPALDA -----------------
% Peso corporal
ejercicio(superman_lumbar_en_suelo, espalda, principiante, peso_corporal).
ejercicio(remo_invertido_con_toalla, espalda, principiante, peso_corporal).
ejercicio(puente_escapular_acostado, espalda, principiante, peso_corporal).
ejercicio(nado_seco_en_suelo, espalda, principiante, peso_corporal).
ejercicio(retraccion_escapular_isometrica, espalda, principiante, peso_corporal).
ejercicio(dominadas_agarre_supino, espalda, intermedio, peso_corporal).
ejercicio(dominadas_pronas_estrictas, espalda, intermedio, peso_corporal).
ejercicio(remo_invertido_australiano, espalda, intermedio, peso_corporal).
ejercicio(dominadas_arquero_avanzadas, espalda, avanzado, peso_corporal).
ejercicio(dominadas_explosivas_al_pecho, espalda, avanzado, peso_corporal).
ejercicio(front_lever_progresion_tuck, espalda, avanzado, peso_corporal).

% Mancuernas
ejercicio(remo_unilateral_mancuerna_banco, espalda, principiante, mancuernas).
ejercicio(encogimientos_trapecio_mancuernas, espalda, principiante, mancuernas).
ejercicio(pajaros_deltoides_posterior_sentado, espalda, principiante, mancuernas).
ejercicio(remo_inclinado_dos_mancuernas, espalda, intermedio, mancuernas).
ejercicio(remo_pecho_apoyado_banco_inclinado, espalda, intermedio, mancuernas).
ejercicio(pullover_dorsal_con_mancuerna, espalda, intermedio, mancuernas).
ejercicio(remo_kroc_pesado_unilateral, espalda, avanzado, mancuernas).
ejercicio(remo_renegado_en_plancha, espalda, avanzado, mancuernas).
ejercicio(peso_muerto_mancuernas_deficit, espalda, avanzado, mancuernas).

% Barras
ejercicio(peso_muerto_rumano_ligero_barra, espalda, principiante, barras).
ejercicio(remo_barra_agarre_supino_ligero, espalda, principiante, barras).
ejercicio(encogimientos_trapecio_con_barra, espalda, principiante, barras).
ejercicio(remo_con_barra_prono_inclinado, espalda, intermedio, barras).
ejercicio(remo_en_punta_landmine, espalda, intermedio, barras).
ejercicio(rack_pull_media_altura, espalda, intermedio, barras).
ejercicio(peso_muerto_convencional_pesado, espalda, avanzado, barras).
ejercicio(remo_pendlay_explosivo_desde_suelo, espalda, avanzado, barras).
ejercicio(remo_barra_T_pesado, espalda, avanzado, barras).

% Maquinas
ejercicio(jalon_al_pecho_agarre_abierto, espalda, principiante, maquinas).
ejercicio(remo_sentado_en_polea_baja, espalda, principiante, maquinas).
ejercicio(remo_en_maquina_guiada_pecho, espalda, principiante, maquinas).
ejercicio(jalon_agarre_estrecho_neutro, espalda, intermedio, maquinas).
ejercicio(pullover_en_polea_alta_cuerda, espalda, intermedio, maquinas).
ejercicio(face_pull_en_polea_alta, espalda, intermedio, maquinas).
ejercicio(jalon_unilateral_polea_isometrico, espalda, avanzado, maquinas).
ejercicio(remo_hammer_strength_pesado, espalda, avanzado, maquinas).
ejercicio(remo_gironda_pausa_estructural, espalda, avanzado, maquinas).

% ----------------- PIERNA -----------------
% Peso corporal
ejercicio(sentadilla_libre_al_aire, pierna, principiante, peso_corporal).
ejercicio(puente_de_gluteos_en_suelo, pierna, principiante, peso_corporal).
ejercicio(elevacion_de_talones_de_pie, pierna, principiante, peso_corporal).
ejercicio(abduccion_cadera_tumbado, pierna, principiante, peso_corporal).
ejercicio(zancadas_asistidas_en_silla, pierna, principiante, peso_corporal).
ejercicio(zancadas_estaticas_alternadas, pierna, intermedio, peso_corporal).
ejercicio(sentadilla_isometrica_en_pared, pierna, intermedio, peso_corporal).
ejercicio(puente_gluteo_unilateral, pierna, intermedio, peso_corporal).
ejercicio(sentadilla_pistol_unilateral, pierna, avanzado, peso_corporal).
ejercicio(sentadilla_pliometrica_con_salto, pierna, avanzado, peso_corporal).
ejercicio(curl_nordico_isquiotibiales, pierna, avanzado, peso_corporal).

% Mancuernas
ejercicio(sentadilla_goblet_con_mancuerna, pierna, principiante, mancuernas).
ejercicio(zancadas_cortas_con_mancuernas, pierna, principiante, mancuernas).
ejercicio(elevacion_talones_con_mancuernas, pierna, principiante, mancuernas).
ejercicio(zancadas_caminando_mancuernas, pierna, intermedio, mancuernas).
ejercicio(peso_muerto_rumano_mancuernas, pierna, intermedio, mancuernas).
ejercicio(subida_al_cajon_step_up_mancuernas, pierna, intermedio, mancuernas).
ejercicio(sentadilla_bulgara_con_mancuernas, pierna, avanzado, mancuernas).
ejercicio(peso_muerto_unilateral_mancuernas, pierna, avanzado, mancuernas).
ejercicio(sentadilla_sumo_pesada_mancuerna, pierna, avanzado, mancuernas).

% Barras
ejercicio(sentadilla_al_cajon_box_squat, pierna, principiante, barras).
ejercicio(buenos_dias_ligero_con_barra, pierna, principiante, barras).
ejercicio(elevacion_gemelos_con_barra, pierna, principiante, barras).
ejercicio(peso_muerto_rumano_con_barra, pierna, intermedio, barras).
ejercicio(hip_thrust_con_barra_olimpica, pierna, intermedio, barras).
ejercicio(zancadas_traseras_con_barra, pierna, intermedio, barras).
ejercicio(sentadilla_trasera_libre_pesada, pierna, avanzado, barras).
ejercicio(sentadilla_frontal_olimpica, pierna, avanzado, barras).
ejercicio(sentadilla_zercher_con_barra, pierna, avanzado, barras).

% Maquinas
ejercicio(prensa_de_piernas_45_grados, pierna, principiante, maquinas).
ejercicio(extension_de_cuadriceps_maquina, pierna, principiante, maquinas).
ejercicio(curl_femoral_tumbado_maquina, pierna, principiante, maquinas).
ejercicio(sentadilla_hack_en_maquina, pierna, intermedio, maquinas).
ejercicio(curl_femoral_sentado_isquios, pierna, intermedio, maquinas).
ejercicio(prensa_de_gemelos_en_maquina, pierna, intermedio, maquinas).
ejercicio(prensa_unilateral_pesada, pierna, avanzado, maquinas).
ejercicio(sentadilla_pendulo_profunda, pierna, avanzado, maquinas).
ejercicio(extension_cuadriceps_drop_set, pierna, avanzado, maquinas).

% ----------------- BRAZO -----------------
% Peso corporal
ejercicio(fondos_de_triceps_en_banco, brazo, principiante, peso_corporal).
ejercicio(flexiones_cerradas_de_rodillas, brazo, principiante, peso_corporal).
ejercicio(isometria_biceps_contra_marco, brazo, principiante, peso_corporal).
ejercicio(toques_de_hombro_en_plancha, brazo, principiante, peso_corporal).
ejercicio(extension_triceps_en_pared, brazo, principiante, peso_corporal).
ejercicio(fondos_en_barras_paralelas, brazo, intermedio, peso_corporal).
ejercicio(dominadas_supinas_enfoque_biceps, brazo, intermedio, peso_corporal).
ejercicio(flexiones_diamante_estrictas, brazo, intermedio, peso_corporal).
ejercicio(flexiones_esfinge_triceps, brazo, avanzado, peso_corporal).
ejercicio(dominadas_supinas_unilaterales_asistidas, brazo, avanzado, peso_corporal).
ejercicio(fondos_coreanos_en_barra, brazo, avanzado, peso_corporal).

% Mancuernas
ejercicio(curl_biceps_alterno_mancuernas, brazo, principiante, mancuernas).
ejercicio(curl_martillo_con_mancuernas, brazo, principiante, mancuernas).
ejercicio(patada_de_triceps_con_mancuerna, brazo, principiante, mancuernas).
ejercicio(curl_concentrado_en_muslo, brazo, intermedio, mancuernas).
ejercicio(extension_triceps_tras_nuca_mancuerna, brazo, intermedio, mancuernas).
ejercicio(curl_biceps_banco_inclinado, brazo, intermedio, mancuernas).
ejercicio(curl_zottman_rotacion_completa, brazo, avanzado, mancuernas).
ejercicio(press_frances_con_mancuernas_neutro, brazo, avanzado, mancuernas).
ejercicio(curl_spider_pecho_apoyado, brazo, avanzado, mancuernas).

% Barras
ejercicio(curl_de_biceps_con_barra_recta, brazo, principiante, barras).
ejercicio(curl_inverso_antebrazo_barra, brazo, principiante, barras).
ejercicio(extension_triceps_sentado_barra, brazo, principiante, barras).
ejercicio(curl_biceps_en_barra_Z, brazo, intermedio, barras).
ejercicio(press_frances_con_barra_Z, brazo, intermedio, barras).
ejercicio(curl_predicador_con_barra_Z, brazo, intermedio, barras).
ejercicio(curl_biceps_estricto_contra_pared, brazo, avanzado, barras).
ejercicio(jm_press_hibrido_triceps_barra, brazo, avanzado, barras).
ejercicio(curl_21s_completo_con_barra, brazo, avanzado, barras).

% Maquinas
ejercicio(extension_triceps_polea_barra_recta, brazo, principiante, maquinas).
ejercicio(curl_biceps_en_polea_baja, brazo, principiante, maquinas).
ejercicio(predicador_en_maquina_selectorizada, brazo, principiante, maquinas).
ejercicio(extension_triceps_con_cuerda_polea, brazo, intermedio, maquinas).
ejercicio(curl_martillo_con_cuerda_polea, brazo, intermedio, maquinas).
ejercicio(extension_triceps_tras_nuca_polea, brazo, intermedio, maquinas).
ejercicio(curl_bayesian_unilateral_polea, brazo, avanzado, maquinas).
ejercicio(extension_triceps_cruzada_doble_polea, brazo, avanzado, maquinas).
ejercicio(curl_doble_biceps_en_polea_alta, brazo, avanzado, maquinas).

% ----------------- ABDOMEN -----------------
% Peso corporal
ejercicio(crunch_abdominal_basico, abdomen, principiante, peso_corporal).
ejercicio(plancha_abdominal_frontal, abdomen, principiante, peso_corporal).
ejercicio(toques_de_talon_alternados, abdomen, principiante, peso_corporal).
ejercicio(crunch_inverso_en_suelo, abdomen, principiante, peso_corporal).
ejercicio(bird_dog_core_isometrico, abdomen, principiante, peso_corporal).
ejercicio(plancha_lateral_isometrica, abdomen, intermedio, peso_corporal).
ejercicio(elevacion_de_piernas_en_suelo, abdomen, intermedio, peso_corporal).
ejercicio(bicicleta_abdominal_controlada, abdomen, intermedio, peso_corporal).
ejercicio(elevacion_de_piernas_colgado_barra, abdomen, avanzado, peso_corporal).
ejercicio(dragon_flag_en_banco, abdomen, avanzado, peso_corporal).
ejercicio(v_ups_abdominales_explosivos, abdomen, avanzado, peso_corporal).

% Mancuernas
ejercicio(crunch_con_mancuerna_al_pecho, abdomen, principiante, mancuernas).
ejercicio(inclinaciones_laterales_oblicuos, abdomen, principiante, mancuernas).
ejercicio(dead_bug_con_mancuerna_ligera, abdomen, principiante, mancuernas).
ejercicio(giros_rusos_con_mancuerna, abdomen, intermedio, mancuernas).
ejercicio(pull_through_en_plancha_mancuerna, abdomen, intermedio, mancuernas).
ejercicio(sit_up_completo_con_mancuerna, abdomen, intermedio, mancuernas).
ejercicio(levantamiento_turco_con_mancuerna, abdomen, avanzado, mancuernas).
ejercicio(molino_windmill_oblicuos_mancuerna, abdomen, avanzado, mancuernas).
ejercicio(plancha_con_remo_pesado_core, abdomen, avanzado, mancuernas).

% Barras
ejercicio(rollout_corto_con_barra_de_rodillas, abdomen, principiante, barras).
ejercicio(giros_de_torso_sentado_barra, abdomen, principiante, barras).
ejercicio(crunch_brazos_extendidos_con_barra, abdomen, principiante, barras).
ejercicio(landmine_rotacion_oblicuos_de_pie, abdomen, intermedio, barras).
ejercicio(rollout_completo_con_barra_olimpica, abdomen, intermedio, barras).
ejercicio(press_anti_rotacion_landmine, abdomen, intermedio, barras).
ejercicio(rollout_con_barra_desde_de_pie, abdomen, avanzado, barras).
ejercicio(limpiaparabrisas_colgado_en_barra, abdomen, avanzado, barras).
ejercicio(toes_to_bar_pies_a_la_barra, abdomen, avanzado, barras).

% Maquinas
ejercicio(crunch_en_maquina_abdominal_sentado, abdomen, principiante, maquinas).
ejercicio(rotacion_de_torso_en_maquina, abdomen, principiante, maquinas).
ejercicio(elevacion_rodillas_en_silla_romana, abdomen, principiante, maquinas).
ejercicio(crunch_arrodillado_en_polea_alta, abdomen, intermedio, maquinas).
ejercicio(press_pallof_antirotacion_en_polea, abdomen, intermedio, maquinas).
ejercicio(lenador_woodchopper_polea_alta, abdomen, intermedio, maquinas).
ejercicio(crunch_oblicuo_pesado_en_polea, abdomen, avanzado, maquinas).
ejercicio(lenador_ascendente_polea_baja, abdomen, avanzado, maquinas).
ejercicio(press_pallof_con_elevacion_vertical, abdomen, avanzado, maquinas).

% ==========================================
% 2. REGLAS LÓGICAS DE INFERENCIA
% ==========================================

nivel_valido(principiante, principiante).
nivel_valido(intermedio, intermedio).
nivel_valido(intermedio, principiante).
nivel_valido(avanzado, avanzado).
nivel_valido(avanzado, intermedio).
nivel_valido(avanzado, principiante).

equipo_valido(peso_corporal, peso_corporal).
equipo_valido(mancuernas, mancuernas).
equipo_valido(mancuernas, peso_corporal).
equipo_valido(barras, barras).
equipo_valido(barras, mancuernas).
equipo_valido(barras, peso_corporal).
equipo_valido(maquinas, maquinas).
equipo_valido(maquinas, barras).
equipo_valido(maquinas, mancuernas).
equipo_valido(maquinas, peso_corporal).

ejercicio_apropiado(Musculo, NivelUsuario, EquipoUsuario, NombreEjercicio) :-
    equipo_valido(EquipoUsuario, EquipoReq),
    nivel_valido(NivelUsuario, NivelReq),
    ejercicio(NombreEjercicio, Musculo, NivelReq, EquipoReq).

volumen_entrenamiento(fuerza, 5, "3 a 5 repeticiones").
volumen_entrenamiento(hipertrofia, 4, "8 a 12 repeticiones").
volumen_entrenamiento(resistencia, 3, "15 a 20 repeticiones").

calentamiento_sugerido(Musculo, "Rotaciones articulares y 2 series de aproximacion") :-
    member(Musculo, [pecho, espalda, brazo]).
calentamiento_sugerido(Musculo, "5 min de cardio ligero y estiramientos dinamicos") :-
    member(Musculo, [pierna, abdomen]).

rutina_valida(Musculo, Nivel, Equipo, Ej1, Ej2, Ej3, Ej4, Ej5) :-
    ejercicio_apropiado(Musculo, Nivel, Equipo, Ej1),
    ejercicio_apropiado(Musculo, Nivel, Equipo, Ej2),
    ejercicio_apropiado(Musculo, Nivel, Equipo, Ej3),
    ejercicio_apropiado(Musculo, Nivel, Equipo, Ej4),
    ejercicio_apropiado(Musculo, Nivel, Equipo, Ej5),
    Ej1 \= Ej2, Ej1 \= Ej3, Ej1 \= Ej4, Ej1 \= Ej5,
    Ej2 \= Ej3, Ej2 \= Ej4, Ej2 \= Ej5,
    Ej3 \= Ej4, Ej3 \= Ej5,
    Ej4 \= Ej5.

% ==========================================
% 3. SERVIDOR HTTP Y API REST
% ==========================================

iniciar_servidor(Port) :-
    http_server(http_dispatch, [port(Port)]),
    format('Servidor FitLogic activo en http://localhost:~w~n', [Port]).

detener_servidor(Port) :-
    http_stop_server(Port, []).

options_handler(Request) :-
    cors_enable(Request, [methods([post, options])]),
    reply_json_dict(_{status: "OK"}).

generar_rutina_handler(Request) :-
    cors_enable(Request, [methods([post, options])]),
    catch(
        (   http_read_json_dict(Request, JSONIn),
            procesar_peticion(JSONIn, JSONOut)
        ),
        Error,
        (   format(user_error, 'Error detectado en peticion: ~w~n', [Error]),
            JSONOut = _{error: "Solicitud malformada o error interno del servidor."}
        )
    ),
    reply_json_dict(JSONOut).

procesar_peticion(JSONIn, JSONOut) :-
    _{grupo_muscular: MusculoStr, nivel: NivelStr, equipo: EquipoStr, objetivo: ObjetivoStr} :< JSONIn,
    atom_string(Musculo, MusculoStr),
    atom_string(Nivel, NivelStr),
    atom_string(Equipo, EquipoStr),
    atom_string(Objetivo, ObjetivoStr),

    (   member(Musculo, [pecho, espalda, pierna, brazo, abdomen]),
        member(Nivel, [principiante, intermedio, avanzado]),
        member(Equipo, [peso_corporal, mancuernas, barras, maquinas]),
        member(Objetivo, [fuerza, hipertrofia, resistencia])
    ->  (   rutina_valida(Musculo, Nivel, Equipo, Ej1, Ej2, Ej3, Ej4, Ej5),
            volumen_entrenamiento(Objetivo, Series, Reps),
            calentamiento_sugerido(Musculo, Calentamiento)
        ->  JSONOut = _{
                ejercicio1: Ej1, ejercicio2: Ej2, ejercicio3: Ej3,
                ejercicio4: Ej4, ejercicio5: Ej5,
                series: Series, repeticiones: Reps, calentamiento: Calentamiento
            }
        ;   JSONOut = _{error: "No hay 5 ejercicios suficientes en el catalogo para tus requerimientos."}
        )
    ;   JSONOut = _{error: "Parametros de consulta no validos."}
    ).

    % --- ARRANQUE PARA PRODUCCIÓN EN LA NUBE ---
arrancar :-
    (   getenv('PORT', PortAtom), atom_number(PortAtom, Port)
    ->  true
    ;   Port = 8000
    ),
    iniciar_servidor(Port),
    % Evita que el contenedor muera inmediatamente manteniendo el hilo principal activo
    thread_get_message(_).