package controller;


import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import service.StripeService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/paymentform")
public class StripeController {

    Logger logger = Logger.getLogger(StripeController.class);

    @GetMapping
    public String getPaymentForm() {
        return "paymentform";
    }

    @PostMapping
    public void createCharge(@RequestParam("stripeToken") String tokenId, ModelMap modelMap) {
        Stripe.apiKey = StripeService.TEST_APIKEY;

        try {
            Map<String, Object> chargeParam = new HashMap<>();
            chargeParam.put("currency", "usd");
            chargeParam.put("source", tokenId);
            chargeParam.put("amount", StripeService.TEST_AMOUNT);
            chargeParam.put("description", "Test charge");

            Charge.create(chargeParam);
            modelMap.addAttribute("response", "The transaction is successful!");
        } catch (StripeException exc){

            logger.debug("Charge exception.", exc);
            modelMap.addAttribute("response", exc.getMessage());
        }

    }
}
