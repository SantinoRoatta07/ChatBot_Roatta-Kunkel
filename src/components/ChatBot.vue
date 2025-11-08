<template>
  <div class="chat-container">
    <div class="chat-box" ref="chatBox">
      <div
        v-for="(msg, index) in messages"
        :key="index"
        :class="['message', msg.sender]"
      >
        <p>{{ msg.text }}</p>
      </div>
    </div>

    <form @submit.prevent="sendMessage" class="input-area">
      <input
        v-model="userInput"
        type="text"
        placeholder="Escribe tu mensaje..."
        required
      />
      <button type="submit">Enviar</button>
    </form>
  </div>
</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue'
import { io } from 'socket.io-client'

const socket = io('http://localhost:3000')
const messages = ref([])
const userInput = ref('')
const chatBox = ref(null)

onMounted(() => {
  socket.on('bot-response', async (msg) => {
    messages.value.push({ text: msg, sender: 'bot' })
    await nextTick()
    scrollToBottom()
  })
})

const sendMessage = async () => {
  if (!userInput.value.trim()) return

  const text = userInput.value
  messages.value.push({ text, sender: 'user' })
  socket.emit('user-message', text)
  userInput.value = ''

  await nextTick()
  scrollToBottom()
}

const scrollToBottom = () => {
  chatBox.value.scrollTop = chatBox.value.scrollHeight
}
</script>

<style scoped>
/* estilos aquí */
</style>
