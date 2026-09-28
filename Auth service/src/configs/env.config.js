import dotenv from 'dotenv';
dotenv.config();

export const envConfig = {
    NODE_ENV : process.env.NODE_ENV || "development",
    PORT : process.env.PORT,
    SALT_ROUNDS : process.env.SALT_ROUNDS,
    
    DATABASE_HOST: process.env.DATABASE_HOST,
    DATABASE_USER: process.env.DATABASE_USER,
    DATABASE_PORT: process.env.DATABASE_PORT,
    DATABASE_USER: process.env.DATABASE_USER,
    DATABASE_PASS: process.env.DATABASE_PASS,

    
}

