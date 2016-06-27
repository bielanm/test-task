<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
  <head>
    <title>Payment Form</title>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
    <link rel="stylesheet" href="/resources/css/paymentform.css">

    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
  </head>
  <body>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

        <div class="container">
          <div id="Checkout" class="inline">
              <h1>Pay Invoice</h1>
              <div class="card-row">
                  <span class="visa"></span>
                  <span class="mastercard"></span>
                  <span class="amex"></span>
                  <span class="discover"></span>
              </div>
              <form action="/paymentform" method="POST" id="payment-form">
                  <span class="payment-errors">${response}</span>

                  <div class="form-group">
                      <label for="PaymentAmount">Payment amount</label>
                      <div class="amount-placeholder">
                          <span>$</span>
                          <span>10.00</span>
                      </div>
                  </div>
                  <div class="form-group">
                      <label for="CreditCardNumber">Card number</label>
                      <input id="CreditCardNumber" class="null card-image form-control" type="text" data-stripe="number">
                  </div>
                  <div class="expiry-date-group form-group">
                      <label for="ExpiryMonth">Expiry month</label>
                      <input id="ExpiryMonth" class="form-control" type="text" placeholder="MM" maxlength="2" type="text" data-stripe="exp_month">
                      <label for="ExpiryYear">Security Code</label>
                      <div class="input-container" >
                          <input id="SecurityCode" class="form-control" type="text" data-stripe="cvc"/>
                          <i id="cvc" class="fa fa-question-circle"></i>
                      </div>
                  </div>
                  <div class="security-code-group form-group">
                      <label for="SecurityCode">Expiry year</label>
                      <input id="ExpiryYear" class="form-control" type="text" placeholder="YY" maxlength="4" type="text" data-stripe="exp_year">
                      <div class="cvc-preview-container two-card hide">
                          <div class="amex-cvc-preview"></div>
                          <div class="visa-mc-dis-cvc-preview"></div>
                      </div>
                  </div>
                  <button id="PayButton" class="btn btn-block btn-success submit-button" type="submit">
                      <span class="submit-button-lock"></span>
                      <span class="align-middle">Pay $10.00</span>
                  </button>
              </form>

          </div>
        </div>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
        <script src="/resources/js/paymentform.js"></script>
  </body>
</html>
