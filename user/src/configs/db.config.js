import { Pool } from "pg";
import { envConfig } from "./env.config.js";

export const pool = new Pool({
    host: envConfig.DATABASE_HOST,
    database: envConfig.DATABASE_NAME,
    port: envConfig.DATABASE_PORT,
    user: envConfig.DATABASE_USER,
    password: envConfig.DATABASE_PASS
});

pool.on("connect", () => {
  console.log("Connected to PostgreSQL");
});

pool.on("error", (err) => {
  console.error("Unexpected PostgreSQL error:", err);
});

pool.on("remove", () => {
  console.log("Database connection removed from pool");
});