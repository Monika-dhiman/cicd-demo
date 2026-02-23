const express = require("express");
const os = require("os");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Simple Routes
app.get("/", (req, res) => {
  res.json({
    message: "CI/CD with PM2 working 🚀",
    pid: process.pid,
    cpu: os.cpus().length
  });
});

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "OK",
    uptime: process.uptime()
  });
});

app.get("/crash", (req, res) => {
  res.json({ message: "App will crash now 💥" });
  process.exit(1); // simulate crash
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT || 3000} with PID ${process.pid}.`);
});