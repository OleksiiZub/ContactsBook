package ua.contactbook.service;

import ua.contactbook.domain.Contact;
import ua.contactbook.domain.Group;

import java.util.List;

public interface ContactService {
    void addContact(Contact contact);
    void edit(Contact contact);
    Contact getContactByID(long ids);
    void addGroup(Group group);
    void deleteContact(long ids);
    void deleteGroup(Group group);
    List<Group> listGroups();
    List<Contact> listContacts(Group group, int start, int count);
    List<Contact> listContacts(Group group);
    long count();
    Group findGroup(long id);
    List<Contact> searchContacts(String pattern);
}
