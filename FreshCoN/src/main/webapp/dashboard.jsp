<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fresh Co</title>

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
    
<jsp:include page = "Dash.jsp"/>

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
<%String userType = (String) session.getAttribute("userType");%>


            <section class="graph">
                <div class="graph-box" id="graph1">
                    <h1> <%= userType %></h1>
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