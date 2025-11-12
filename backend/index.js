import express from 'express';
import http from 'http';
import { Server } from 'socket.io';
import mysql from 'mysql2/promise';
import cors from 'cors';

const app = express();
const server = http.createServer(app);

const io = new Server(server, {
cors: {
  origin: 'http://localhost:5173',
  methods: ['*'],
},
});

app.use(cors());
app.use(express.json());

const db = mysql.createPool({ // Usar un Pool es mejor que createConnection
host: 'localhost',
user: 'root',
password: '', // Tu contraseña de MySQL
database: 'chat-bot',
waitForConnections: true,
connectionLimit: 10,
queueLimit: 0
});

console.log('Pool de MySQL conectado y listo');

async function procesarPreguntaClinica(pregunta) {
const texto = pregunta.toLowerCase().trim();

try {

  if (texto.includes('horario') || texto.includes('horarios')) {
    const [rows] = await db.query(
      "SELECT M.nombre, H.dia_semana, H.hora_inicio, H.hora_fin FROM horarios H JOIN medicos M ON H.medico_id = M.id ORDER BY M.nombre"
    );
    if (rows.length === 0) return "No tenemos horarios cargados en este momento.";

    let respuesta = "Nuestros horarios son: ";
    rows.forEach(r => {
      respuesta += `D(a). ${r.nombre}: ${r.dia_semana} de ${r.hora_inicio.substring(0,5)} a ${r.hora_fin.substring(0,5)}. `;
    });
    return respuesta;
  }

  if (texto.includes('seguro') || texto.includes('obra social') || texto.includes('seguros') || texto.includes('obras sociales')) {
    const [rows] = await db.query("SELECT nombre_seguro FROM seguros");
    if (rows.length === 0) return "No tenemos seguros cargados.";

    const listaSeguros = rows.map(r => r.nombre_seguro).join(', ');
    return `Aceptamos los siguientes seguros: ${listaSeguros}.`;
  }

  if (texto.includes('especialidad') || texto.includes('especialidades')) {
    const [rows] = await db.query("SELECT DISTINCT especialidad FROM medicos");
    if (rows.length === 0) return "No tenemos especialidades cargadas.";

    const lista = rows.map(r => r.especialidad).join(', ');
    return `Ofrecemos las siguientes especialidades: ${lista}.`;
  }

  if (texto.includes('medico') || texto.includes('doctor') || texto.includes('doctores') || texto.includes('medicos') || texto.includes('médicos')) {
    const [rows] = await db.query("SELECT DISTINCT nombre, especialidad FROM medicos");
      if (rows.length === 0) return "No tenemos médicos en el sistema.";

      let respuesta = "Nuestro equipo de médicos es: ";
      rows.forEach(r => {
        respuesta += `${r.nombre} (${r.especialidad}). `;
      });
      return respuesta;
  }

  if (texto.includes('hola') || texto.includes('buenos dias')) {
    return '¡Hola! Soy el asistente de la clínica. Puedes consultar sobre horarios, seguros o especialidades.';
  }

  return 'No entiendo tu pregunta. Puedes consultar sobre horarios, seguros, médicos o especialidades.';

} catch (err) {
  console.error("Error en la consulta a la BD:", err);
  return "Tuve un problema para conectarme a la base de datos. Intenta de nuevo más tarde.";
}
}

// 7. Escuchar conexiones de Socket.IO (¡MODIFICADO!)
io.on('connection', (socket) => {
console.log('Usuario conectado:');
  socket.removeAllListeners('pregunta');
// Cuando el cliente envía una pregunta
socket.on('pregunta', async (data) => {
  const respuesta = await procesarPreguntaClinica(data.pregunta);
  const sql = 'INSERT INTO registros_chat (pregunta, respuesta) VALUES (?, ?)';
  try {
    await db.query(sql, [data.pregunta, respuesta]);
    console.log('Conversación guardada correctamente');
  } catch (err) {
    console.error('Error al guardar en la base de datos:', err);
  }

  // Enviar la respuesta de vuelta al cliente
  socket.emit('respuesta', { mensaje: respuesta });
});

socket.on('disconnect', () => {
  console.log('Usuario desconectado:', socket.id);
});
});

// Iniciar el servidor
const PORT = 3000;
server.listen(PORT, () => {
console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
