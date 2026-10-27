# FitLogic - Sistema Experto en Prolog 🏋️‍♂️🧠

**FitLogic** es un sistema experto desarrollado en **SWI-Prolog** para la inferencia y estructuración de rutinas de entrenamiento físico personalizadas. Mediante mecanismos de unificación lógica y backtracking, el sistema analiza las condiciones particulares del usuario (grupo muscular objetivo, nivel de experiencia y equipamiento disponible) para seleccionar automáticamente 5 ejercicios compatibles y únicos, calculando además el volumen de trabajo (series y repeticiones) y el protocolo de calentamiento correspondiente según el objetivo físico seleccionado.

La aplicación resuelve la necesidad de diseñar programas de ejercicio adaptados y seguros, sustituyendo estructuras condicionales rígidas por un motor de reglas formales en programación lógica.

---

## 🌐 URL de la Aplicación en Producción

El sistema se encuentra contenerizado mediante Docker y desplegado en la plataforma en la nube Render, accesible de manera pública sin requerir instalación local ni dependencias de software:

👉 **[https://fitlogic-wiv0.onrender.com](https://fitlogic-wiv0.onrender.com)**

---

## 👥 Integrantes del Proyecto

* **Rojano Soberanes Dayron**
* **Juárez Bobadilla Miguel Isaí**

* **Unidad de Aprendizaje:** Paradigmas de Programación
* **Institución:** Escuela Superior de Cómputo (ESCOM) - Instituto Politécnico Nacional

---

## 📸 Interfaz Gráfica

La interfaz de usuario fue diseñada con **HTML5** y estilizada mediante **Tailwind CSS**, consumiendo los resultados del motor Prolog de forma asíncrona mediante peticiones HTTP en formato JSON.

### Pantalla de Inicio
![Pantalla de Inicio](Proyecto/inicio.png)

### Rutina Generada por el Motor de Inferencia
![Rutina Generada](Proyecto/rutina.png)

---

## ⚙️ Arquitectura del Sistema

La solución opera bajo una arquitectura cliente-servidor nativa y desacoplada:

1. **Frontend (Capa de Presentación):** Interfaz web (`Interfaz.html`) montada con Tailwind CSS y Vanilla JavaScript. Recopila mediante selectores los 4 parámetros de entrada (`grupo_muscular`, `nivel`, `equipo`, `objetivo`) y envía una solicitud `POST` a la ruta `/api/generar_rutina`.
2. **Servidor HTTP Embebido (API REST):** Desplegado en SWI-Prolog mediante las bibliotecas `library(http/thread_httpd)`, `library(http/http_dispatch)` y `library(http/http_json)`. Recibe la carga útil en formato JSON, la parsea y transforma los datos a tipos atómicos de Prolog.
3. **Motor de Inferencia (Backend Lógico):** Archivo `Proyecto.pl`. Aplica las reglas lógicas para deducir una combinación válida de 5 ejercicios no repetidos, calcular el volumen y seleccionar el calentamiento adecuado. En caso de ausencia de soluciones o datos no conformes, retorna una respuesta de error estructurada.
4. **Contenedorización e Infraestructura Cloud:** Empaquetado integral mediante un archivo `Dockerfile` basado en la imagen oficial `swipl:latest`, el cual ejecuta el servicio escuchando dinámicamente la variable de entorno `PORT` en los servidores de Render.

---

## 🛠️ Tecnologías Utilizadas

* **Lenguaje y Motor Lógico:** SWI-Prolog (versión 10.x / latest)
* **Frontend:** HTML5, Tailwind CSS (CDN), FontAwesome 6, JavaScript (Fetch API)
* **Servidor de Aplicaciones:** Módulos HTTP internos de SWI-Prolog (`thread_httpd`, `http_dispatch`, `http_cors`)
* **Contenedorización:** Docker
* **Plataforma Cloud (PaaS):** Render.com (Servicio ID: `srv-dbg0ikt9el5s73bh9960`)
* **Control de Versiones:** Git y GitHub

---

## 🧠 Base de Conocimientos y Modelo Lógico

El archivo `Proyecto.pl` implementa una base estructurada compuesta por:

* **190 Hechos:** Organizados bajo la estructura `ejercicio(Nombre, Musculo, Nivel, Equipo)` para 5 zonas musculares: `pecho`, `espalda`, `pierna`, `brazo` y `abdomen`.
* **Reglas de Jerarquía de Nivel (`nivel_valido/2`):** Permiten que un atleta avanzado acceda a ejercicios catalogados para intermedios o principiantes, y que un usuario intermedio ejecute variantes para principiantes.
* **Reglas de Disponibilidad de Equipo (`equipo_valido/2`):** Permiten que quien cuenta con acceso a máquinas de gimnasio también pueda realizar ejercicios con barras, mancuernas o calistenia (peso corporal).
* **Filtro de Compatibilidad (`ejercicio_apropiado/4`):** Evalúa simultáneamente el grupo muscular, el nivel permitido y los requerimientos materiales.
* **Prescripción de Volumen (`volumen_entrenamiento/3`):** Deduce el total de series y el rango de repeticiones en función del objetivo seleccionado (`fuerza`, `hipertrofia` o `resistencia`).
* **Protocolo de Calentamiento (`calentamiento_sugerido/2`):** Asigna rutinas de aproximación articular para tren superior o estímulos cardiovasculares y estiramientos dinámicos para tren inferior y zona media.
* **Inferencia de Sesión (`rutina_valida/8`):** Garantiza la entrega de cinco ejercicios diferentes mediante desigualdades explícitas (`Ej1 \= Ej2, Ej1 \= Ej3, ...`), obligando al motor a realizar backtracking cuando encuentra una coincidencia repetida hasta satisfacer la consulta.

---

## 🚀 Instalación y Ejecución Local

Para reproducir y ejecutar el proyecto en un entorno local:

### 1. Requisitos Previos
* Tener instalado [SWI-Prolog](https://www.swi-prolog.org/) en el sistema operativo.

### 2. Clonación y Navegación
```bash
git clone [https://github.com/Miguel-IPN/Sistema-Experto.git](https://github.com/Miguel-IPN/Sistema-Experto.git)
cd Sistema-Experto/Proyecto
