<script setup>
import ChatBot from './components/ChatBot.vue'
</script>

<template>
  <div class="app">
    <h1 class="title">💬 Chatbot de Asistencia Inteligente</h1>
    <ChatBot />
  </div>
</template>


<style scoped>
.app {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  min-height: 100vh;


  background: linear-gradient(135deg, #4facfe, #00f2fe, #00eaff, #0084ff);
  background-size: 300% 300%;
  animation: animateBg 12s ease infinite;

  font-family: "Segoe UI", sans-serif;
  padding: 2rem;
}

@keyframes animateBg {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.title {
  font-family: 'Unbounded', sans-serif;
  font-size: 2.8rem;
  font-weight: 800;
  color: white;
  text-align: center;
  letter-spacing: 1.5px;

  text-shadow:
    0 0 10px rgba(255, 255, 255, 0.55),
    0 0 20px rgba(0, 180, 255, 0.45),
    0 0 35px rgba(0, 160, 255, 0.35);

  margin-bottom: 1.8rem;

  
  opacity: 0;
  transform: translateY(-12px) scale(0.98);
  animation: titleReveal 0.8s ease forwards;
}


@keyframes titleReveal {
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}



@keyframes fadeInTitle {
  from {
    opacity: 0;
    transform: translateY(-12px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.app > *:not(.title) {

  background: rgba(255, 255, 255, 0.15);
  border-radius: 20px;
  padding: 20px;
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255,255,255,0.3);
  box-shadow: 0 10px 25px rgba(0,0,0,0.25);

  animation: floatUp 0.7s ease backwards;
}


@keyframes floatUp {
  from {
    opacity: 0;
    transform: translateY(20px) scale(0.97);
  }
  to {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
}

</style>
