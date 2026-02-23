module.exports = {
  apps: [
    {
      name: "local-cicd-prod",
      script: "server.js",
      //   instances: "max", // Use all available CPU cores for clustering
      instances: 1,
      //   exec_mode: "cluster", // Use cluster mode for load balancing
      exec_mode: "fork",
      watch: false,
      max_memory_restart: "300M",
      env: {
        NODE_ENV: "dev",
        PORT: 3000,
      },
      env_production: {
        NODE_ENV: "production",
        PORT: 3000,
      },
    },
  ],
};
