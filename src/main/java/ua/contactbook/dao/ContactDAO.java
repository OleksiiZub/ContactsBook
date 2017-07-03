package ua.contactbook.dao;

import ua.contactbook.domain.Contact;
import ua.contactbook.domain.Group;

import java.util.List;

public interface ContactDAO {
    void add(Contact contact);
    void edit(Contact contact);
    void delete(long ids);
    Contact getContactByID(long ids);
    List<Contact> list(Group group, int start, int count);
    List<Contact> list(String pattern);
    long count();
}
