<script setup>
import { ref, onMounted, nextTick } from 'vue'
import { io } from 'socket.io-client' // [cite: 4]

const socket = io('http://localhost:3000') // [cite: 5]
const conversacion = ref([]) //
const pregunta = ref('')     //
const chatBox = ref(null)    // (Tu mejora para el scroll)

onMounted(() => {
  socket.on('respuesta', async (data) => { //
    conversacion.value.push({ tipo: 'asistente', mensaje: data.mensaje }) // [cite: 13]

    await nextTick()
    scrollToBottom()
  })
})

const RealizarPregunta = async () => { // [cite: 9]
  if (!pregunta.value.trim()) return

  const mensajeUsuario = pregunta.value

  conversacion.value.push({ tipo: 'usuario', mensaje: mensajeUsuario }) // [cite: 10]

  socket.emit('pregunta', { pregunta: mensajeUsuario }) //

  pregunta.value = '' // Limpiamos el input

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

      <div v-for="(msg, index) in conversacion"
           :key="index"
           :class="['mensaje', msg.tipo === 'usuario' ? 'usuario' : 'bot']"
      > <p class="sender-label">{{ msg.tipo === 'usuario' ? 'Tú:' : 'Asistente:' }}</p> {{ msg.mensaje }} </div>
    </div>

    <form @submit.prevent="RealizarPregunta" class="input-area"> <input
        v-model="pregunta" type="text"
        placeholder="Escribe tu mensaje..." required
      />
      <button type->Enviar</button> </form>
  </div>
</template>

<style scoped>
/* Estilos mejorados, basados en tu estructura de clases */
.chat-container {
  max-width: 600px;
  margin: 2rem auto;
  border-radius: 8px;
  border: 1px solid #ddd;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  font-family: Arial, sans-serif;
  display: flex;
  flex-direction: column;
  height: 80vh;
}

h1 {
  text-align: center;
  padding: 1rem;
  margin: 0;
  border-bottom: 1px solid #ddd;
  background-color: #f9f9f9;
}

.chat-box {
  flex-grow: 1;
  overflow-y: auto;
  padding: 1.5rem;
  background-color: #fefefe;
}

.mensaje {
  margin-bottom: 1rem;
  padding: 0.8rem 1rem;
  border-radius: 12px;
  max-width: 80%;
  line-height: 1.4;
}

.mensaje p {
  margin: 0 0 5px 0;
  font-weight: bold;
  font-size: 0.9rem;
}

.mensaje.usuario {
  background-color: #e1f5fe; /* Azul claro (como en PPTX) */
  color: #333;
  margin-left: auto;
  text-align: left; /* Alineado a la izquierda dentro de la burbuja */
}

.mensaje.bot {
  background-color: #e8f5e9; /* Verde claro (como en PPTX) */
  color: #333;
  margin-right: auto;
  text-align: left;
}

.input-area {
  display: flex;
  padding: 1rem;
  border-top: 1px solid #ddd;
  background-color: #f9f9f9;
}

.input-area input {
  flex-grow: 1;
  padding: 0.8rem;
  border: 1px solid #ccc;
  border-radius: 20px;
  margin-right: 0.5rem;
}

.input-area button {
  padding: 0.8rem 1.5rem;
  border: none;
  background-color: #007bff;
  color: white;
  border-radius: 20px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.input-area button:hover {
  background-color: #0056b3;
}
</style>
