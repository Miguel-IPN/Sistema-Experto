# FitLogic - Sistema Experto en Prolog 🏋️‍♂️🧠

**FitLogic** es un sistema experto desarrollado en **SWI-Prolog** que infiere rutinas de entrenamiento personalizadas[cite: 25, 30]. Mediante unificación y *backtracking*, el motor lógico evalúa hechos clasificados por grupo muscular, nivel de experiencia y equipamiento disponible[cite: 2, 25, 27], generando protocolos de calentamiento, volumen de entrenamiento y una selección de 5 ejercicios distintos por sesión[cite: 2, 42].

El proyecto está diseñado para resolver la estructuración de rutinas seguras y progresivas sin necesidad de un entrenador personal, utilizando programación lógica en lugar de condicionales rígidos[cite: 26, 30].

---

## 👥 Integrantes del Proyecto

* **Rojano Soberanes Dayron**
* **Juárez Bobadilla Miguel Isaí**

**Unidad de Aprendizaje:** Paradigmas de Programación[cite: 24]  
**Institución:** Escuela Superior de Cómputo (ESCOM) - Instituto Politécnico Nacional[cite: 24]

---

## 📸 Interfaz Gráfica

La interfaz fue desarrollada con HTML5 y Tailwind CSS, y se comunica con el motor lógico a través de una API REST[cite: 27, 30].

### Pantalla de Inicio
![Pantalla de Inicio](inicio.png)

### Rutina Generada por el Motor de Inferencia
![Rutina Generada](rutina.png)

---

## ⚙️ Arquitectura del Sistema

El sistema implementa una arquitectura cliente-servidor nativa[cite: 30]:
1. **Frontend:** Interfaz web (HTML/Tailwind CSS) que recopila los parámetros del usuario[cite: 3, 28].
2. **API REST:** Comunicación HTTP/JSON manejada directamente por las bibliotecas nativas de SWI-Prolog (`http_dispatch`, `http_json`)[cite: 2, 31].
3. **Backend Lógico:** Archivo `Proyecto.pl` que contiene la base de conocimientos y procesa las peticiones mediante unificación y backtracking[cite: 2, 25].
4. **Despliegue (Cloud):** Contenedor Docker alojado en Render.com[cite: 31].

---

## 🛠️ Tecnologías Utilizadas

* **Motor Lógico:** SWI-Prolog[cite: 30]
* **Frontend:** HTML5, Tailwind CSS, JavaScript (Fetch API)[cite: 3, 30, 31]
* **Infraestructura:** Docker[cite: 31]
* **Plataforma Cloud (PaaS):** Render.com[cite: 31]
* **Control de Versiones:** Git y GitHub[cite: 30]

---

## 🚀 Instalación y Ejecución Local

Para ejecutar el sistema en local[cite: 29]:

1. **Requisitos:** Tener instalado [SWI-Prolog](https://www.swi-prolog.org/)[cite: 30].
2. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/Miguel-IPN/Sistema-Experto.git](https://github.com/Miguel-IPN/Sistema-Experto.git)
   cd Sistema-Experto/Proyecto
