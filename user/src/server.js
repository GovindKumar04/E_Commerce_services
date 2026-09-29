import { app } from "./app.js";
import { envConfig } from "./configs/env.config.js";
import { pool } from "./configs/db.config.js";

app.listen(envConfig.PORT, async () => {
    try {
        await pool.query("SELECT NOW()")
        console.log(`App listening to ${envConfig.PORT}`);
    } catch (error) {
        console.log(error);
    }
})