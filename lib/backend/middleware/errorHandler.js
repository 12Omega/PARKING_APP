function errorHandler(err, req, res, next) {
  let statusCode = err.statusCode || 500;
  let message = err.message || "Server Error";

  if (err.name === "ValidationError") {
    statusCode = 400;
    message = Object.values(err.errors)
      .map((error) => error.message)
      .join(", ");
  } else if (err.name === "CastError") {
    statusCode = 400;
    message = "Invalid ID format";
  } else if (err.name === "DocumentNotFoundError") {
    statusCode = 404;
    message = "Resource not found";
  }

  // Log the error, especially for 500 errors
  if (statusCode === 500) {
    console.error("Server Error:", err);
  } else {
    console.error(err.name + ":", message);
  }


  res.status(statusCode).json({ message });
}

module.exports = errorHandler;
