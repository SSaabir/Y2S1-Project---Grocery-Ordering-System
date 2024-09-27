<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <title>Document</title>

        <style>
            .data {
                display: flex;
                flex-wrap: wrap;

            }

            .data-box {
                display: flex;
                border-radius: 20px;
                color: white;
                padding: 30px;
                margin: 20px;
            }

            #box1 {
                background-color: #003285;
            }

            #box2 {
                background-color: #2A629A;
            }

            #box3 {
                background-color: #FF7F3E;
            }

            #box4 {
                background-color: #E5D9F2;
            }

            #box5 {
                background-color: #E5D9F2;
            }
        </style>


    </head>

    <body>
        <header>
            <jsp:include page="header.jsp" />
        </header>
        
        <!--Side Navigation-->
        <div id="side-nav">
            <a class="active" href="dashboard.jsp"><span class="material-symbols-outlined">
                    dashboard
                </span>Dashboard</a>
            <a href="CustDash.jsp"><span class="material-symbols-outlined">
                    groups
                </span> Customer</a>
            <a href="OrderDash.jsp"><span class="material-symbols-outlined">
                    shopping_bag
                </span> Order</a>
            <a href="EmpDash.jsp"><span class="material-symbols-outlined">
                    badge
                </span> Employee</a>
            <a href="CatDash.jsp"><span class="material-symbols-outlined">
                    category
                </span> Category</a>
            <a href="ProDash.jsp"><span class="material-symbols-outlined">
                    inventory_2
                </span> Product</a>
            <a href="FeedDash.jsp"><span class="material-symbols-outlined">
                    feedback
                </span> Feedback</a>
            <a href="EnqDash.jsp"><span class="material-symbols-outlined">
                    support
                </span> Enquiry</a>
            <a href="PayDash.jsp"><span class="material-symbols-outlined">
                    payments
                </span> Payment </a>
        </div>


        <div id="main">
            <section class="data">
                <div class="data-box" id="box1">
                    <span class="material-symbols-outlined">
                        inventory
                    </span>
                    <h2>&nbsp;&nbsp;Order</h2>
                    <h1>nmbrs</h1>
                </div>

                <div class="data-box" id="box2">
                    <span class="material-symbols-outlined">
                        crowdsource
                    </span>
                    <h2>&nbsp;&nbsp;Customer</h2>
                    <h1>nmbrs</h1>
                </div>

                <div class="data-box" id="box3">
                    <span class="material-symbols-outlined">
                        paid
                    </span>
                    <h2>&nbsp;&nbsp;Spending</h2>
                    <h1>nmbrs</h1>
                </div>

                <div class="data-box" id="box4">
                    <span class="material-symbols-outlined">
                        list_alt
                    </span>
                    <h2>&nbsp;&nbsp;Inventory</h2>
                    <h1>nmbrs</h1>
                </div>

                <div class="data-box" id="box5">
                    <span class="material-symbols-outlined">
                        monitoring
                    </span>
                    <h2>&nbsp;&nbsp;Earning</h2>
                    <h1>nmbrs</h1>
                </div>

            </section>



            <section class="graph">
                <div class="graph-box" id="graph1">
                    <h1>jingles</h1>
                </div>

                <div class="graph-box" id="graph2">
                    <h1>jingles</h1>
                </div>

            </section>
        </div>
        <footer>
            <jsp:include page="footer.jsp" />
        </footer>

    </body>

    </html>