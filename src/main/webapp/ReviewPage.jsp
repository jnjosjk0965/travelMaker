<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Write a Review</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f8f8;
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .review-container {
      background-color: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 50%;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #555;
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    button {
      background-color: #3498db;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<div class="review-container">
  <h1>Write a Review</h1>

  <label for="username">Your Name:</label>
  <input type="text" id="username" name="username" required>

  <label for="rating">Rating:</label>
  <input type="number" id="rating" name="rating" min="1" max="5" required>

  <label for="comment">Your Review:</label>
  <textarea id="comment" name="comment" rows="4" required></textarea>

  <button type="submit">Submit Review</button>
</div>

</body>
</html>
    