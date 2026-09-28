import { createTransport } from "nodemailer";
import { envConfig } from "./env.config";


export const tarnsport = createTransport({
    host: envConfig,
    port: envConfig,
    secure: envConfig,
    auth : {
        user: envConfig,
        pass: envConfig
    }
})