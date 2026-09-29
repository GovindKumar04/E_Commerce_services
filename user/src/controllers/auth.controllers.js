import { pool } from "../configs/db.config";
import { asyncHandler } from "../utils/asyncHandler.utils";



export const register = asyncHandler(async (req , res ) => {
    const {first_name, last_name, email, phone_number, password} = req.body;

    const existing_user = await pool.query(`SELECT email FROM users WHERE email= $1`);
})