package ua.contactbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ua.contactbook.domain.Contact;
import ua.contactbook.domain.Group;
import ua.contactbook.service.ContactService;

@Controller
public class MyController {
    static final int DEFAULT_GROUP_ID = -1;
    static final int ITEMS_PER_PAGE = 6;

    @Autowired
    private ContactService contactService;

    @RequestMapping("/")
    public String index(Model model, @RequestParam(required = false, defaultValue = "0") Integer page) {
        if (page < 0) page = 0;

        long totalCount = contactService.count();
        int start = page * ITEMS_PER_PAGE;
        long pageCount = (totalCount / ITEMS_PER_PAGE) +
                ((totalCount % ITEMS_PER_PAGE > 0) ? 1 : 0);

        model.addAttribute("groups", contactService.listGroups());
        model.addAttribute("contacts", contactService.listContacts(null, start, ITEMS_PER_PAGE));
        model.addAttribute("pages", pageCount);

        return "index";
    }

    @RequestMapping("/contact_add_page")
    public String contactAddPage(Model model) {
        model.addAttribute("groups", contactService.listGroups());
        return "contact_add_page";
    }

    @RequestMapping("/group_add_page")
    public String groupAddPage() {
        return "group_add_page";
    }

//    @RequestMapping("/contact-edit-{id}")
//    public String contactEditPage ( Model model){
//        model.addAttribute("groups", contactService.listGroups());
//        return "contact_edit_page";
//    }

    @RequestMapping("/group/{id}")
    public String listGroup(@PathVariable(value = "id") long groupId, Model model) {
        Group group = (groupId != DEFAULT_GROUP_ID) ? contactService.findGroup(groupId) : null;

        model.addAttribute("groups", contactService.listGroups());
        model.addAttribute("contacts", contactService.listContacts(group));

        return "index";
    }
//
//    @RequestMapping(value = "/contact/delete", method = RequestMethod.POST)
//    public ResponseEntity<Void> delete(@RequestParam(value = "toDelete[]", required = false) long[] toDelete) {
//        if (toDelete != null && toDelete.length > 0)
//            contactService.deleteContact(toDelete);
//
//        return new ResponseEntity<>(HttpStatus.OK);
//    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam String pattern, Model model) {
        model.addAttribute("groups", contactService.listGroups());
        model.addAttribute("contacts", contactService.searchContacts(pattern));
        return "index";
    }

    @RequestMapping(value="/contact/add", method = RequestMethod.POST)
        public String contactAdd(@RequestParam(value = "group") long groupId,
        @RequestParam String name,
        @RequestParam String surname,
        @RequestParam String phone,
        @RequestParam String email)
        {
            Group group = (groupId != DEFAULT_GROUP_ID) ? contactService.findGroup(groupId) : null;

            Contact contact = new Contact(group, name, surname, phone, email);
            contactService.addContact(contact);

            return "redirect:/";
    }

    @RequestMapping(value = "/contact-delete-{id}", method = RequestMethod.GET)
    public String deleteContact(@PathVariable long id) {
        contactService.deleteContact(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/contact-edit-{id}", method = RequestMethod.GET)
    public String getEdit(@PathVariable long id, ModelMap model) {
        Contact editContact = (Contact) contactService.getContactByID(id);
//        model.addAttribute("groups", contactService.listGroups());
        model.addAttribute("name", editContact.getName());
//        model.addAttribute("surname", editContact.getSurname());
//        model.addAttribute("phone", editContact.getPhone());
//        model.addAttribute("email", editContact.getEmail());

        return "contact_edit_page";
    }

    @RequestMapping(value="/contact-edit-{id}", method = RequestMethod.POST)
    public String contactEdit(@RequestParam(value = "group") long groupId,
                             @RequestParam String name,
                             @RequestParam String surname,
                             @RequestParam String phone,
                             @RequestParam String email) {
        Group group = (groupId != DEFAULT_GROUP_ID) ? contactService.findGroup(groupId) : null;

        Contact contact = new Contact(group, name, surname, phone, email);
        contactService.edit(contact);

        return "redirect:/";
    }

    @RequestMapping(value="/group/add", method = RequestMethod.POST)
    public String groupAdd(@RequestParam String name) {
        contactService.addGroup(new Group(name));
        return "redirect:/";
    }
}
