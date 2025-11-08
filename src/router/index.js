import { createRouter, createWebHistory } from 'vue-router'
import ChatBot from '../components/ChatBot.vue'

const routes = [
  {
    path: '/',
    name: 'chat',
    component: ChatBot
  }
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router
