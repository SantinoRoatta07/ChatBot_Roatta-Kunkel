<template>
  <div class="app">
    <h1 class="title">💬 Chatbot de Asistencia Inteligente</h1>
    <ChatBot />
  </div>
</template>

<script setup>
import ChatBot from './components/ChatBot.vue'
</script>

<style scoped>
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #4facfe, #00f2fe);
  font-family: 'Segoe UI', sans-serif;
}

.title {
  color: white;
  margin-bottom: 1rem;
}
</style>
