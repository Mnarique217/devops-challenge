const express = require('express');
const Database = require('./services/database')

const app = express();
const database = new Database();

const PORT = process.env.PORT || 3000

// Middleware for parsing JSON
app.use(express.json());

let users = [
  { id: 1, name: 'John Doe', email: 'john@example.com' },
  { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
  { id: 2, name: 'Manrique', email: 'manrique@example.com' }
];


app.get('/users', (req, res) => {
  res.json(users);
});

// GET - Retrieve a specific user
app.get('/users/:id', (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (!user) return res.status(404).json({ message: 'User not found' });
  res.json(user);
});

// POST - Create a new user
app.post('/users', (req, res) => {
  const newUser = {
    id: users.length + 1,
    name: req.body.name,
    email: req.body.email
  };
  users.push(newUser);
  res.status(201).json(newUser);
});

app.put('/users/:id', (req, res) => {
  const user = users.find(u => u.id === parseInt(req.params.id));
  if (!user) return res.status(404).json({ message: 'User not found' });

  user.name = req.body.name;
  user.email = req.body.email;

  res.json(user);
});

app.delete('/users/:id', (req, res) => {
  const userIndex = users.findIndex(u => u.id === parseInt(req.params.id));
  if (userIndex === -1) return res.status(404).json({ message: 'User not found' });

  const deletedUser = users.splice(userIndex, 1);
  res.json(deletedUser[0]);
});


app.get('/health', async (_req, res, _next) => {
  try {
    const response = {
      uptime: process.uptime(),
      status: 'OK',
      timestamp: Date.now()
    }
    res.status(200).send(response);
  } catch (error) {
    res.status(503).send()
  }
});

app.get('/ready', async (_req, res, _next) => {
  try {
    if (database.checkConnection())
      res.status(200).send({
        uptime: process.uptime(),
        status: 'READY',
        timestamp: Date.now()
      });
    else
      res.status(503).send({
        uptime: process.uptime(),
        status: "NOT READY",
        timestamp: Date.now()
      })
  } catch (error) {
    res.status(503).send({
      uptime: process.uptime(),
      status: "NOT READY",
      timestamp: Date.now()
    })
  }
});

app.listen(PORT, () => {
  console.log(`REST server running on port ${PORT}`);
});