import { z } from "zod";

export const registerSchema = z.object({
  first_name: z
    .string()
    .trim()
    .min(2, "First name must be at least 2 characters")
    .max(100),

  last_name: z
    .string()
    .trim()
    .max(100)
    .optional(),

  email: z
    .email("Invalid email address")
    .transform((email) => email.toLowerCase()),

  password_hash: z
    .string()
    .min(8)
    .max(100)
    .regex(/[A-Z]/, "Must contain an uppercase letter")
    .regex(/[a-z]/, "Must contain a lowercase letter")
    .regex(/[0-9]/, "Must contain a number")
    .regex(/[!@#$%^&*]/, "Must contain a special character"),

  phone_number: z
    .string()
    .regex(/^[0-9]{10}$/)
    .optional()
});

