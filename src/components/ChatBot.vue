<script setup>
import { ref, onMounted, nextTick } from 'vue'
import socket from '../socket.js';

const conversacion = ref([])
const pregunta = ref('')
const chatBox = ref(null) // para hacer scroll automático
onMounted(() => {

  socket.off('respuesta')

  socket.on('respuesta', async (data) => {
    conversacion.value.push({ tipo: 'asistente', mensaje: data.mensaje })
    await nextTick()
    scrollToBottom()
  })
})

const RealizarPregunta = async () => {
  if (!pregunta.value.trim()) return

  const mensajeUsuario = pregunta.value
  conversacion.value.push({ tipo: 'usuario', mensaje: mensajeUsuario })

  socket.emit('pregunta', { pregunta: mensajeUsuario })

  pregunta.value = ''
  await nextTick()
  scrollToBottom()
}

const scrollToBottom = () => {
  if (chatBox.value) {
    chatBox.value.scrollTop = chatBox.value.scrollHeight
  }
}
</script>

<template>
  <div class="chat-container">
    <div class="chat-box" ref="chatBox">
      <div
        v-for="(msg, index) in conversacion"
        :key="index"
        :class="['mensaje', msg.tipo === 'usuario' ? 'usuario' : 'bot']"
      >
        <p class="sender-label">
          {{ msg.tipo === 'usuario' ? 'Tú:' : 'Asistente:' }}
        </p>
        {{ msg.mensaje }}
      </div>
    </div>

    <form @submit.prevent="RealizarPregunta" class="input-area">
      <input
        v-model="pregunta"
        type="text"
        placeholder="Escribe tu mensaje..."
        required
      />
      <button type="submit">Enviar</button>
    </form>
  </div>
</template>

<style scoped>
.chat-container {
  max-width: 600px;
  height: 80vh;

  margin: 2rem auto;
  padding: 0;

  display: flex;
  flex-direction: column;

  border-radius: 18px;
  overflow: hidden;

  background: rgba(255, 255, 255, 0.18);
  box-shadow: 0 10px 35px rgba(0, 0, 0, 0.20);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255,255,255,0.3);

  font-family: "Segoe UI", sans-serif;
}


.chat-box {
  flex-grow: 1;
  overflow-y: auto;
  padding: 1.5rem;

  background: linear-gradient(135deg, #d7e7ff, #fff 40%, #e9faff);
}

.chat-box::-webkit-scrollbar {
  width: 8px;
}
.chat-box::-webkit-scrollbar-thumb {
  background: #b7b7b7;
  border-radius: 10px;
}
.chat-box::-webkit-scrollbar-track {
  background: #efefef;
}


.mensaje {
  max-width: 80%;
  padding: 1rem 1.2rem;
  border-radius: 18px;
  margin-bottom: 1.3rem;
  font-size: 1rem;
  line-height: 1.45;


  animation: aparecer 0.25s ease-out forwards;
  transform-origin: bottom;
}

.sender-label {
  margin-bottom: 6px;
  font-size: 0.82rem;
  font-weight: 600;
  opacity: 0.75;
}

.mensaje.usuario {
  align-self: flex-end;
  background: linear-gradient(135deg, #4facfe, #00f2fe);
  color: white;
  border-bottom-right-radius: 4px;
  box-shadow: 0 3px 10px rgba(0, 140, 255, 0.25);
}


.mensaje.bot {
  align-self: flex-start;
  background: #ffffffdd;
  color: #333;
  border-bottom-left-radius: 4px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.10);
}


.input-area {
  display: flex;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.65);
  border-top: 1px solid rgba(255,255,255,0.45);
  backdrop-filter: blur(10px);
}

.input-area input {
  flex-grow: 1;
  padding: 0.85rem 1.1rem;

  border: none;
  outline: none;

  border-radius: 25px;
  background: #ffffffd6;
  font-size: 1rem;
  box-shadow: 0 3px 8px rgba(0,0,0,0.08);

  transition: box-shadow 0.2s, background 0.2s;
}

.input-area input:focus {
  background: white;
  box-shadow: 0 0 0 3px rgba(0, 180, 255, 0.25);
}


.input-area button {
  margin-left: 0.7rem;
  padding: 0.85rem 1.4rem;

  background: linear-gradient(135deg, #00c6ff, #0072ff);
  border: none;
  color: white;
  border-radius: 25px;

  cursor: pointer;
  font-size: 1rem;
  font-weight: 600;

  box-shadow: 0 3px 10px rgba(0, 120, 255, 0.30);
  transition: transform 0.15s, opacity 0.15s;
}

.input-area button:hover {
  opacity: 0.9;
}

.input-area button:active {
  transform: scale(0.95);
}


@keyframes aparecer {
  from {
    opacity: 0;
    transform: translateY(8px) scale(0.98);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

</style>
