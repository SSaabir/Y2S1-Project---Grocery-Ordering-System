<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fresh Co</title>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>

    <div class="header">
      <div class="col-3">
        <div class="search-container">
            <form action="">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
      </div>
      <div class="col-3">
        <h1>Product Items</h1>
      </div>
      <div class="col-3">
        <div id="category-container"></div>
            <label for="category">Choose a category: </label>
            <select id="category" name="category">
                <option value="fruits">Fruits</option>
                <option value="vegetables">Vegetables</option>
                <option value="meats">Meats</option>
                <option value="soft-drinks">Soft Drinks</option>
            </select>
        </div>
        <div class="cart-icon" onclick="openCart()">
        <a href="Fruits.html"><i class="fas fa-shopping-cart"></i></a>
        <span class="cart-count">0</span>
      </div>
      </div>
      

        

        
    </div>

    <section>
        
        <div class="product-list" id="vegetables">
            <div class="product-box">
                <img src="images/potato.png" alt="Fresh Potato" />
                <strong>Potato</strong>
                <span class="Quantity">1kg</span>
                <input type="number" min="1" value="1" class="quantity-input" />
                <span class="price" data-price="253">253/=</span>
                <div class="cart-button" onclick="addToCart('Potato', 253, this.parentNode.querySelector('.quantity-input').value)">Add to Cart</div>
            </div>
        </div>
        <div class="product-list" id="vegetables">
            <div class="product-box">
                    <img src="images/potato.png" alt="Fresh Potato" />
                    <strong>Potato</strong>
                    <span class="Quantity">1kg</span>
                    <input type="number" min="1" value="1" class="quantity-input" />
                    <span class="price" data-price="253">253/=</span>
                    <div class="cart-button" onclick="addToCart('Potato', 253, this.parentNode.querySelector('.quantity-input').value)">Add to Cart</div>
                </div>
        </div>
        <div class="product-list" id="vegetables">
                <div class="product-box">
                        <img src="images/potato.png" alt="Fresh Potato" />
                        <strong>Potato</strong>
                        <span class="Quantity">1kg</span>
                        <input type="number" min="1" value="1" class="quantity-input" />
                        <span class="price" data-price="253">253/=</span>
                        <div class="cart-button" onclick="addToCart('Potato', 253, this.parentNode.querySelector('.quantity-input').value)">Add to Cart</div>
                </div>
        </div>


       

    </section>

    <div id="cart-modal">
        <h2>Your Cart</h2>
        <div id="cart-items"></div>
        <div id="cart-total"></div>
        <button onclick="clearCart()">Clear Choices</button>
        <button onclick="checkToPay()">Check to Pay</button>
        <button onclick="closeCart()">Close Cart</button>
    </div>
    <script type="text/javascript" src="./javascript/cart.js"></script>
</body>

</html>