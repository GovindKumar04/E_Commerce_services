import { ApiError } from "../utils/ApiError.utils.js";

export const errorHandler = (err, req, res, next) => {
  let error = err;

 
  if (!(error instanceof ApiError)) {
    error = new ApiError(
      error.statusCode || 500,
      error.message || "Internal Server Error"
    );
  }

 
  switch (err.code) {
    case "23505":
      error = new ApiError(409, "Resource already exists");
      break;

    case "23503":
      error = new ApiError(400, "Referenced resource does not exist");
      break;

    case "23502":
      error = new ApiError(400, `${err.column} is required`);
      break;

    case "22P02":
      error = new ApiError(400, "Invalid input format");
      break;
  }

  
  if (process.env.NODE_ENV !== "test") {
    console.error(err);
  }

  return res.status(error.statusCode).json({
    success: false,
    statusCode: error.statusCode,
    message: error.message,
    errors: error.errors || [],
    stack:
      process.env.NODE_ENV === "development"
        ? err.stack
        : undefined,
    timestamp: new Date().toISOString(),
  });
};