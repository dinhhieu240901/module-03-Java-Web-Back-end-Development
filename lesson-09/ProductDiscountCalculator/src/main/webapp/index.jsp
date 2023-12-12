<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
  <style>
    body {
      font-family:Arial, sans-serif;
      margin :0;
      padding: 0;
      background-color:#f0f0f0;
    }
    h2 {
      color:#333;
      text-align:center;
      margin-top:50px;
    }
    form {
      max-width:500px;
      margin:50px auto;
      padding:20px;
      background-color:#fff;
      border-radius:5px;
      box-shadow:0 0 10px rgba(0,0,0,0.1);
    }
    p {
      margin:20px 0;
    }
    input[type=text], input[type=number] {
    box-sizing: border-box;

      width:calc(100% - 20px);
      padding:10px;
      border:1px solid #ddd;
      border-radius:5px;
    }
    input[type=submit] {
      background-color:#4CAF50;
      color:white;
      padding:10px 20px;
      border:none;
      border-radius:5px;
      cursor:pointer;
    }
    input[type=submit]:hover {
      background-color:#45a049;
    }
  </style>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="${pageContext.request.contextPath}/display-discount" method="post">
  <p>Product Description: <input type="text" name="description"></p>
  <p>List Price: <input type="number" name="price"></p>
  <p>Discount Percent: <input type="number" name="percent"></p>
  <p><input type="submit" value="Calculate Discount"></p>
</form>
</body>
</html>
