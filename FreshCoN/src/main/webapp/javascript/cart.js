const categorySelect = document.getElementById("category");

        categorySelect.addEventListener("change", function() {
            const selectedCategory = categorySelect.value;
            const targetSection = document.getElementById(selectedCategory);

            if (targetSection) {
                targetSection.scrollIntoView({
                    behavior: "smooth"
                });
            }
        });

        let cartCount = 0;
        const cart = {};

        function addToCart(productName, productPrice, quantity) {
            if (cart[productName]) {
                cart[productName].quantity += parseInt(quantity);
            } else {
                cart[productName] = {
                    price: productPrice,
                    quantity: parseInt(quantity)
                };
            }
            updateCartCount();
        }

        function updateCartCount() {
            cartCount = Object.keys(cart).reduce((sum, key) => sum + cart[key].quantity, 0);
            document.querySelector('.cart-count').innerText = cartCount;
        }

        function openCart() {
            const cartItems = document.getElementById('cart-items');
            const cartTotalElement = document.getElementById('cart-total');
            cartItems.innerHTML = '';
            let total = 0;

            Object.keys(cart).forEach(product => {
                const productTotal = cart[product].quantity * cart[product].price;
                total += productTotal;
                cartItems.innerHTML += `<div>${product}: ${cart[product].quantity} x ${cart[product].price}/=</div>`;
            });

            cartTotalElement.innerText = `Total: ${total}/=`;
            document.getElementById('cart-modal').style.display = 'block';
        }

        function closeCart() {
            document.getElementById('cart-modal').style.display = 'none';
        }

        function clearCart() {
            Object.keys(cart).forEach(product => delete cart[product]);
            updateCartCount();
            closeCart();
        }

        function checkToPay() {
            if (cartCount > 0) {
                alert('Redirecting to payment page...');

            } else {
                alert('Your cart is empty. Please add items to your cart before checking out.');
            }
        }