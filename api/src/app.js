const express = require('express');
const axios = require('axios');

const app = express();

app.get('/', (req, res) => {
    res.send('¡Hola, mundo desde Node.js! - Ian Hernandez');
});

app.get('/api', async (req, res) => {
    try {
        const response = await axios.get('https://jsonplaceholder.typicode.com/posts/1');
        res.json(response.data);
    } catch (error) {
        res.status(500).send('Error al obtener datos de la API externa');
    }
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Servidor ejecutándose en el puerto ${PORT}`);
});

module.exports = app;
