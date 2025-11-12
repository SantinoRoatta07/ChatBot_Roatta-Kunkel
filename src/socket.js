import { io } from 'socket.io-client'

// Creamos una sola instancia global
const socket = io('http://localhost:3000', {
  transports: ['websocket'],
  autoConnect: true,
  reconnection: true,
})

export default socket
