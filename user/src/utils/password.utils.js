import bcrypt from "bcrypt";
import { envConfig } from "../configs/env.config";

export const hashPassword = (password) => {
  return bcrypt.hash(password, envConfig.SALT_ROUNDS);
};

export const comparePassword = (password, hashedPassword) => {
  return bcrypt.compare(password, hashedPassword);
};
