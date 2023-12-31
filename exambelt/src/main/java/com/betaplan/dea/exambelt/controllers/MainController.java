package com.betaplan.dea.exambelt.controllers;

import com.betaplan.dea.exambelt.models.LoginUser;
import com.betaplan.dea.exambelt.models.User;
import com.betaplan.dea.exambelt.models.Yoga;
import com.betaplan.dea.exambelt.services.UserService;
import com.betaplan.dea.exambelt.services.YogaService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController{

    @Autowired
    private UserService userServ;

    @Autowired
    private YogaService yogaServ;

    @GetMapping("/")
    public String index(Model model) {

        // Bind empty User and LoginUser objects to the JSP to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";

    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {

        User user = (User) userServ.register(newUser, result);

        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/classes";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {

        User user = (User) userServ.login(newLogin, result);

        if(result.hasErrors() || user==null) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/classes";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        // Set userId to null and redirect to login/register page
        session.setAttribute("userId", null);

        return "redirect:/";
    }

    @GetMapping("/classes")
    public String welcome(HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        List<Yoga> yogas = yogaServ.allYogas();
        model.addAttribute("yogas", yogas);

        return "classes.jsp";
    }

    @GetMapping("/new")
    public String addYoga(@ModelAttribute("yoga") Yoga yoga, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        return "newClass.jsp";
    }

    @PostMapping("/new")
    public String addYoga(@Valid @ModelAttribute("yoga") Yoga yoga, BindingResult result, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "newClass.jsp";
        }else {
            yogaServ.addYoga(new Yoga(yoga.getName(), yoga.getWeekday(), yoga.getPrice(), yoga.getDescription(), userServ.findById(userId)));
            return "redirect:/classes";
        }
    }

    @GetMapping("/classes/{id}")
    public String showYogas(@PathVariable("id") Long id, HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        model.addAttribute("user", userServ.findById(userId));

        Yoga yoga = yogaServ.findYoga(id);
        model.addAttribute("yoga", yoga);

        return "viewClass.jsp";
    }

    @GetMapping("/classes/edit/{id}")
    public String edit(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Yoga yoga = yogaServ.findYoga(id);
        model.addAttribute("yoga", yoga);
        return "editClass.jsp";
    }

    @PutMapping("/classes/edit/{id}")
    public String update(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("yoga") Yoga yoga,
            BindingResult result,
            HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "editClass.jsp";
        }else {
            yogaServ.updateYoga(yoga);
            return "redirect:/classes";
        }
    }

    @RequestMapping("/classes/delete/{id}")
    public String deleteYoga(@PathVariable("id") Long id, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        yogaServ.deleteYoga(yogaServ.findYoga(id));

        return "redirect:/classes";
    }
}