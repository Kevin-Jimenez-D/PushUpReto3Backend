package com.example.FiltroSpringBoot.Web.Controller;

import com.example.FiltroSpringBoot.Domain.Exceptions.EndpointException;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RestController
@CrossOrigin("*")
@PreAuthorize("hasRole('ADMIN')")
@SecurityRequirement(name = "bearerAuth")
public class EndpointsFilterController {
    List<String> allowedEndpoints = new ArrayList<>(Arrays.asList(
            "customers", "employees", "gamaproducts", "offices",
            "orders", "orderdetails", "payments", "products", "validateToken"
    ));

    @GetMapping("/{endpoint}")
    public void handleEndpoints(@PathVariable String endpoint) {
        if (!allowedEndpoints.contains(endpoint))
            throw new EndpointException("Endpoint '" + endpoint + "' doesn't exist in the API");
    }
}
